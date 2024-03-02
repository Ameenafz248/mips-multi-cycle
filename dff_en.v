module dff_en #(parameter WIDTH = 64) (input clk, reset, en, input [WIDTH - 1: 0] d, output reg [WIDTH - 1: 0] q);

always @(posedge clk) begin
    if (reset) begin
        q <= 'd0;
    end
    else begin
        if (en) begin
            q <= d;
        end
        else begin
            q <= q;
        end
    end
end
endmodule
