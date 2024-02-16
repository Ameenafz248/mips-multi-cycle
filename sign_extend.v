module sign_extend(input [15:0] in, output [63:0] out);
    assign out = {{48{in[15]}}, in};
endmodule