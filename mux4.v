module mux4 #(parameter WIDTH = 8) (input [WIDTH - 1 : 0] in1, in2, in3, in4,
                                input [1:0] sel,
                                output [WIDTH - 1 : 0] out  
                    );
    assign out = (sel == 2'b00) ? in1 : (sel == 2'b01) ? in2 : (sel == 2'b10) ? in3 : in4;
endmodule