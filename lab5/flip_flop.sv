// Flip flop to store A's sign extension
module flip_flop(input logic clk,
									  load, 
									  reset,
									  in,
						output logic out);
						
		always_ff @(posedge clk or posedge reset)
					begin
							if(reset)
							begin
								out = 0;
							end
							
							else if(load) 
							begin
								out = in;
							end
							
							else
							begin
								out = out;
							end
					end
endmodule
								
									