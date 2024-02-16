module datapath(input clk, reset,
                input MemtoReg, PCSrc, ALUSrc, RegDst, RegWrite, 
                input [2:0] ALUControl,
                input [63:0] readdata,
                input [31:0] instr,
                output zero,
                output [63:0] pc,
                output [63:0] aluout, writedata 
                );

    //register logic
    wire [4:0] wa3;
    wire [63:0] rd1, rd2, wd3;
    mux2 #(5) muxwa3(instr[20:16], instr[15:11], RegDst, wa3);
    mux2 #(64) muxwd3(aluout, readdata, MemtoReg, wd3);
    regfile rf(.clk(clk), .ra1(instr[25:21]), .ra2(instr[20:16]), .wa3(wa3), .wd3(wd3), .rd1(rd1), .rd2(writedata));

    //next pc logic
    wire [63:0] extended_immediate;
    sign_extend se(.in(instr[15:0]), .out(extended_immediate));
    wire [63:0] shifted_immediate;
    sl2 sl(.in(extended_immediate), .out(shifted_immediate));
    wire [63:0] pcplus4, nextpc, nextbr;
    adder #(64) ad1(pc, 64'b100, pcplus4);
    adder #(64) ad2(pcplus4, shifted_immediate, nextbr);
    mux2 #(64) mux_nextpc(pcplus4, nextbr, PCSrc, nextpc);
    set_pc sp(clk, reset, nextpc, pc);
    


    //ALU logic
    wire [63:0] SrcB; 
    mux2 #(64) mux_aluop(rd2, extended_immediate, ALUSrc, SrcB);
    alu alu_inst(.in1(rd1), .in2(SrcB), .ALUControl(ALUControl), .out(aluout), .zero(zero));
endmodule


module set_pc(input clk, reset, input [63:0] nextpc, output reg [63:0] pc);
    always @(posedge clk) begin
        if (reset) begin
            pc <= 64'b0;
        end
        else
            pc = nextpc;
    end
endmodule