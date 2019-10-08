module NZP(input logic Clk, NIn, ZIn, PIn, LD_CC,
				output logic NOut, ZOut, POut);
				
				always_ff @ (posedge Clk)
					begin
						if(LD_CC) 
							begin 
								NOut <= NIn;
								ZOut <= ZIn;
								POut <= PIn;
								
							end
							
					end
endmodule 
