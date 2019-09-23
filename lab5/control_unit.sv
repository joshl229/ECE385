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
							
							always_ff @ (posedge clk or posedge reset)
							begin
								if (reset)
									current_state <= start;
								else
									current_state <= next_state;
							end
							
							
							// Next-State Logic
							always_comb 
							begin
							
								next_state = current_state; // Base case - Shouldn't happen
								
								unique case(current_state)
									
									start: if(run)
												next_state = clear_a; // Clear A starts the execute cycle
												
									clear_a: next_state = one; 
									
									one: next_state = shiftOne;
										shiftOne: next_state = two;
									two: next_state = shiftTwo;
										shiftTwo: next_state = three; 
									three: next_state = shiftThree;
										shiftThree: next_state = four;
									four: next_state = shiftFour;
										shiftFour: next_state = five;
									five: next_state = shiftFive;
										shiftFive: next_state = six;
									six: next_state = shiftSix;
										shiftSix: next_state = seven;
									seven: next_state = shiftSeven;
										shiftSeven: next_state = eight;
									eight: next_state = shiftEight;
										shiftEight: next_state = halt; // Halts operation when it finishes it's eighth shift
									
									halt: if(~run) // Goes back to the start cycle
											next_state = start;
											
								endcase
								end
								
								// Output logic
								always_comb
								begin
								case(current_state)
								
								start, halt: begin
												clr_ld = clrA_ldB;
												shift = 0;
												add = 0;
												sub = 0;
											 end
								
								clear_a: begin
											clr_ld = 1;
											shift = 0;
											add = 0; 
											sub = 0;
											end
								
								one, two, three, four, five, six, seven:
											begin
											clr_ld = 0;
											shift = 0;
											if (M)
												begin
												add = 1;
												sub = 0;
												end
											else
												begin
												add = 0;
												sub = 0;
												end
											end
											
								eight: begin
										clr_ld = 0;
										shift = 0;
										if (M)
											begin
											add = 0;
											sub = 1;
											end
										else
											begin
											add = 0;
											sub = 0;
											end
										end
								
								shiftOne, shiftTwo, shiftThree, shiftFour, shiftFive, shiftSix, shiftSeven, shiftEight:
									begin
									clr_ld = 0;
									shift = 1;
									add = 0;
									sub = 0;
									end
									
				
							endcase		
								end				
endmodule 					