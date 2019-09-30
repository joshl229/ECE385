module m_PCMUX  (
					input logic [15:0] ADDER,
					input logic [15:0] BUS,
					input logic [15:0] PC1,
					input logic [1:0] Select,
					output logic [15:0] Output
					);
					
always_comb 
	begin
		case(Select)
	
		2'b00:
			Output = PC1;
	
		2'b01:
			Output = BUS;
		
		2'b10:
			Output = ADDER;
		
		2'b11:
			Output = 16'b0000000000000000;
		endcase
	end

endmodule

module m_DRMUX ( 
					input logic [2:0] IR,
					input logic Select,
					output logic [2:0] Output
				 );
				 
always_comb
	begin
		case(Select)
		
		1'b0:
			Output = IR;
		
		1'b1:
			Output = 3'b111;
			
		endcase
	end

endmodule


module m_SR1MUX (
						input logic [2:0] IR11,
						input logic [2:0]	IR8,
						input logic Select,
						output logic [2:0] Output
						);
						
always_comb
	begin
		case(Select)
		
		1'b0: 
			Output = IR11;
		1'b1:
			Output = IR8;
			
		endcase
	end
	
endmodule

