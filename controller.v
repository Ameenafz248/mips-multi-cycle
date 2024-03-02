module controller(input clk, reset, zero, 
                  input [5:0] op, funct, 
                  output PCEn, IorD, MemWrite, IRWrite,  PCWrite, MemtoReg, RegDst, branch, PCSrc, ALUSrcA, RegWrite,
                  output [2:0] ALUControl, 
                  output [1:0] ALUSrcB
                );
            
        wire [1:0] ALUOp;

    main_decoder md(clk, reset, op, MemtoReg, RegDst, IorD, PCSrc, ALUSrcB, ALUSrcA, IRWrite, MemWrite, PCWrite, branch, RegWrite, ALUOp);
    alu_decoder ad(.func(funct), .ALUOp(ALUOp), .ALUControl(ALUControl));

    // assign PCSrc = branch & zero;       // take calculated branch if the instruction is branch instruction and comparison result is zero
    assign PCEn = (branch & zero) | PCWrite;
endmodule