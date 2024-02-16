module mips(input clk, reset, 
            output [63:0] pc,
            input [31:0] instr,
            output MemWrite,
            output [63:0] aluout, writedata,
            input [63:0] readdata
            );
        
        wire zero, MemtoReg, ALUSrc, PCSrc, RegDst, RegWrite;
        wire [2:0] ALUControl;
        controller c(.op(instr[31:26]), .func(instr[5:0]), .zero(zero), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc),
        .PCSrc(PCSrc), .RegDst(RegDst), .RegWrite(RegWrite), .ALUControl(ALUControl));
        datapath d(clk, reset, MemtoReg, PCSrc, ALUSrc, RegDst, RegWrite, ALUControl, readdata, instr, zero, pc, aluout, writedata);
endmodule