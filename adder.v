module adder #(parameter WIDTH = 64) (input [WIDTH - 1 : 0] op1, op2, output [WIDTH - 1: 0] out);
    assign out = op1 + op2;
endmodule