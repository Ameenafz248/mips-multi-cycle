module alu_decoder(input [5:0] func, input [1:0] ALUOp, output reg [2:0] ALUControl);
    always @(*) begin
        if (ALUOp == 2'b00) begin
            ALUControl = 3'b010;
        end
        else if (ALUOp == 2'b01) begin
            ALUControl = 3'b110;
        end
        else begin
            if (func == 6'b100000) begin
                ALUControl = 3'b010;
            end
            else 
                ALUControl = 3'b110;
        end
    end
endmodule