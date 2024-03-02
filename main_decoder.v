module main_decoder(input clk, reset, input [5:0] op, output reg MemtoReg, RegDst, IorD, PCSrc, output reg [1:0] ALUSrcB, output reg ALUSrcA, IRWrite, MemWrite, PCWrite, branch, RegWrite, output reg [1:0] ALUOp);

integer state, next_state;

parameter S0 = 'd0;         //fetch
parameter S1 = 'd1;         //Decode
parameter S2 = 'd2;         //MemAdr
parameter S3 = 'd3;         //MemRead
parameter S4 = 'd4;         //Mem WriteBack
parameter S5 = 'd5;         //MemWrite
parameter S6 = 'd6;         //Execute
parameter S7 = 'd7;         //ALU WriteBack
parameter S8 = 'd8;         //Branch
parameter S9 = 'd9;         //ADDI Execute
parameter S10 = 'd10;       //ADDI WriteBack

//sequential logic
always @(posedge clk) begin
    if (reset) begin
        state <= S0;
    end
    else begin
      state <= next_state;
    end
    $display("%d", state);
end


always @(*) begin
    case (state)
        S0: begin
            IorD <= 1'b0;
            ALUSrcA <= 1'b0;
            ALUSrcB <= 2'b01;
            ALUOp <= 2'b00;
            PCSrc <= 1'b0;
            IRWrite <= 1'b1;
            PCWrite <= 1'b1;
            RegWrite <= 1'b0;
            MemWrite <= 1'b0;
        end
        S1: begin
            ALUSrcA <= 1'b0;
            ALUSrcB <= 2'b11;
            ALUOp <= 2'b00;
            IRWrite <= 1'b0;
            PCWrite <= 1'b0;
        end
        S2: begin
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b10;
            ALUOp <= 2'b00;
        end
        S3: begin
            IorD <= 1'b1;
        end
        S4: begin
            RegDst <= 1'b0;
            MemtoReg <= 1'b1;
            RegWrite <= 1'b1;
        end
        S5: begin
            IorD <= 1'b1;
            MemWrite <= 1'b1;
        end
        S6: begin
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b00;
            ALUOp <= 2'b10;
        end
        S7: begin
            RegDst <= 1'b1;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
        end
        S8: begin
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b00;
            ALUOp <= 2'b01;
            PCSrc <= 1'b1;
            branch <= 1'b1;
        end
        S9: begin
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b10;
            ALUOp <= 2'b00;
        end
        S10: begin
            RegDst <= 1'b0;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
        end
    endcase
end


// finding next state
always @(state or op) begin
    next_state = S0;
    case (state) 
        S0: 
            next_state = S1;
        S1: 
            if (op == 6'b100011 || op == 6'b101011) begin
                next_state = S2;
            end
            else if (op == 6'b000000) begin
                next_state = S6;
            end
            else if (op == 6'b000100) begin
                next_state = S8;
            end
            else if (op == 6'b001000) begin
                next_state = S9;
            end
            else begin
                next_state = 6'bxxxxxx;
            end
        S2: 
            if (op == 6'b100011) begin
                next_state = S3;
            end
            else begin
                next_state = S5;
            end
        S3: 
            next_state = S4;
        S4: 
            next_state = S0;
        S5:
            next_state = S0;
        S6: 
            next_state = S7;
        S7:
            next_state = S0;
        S8:
            next_state = S0;
        S9:
            next_state = S10;
        S10:
            next_state = S0;
        default:
            next_state = 6'bxxxxxx;
    endcase
end
endmodule
