module tb;
reg clk;
reg reset;
integer i;
wire [63:0] writedata, memaddr, readdata, instr;
wire memwrite;
// instantiate device to be tested
top dut(clk, reset, writedata, memaddr, memwrite, readdata, instr);// initialize test
initial
begin
$monitor("%t %b readdata: %h  memaddr: %h instr: %h", $time, clk, readdata, memaddr, instr);
reset <= 1; # 15; reset <= 0;
end
// generate clock to sequence tests
always
begin
clk <= 1; # 5; clk <= 0; # 5;
end
// check results
initial
    #200 $finish;
endmodule