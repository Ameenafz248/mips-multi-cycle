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
reset <= 1; # 15; reset <= 0;
end
// generate clock to sequence tests
always
begin
clk <= 1; # 5; clk <= 0; # 5;
end
// check results
initial begin
    #2000 $finish;
end
initial
begin
    #20;
    forever begin
        #10;
        if (instr == 64'b0 && !reset) begin
            $finish;
        end
    end
end
endmodule