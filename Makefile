objects =  tb.v controller.v main_decoder.v alu_decoder.v regfile.v mux2.v sign_extend.v sl2.v  adder.v alu.v datapath.v mips.v  mem.v top.v mux4.v  dff.v dff_en.v

build:
	iverilog -o out -g 2012 $(objects)

clean:
	rm out