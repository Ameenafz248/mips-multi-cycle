module dmem(input clk, we, input [63:0] a, wd, output [63:0] rd);
    reg [63:0] MEM [63:0];
    assign rd = MEM[a[31:2]];

    always @(posedge clk) begin
        if (we) begin
            MEM[a[31:2]] = wd;
        end
    end
endmodule