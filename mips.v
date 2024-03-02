module mips(input clk, reset, 
            output MemWrite,
            output [63:0] memaddr, writedata, instr,
            input [63:0] readdata
            );
        
        wire zero, MemtoReg, ALUSrc, PCSrc, RegDst, RegWrite;
        wire [2:0] ALUControl;
        wire [1:0] ALUSrcB;
        controller c(clk, reset, zero, instr[31:26], instr[5:0], PCEn, IorD, MemWrite, IRWrite, PCWrite, MemtoReg, RegDst, Branch, PCSrc,  ALUSrcA, RegWrite, ALUControl, ALUSrcB);
        datapath d(clk, reset, PCEn, IorD, MemWrite, IRWrite, PCWrite, MemtoReg, RegDst, Branch, PCSrc, ALUControl, ALUSrcB, ALUSrcA, RegWrite, readdata, instr, zero, writedata, memaddr);
endmodule