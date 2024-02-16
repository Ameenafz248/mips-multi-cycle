module regfile(input clk, we3, 
               input [4:0] ra1, ra2, wa3,
               input [63:0] wd3, 
               output [63:0] rd1, rd2
                );
    reg [63:0] REG [31:0];
    always @(posedge clk) begin
        if (we3) begin
            REG[wa3] <= wd3;
        end
    end
    assign rd1 = (ra1 != 0) ? REG[ra1]: 0;
    assign rd2 = (ra2 != 0) ? REG[ra2]: 0;
endmodule
