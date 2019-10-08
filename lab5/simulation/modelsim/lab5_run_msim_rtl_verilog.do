transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/Synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/register.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/9bitadder.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/control_unit.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/flip_flop.sv}
vlog -sv -work work +incdir+C:/Users/joey3/Desktop/ECE385/lab5 {C:/Users/joey3/Desktop/ECE385/lab5/top_level.sv}

