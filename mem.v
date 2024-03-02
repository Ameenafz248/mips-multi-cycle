module mem(input clk, we, input [63:0] a, wd, output [63:0] rd);
    reg [63:0] MEM [63:0];
    assign rd = a[2]? (MEM[a[63:3]] >> 32) | (MEM[a[63:3] + 1] << 32) : MEM[a[63:3]];

    initial begin 
        $readmemh("/home/ameenafz248/dev/mips-multi-cycle/data.txt", MEM, 0, 63);
    end

    always @(posedge clk) begin
        if (we) begin
            MEM[a[63:3]] = wd;
        end
        $writememh("/home/ameenafz248/dev/mips-multi-cycle/data.txt", MEM, 0, 63);
    end
endmodule
