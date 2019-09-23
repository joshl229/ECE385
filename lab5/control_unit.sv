module control_unit(
							input run,
							input clrA_ldB,
							input clk,
							input reset,
							input M,
							output logic clr_ld,
							output logic shift,
							output logic add, 
							output logic sub);
							
							
							enum logic [4:0] {start, halt, clear_a, one, two, three, four, five, 
													six, seven, eight, shiftOne, shiftTwo, shiftThree, 
													shiftFour, shiftFive, shiftSix, shiftSeven,
													shiftEight} current_state, next_state;
							
							always_ff @ (posedge Clk or posedge reset)
							begin
							
		