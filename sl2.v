module sl2(input [63:0] in, output [63:0] out);
    assign out = (in << 2);
endmodule