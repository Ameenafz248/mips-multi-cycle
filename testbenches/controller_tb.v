module tb;

reg [5:0] op, func;
reg zero;
wire MemtoReg, MemWrite,   ALUSrc, PCSrc, RegDst, RegWrite;
output [2:0] ALUControl;

controller ctrl(op, func, zero, MemtoReg, MemWrite, ALUSrc, PCSrc, RegDst, RegWrite, ALUControl);

initial begin
    $monitor("op: %b func: %b zero: %b  control: %b%b%b%b%b%b%b", op, func, zero, MemtoReg, MemWrite,   ALUSrc, PCSrc, RegDst, RegWrite, ALUControl);
end

initial begin
    op = 6'd0;
    zero = 1'b0;
    func = 6'b100000;
    #10;
    func = 6'b100010;
    #10;
    op = 6'd4;
    #10;
    zero = 1'b1;
    #10;
    op = 6'b100011;
    #10;
    op = 6'b101011;
    #10;
    op = 6'b001000;
    #10;
    $finish;
    
end
endmodule