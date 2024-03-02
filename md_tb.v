
module tb;
reg clk;
reg reset;
integer i;
reg [5:0] op;
reg MemtoReg, IorD, PCSrc, ALUSrcA, IRWrite, MemWrite, PCWrite, branch, RegWrite;
reg [1:0] ALUSrcB, ALUOp;
// instantiate device to be tested

main_decoder md(clk, reset, op, MemtoReg, RegDst, IorD, PCSrc, ALUSrcB, ALUSrcA, IRWrite, MemWrite, PCWrite, branch, RegWrite, ALUOp);

initial
begin
$monitor("%b %b %b %b %b %b %b %b %b %b %b %b", MemtoReg, RegDst, IorD, PCSrc, ALUSrcB, ALUSrcA, IRWrite, MemWrite, PCWrite, branch, RegWrite, ALUOp);
reset <= 1; 
op <= 6'b000000;
# 5; 
reset <= 0;

end
// generate clock to sequence tests
always
begin
clk <= 1; # 5; clk <= 0; # 5;
end
// check results
initial
    #100 $finish;
endmodule