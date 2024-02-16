module imem(input [5:0] addr, output [31:0] instr);
    reg [31:0] MEM [63:0];
    initial begin
        $readmemh("instr.txt", MEM);
    end
    assign instr = MEM[addr];
endmodule