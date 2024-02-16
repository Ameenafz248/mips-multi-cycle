objects =  tb.v controller.v main_decoder.v alu_decoder.v regfile.v mux2.v sign_extend.v sl2.v  adder.v alu.v datapath.v mips.v imem.v dmem.v top.v

build:
	iverilog -o out -g 2012 $(objects)

clean:
	rm out