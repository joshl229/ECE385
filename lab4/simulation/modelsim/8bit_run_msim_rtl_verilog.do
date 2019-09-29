transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/compute.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/Control.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/Reg_4.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/Router.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/Synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/Register_unit.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/Processor.sv}

vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab4/8bit {C:/Users/joey3/Desktop/ECE385/lab4/8bit/testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 2000 ns
