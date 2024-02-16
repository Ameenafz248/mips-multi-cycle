module alu ( input [63:0] in1, in2, input [2:0] ALUControl,
             output reg [63:0] out, output reg zero
            );

    always @(*) begin
        if (ALUControl == 3'b010) begin
            out <= in1 + in2;
        end
        else begin
            out <= in1 - in2;
            zero <= (in1 == in2) ? 1 : 0;
        end
    end
endmodule