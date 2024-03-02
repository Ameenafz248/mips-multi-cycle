transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/main_decoder.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/mux2.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/alu_decoder.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/sign_extend.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/regfile.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/datapath.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/adder.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/top.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/controller.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/mips.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/alu.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/sl2.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/imem.v}
vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/dmem.v}

vlog -sv -work work +incdir+/home/ameenafz248/dev/mips-multi-cycle {/home/ameenafz248/dev/mips-multi-cycle/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbenchv1

add wave *
view structure
view signals
run -all
