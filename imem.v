module imem(input [5:0] addr, output [31:0] instr);
    reg [31:0] MEM [63:0];
    initial begin
        $readmemh("/home/ameenafz248/dev/mips-multi-cycle/instr.txt", MEM, 0, 63);
    end
    assign instr = MEM[addr];
endmodule