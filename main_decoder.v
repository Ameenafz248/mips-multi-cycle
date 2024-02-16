module main_decoder(input [5:0] op, 
                    output MemtoReg, MemWrite, ALUSrc, branch, RegDst, RegWrite,
                    output [1:0] ALUOp
                    );
    reg [7:0] control_sig;
    assign {MemtoReg, MemWrite, ALUSrc, branch, RegDst, RegWrite, ALUOp} = control_sig;
    always @(*) begin
    case (op) 
        6'b000000:  control_sig <= 8'b00001110;
        6'b001000:  control_sig <= 8'b00100100;
        6'b000100:  control_sig <= 8'b00010001;
        6'b100011:  control_sig <= 8'b10100100;
        6'b101011:  control_sig <= 8'b01100000;

    endcase
    end
endmodule