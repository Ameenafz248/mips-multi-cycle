module datapath(input clk, reset,
                input PCEn, IorD, MemWrite, IRWrite, PCWrite, MemtoReg, 
                RegDst, branch, PCSrc,
                input [2:0] ALUControl,
                input [1:0] ALUSrcB,
                input ALUSrcA, RegWrite, 
                input [63:0] readdata,
                output [63:0] instr,
                output zero,
                output [63:0] writedata, memaddr
                );


    wire [63:0] nextpc, pc, ALUOut, data, wd3, rd1, rd2, A, B, SrcA, SrcB, ext_immediate, shft_immediate;
    wire [4:0] a3;
    dff_en #(64) pc_reg(clk, reset, PCEn, nextpc, pc);
    mux2 #(64) addr_mux(pc, ALUOut, IorD, memaddr);

    dff_en #(64) instr_reg(clk, reset, IRWrite, readdata, instr);
    dff #(64) data_reg(clk, readdata, data);
    mux2 #(5) muxa3(instr[20:16], instr[15:11], RegDst, a3);
    mux2 #(64) muxwd3(ALUOut, data, MemtoReg, wd3);
    regfile rf(.clk(clk), .we3(RegWrite), .ra1(instr[25:21]), .ra2(instr[20:16]), .wa3(a3), .wd3(wd3), .rd1(rd1), .rd2(rd2));

    dff #(64) A_reg(clk, rd1, A);
    dff #(64) B_reg(clk, rd2, B);
    assign writedata = B;

    mux2 #(64) mux_srcA(pc, A, ALUSrcA, SrcA);


    sign_extend se(.in(instr[15:0]), .out(ext_immediate));
    sl2 sl(.in(ext_immediate), .out(shft_immediate));
    mux4 #(64) mux_srcB(B, 64'b100, ext_immediate, shft_immediate, ALUSrcB, SrcB);
    

    //alu
    wire [63:0] ALUResult;
    alu alu_inst(.in1(SrcA), .in2(SrcB), .ALUControl(ALUControl), .out(ALUResult), .zero(zero));
    dff #(64) alu_reg(clk, ALUResult, ALUOut);


    mux2 #(64) mux_nextpc(ALUResult, ALUOut, PCSrc, nextpc);

    
endmodule
