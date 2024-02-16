module controller(input [5:0] op, func, 
                    input zero, 
                    output MemtoReg, MemWrite, ALUSrc, PCSrc, RegDst, RegWrite,
                    output [2:0] ALUControl
                );
            
        wire branch;
        wire [1:0] ALUOp;

    main_decoder md(.op(op), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .branch(branch), .RegDst(RegDst), .RegWrite(RegWrite), .ALUOp(ALUOp));
    alu_decoder ad(.func(func), .ALUOp(ALUOp), .ALUControl(ALUControl));

    assign PCSrc = branch & zero;       // take calculated branch if the instruction is branch instruction and comparison result is zero
endmodule