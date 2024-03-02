module top (input clk, reset, output [63:0] writedata, memaddr, output MemWrite, output [63:0] readdata, instr);
    mips m(clk, reset, MemWrite, memaddr, writedata, instr, readdata);
    mem d(clk, MemWrite, memaddr, writedata, readdata);
endmodule