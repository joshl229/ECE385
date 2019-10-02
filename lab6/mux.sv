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

module m_SR2MUX (
						input logic [15:0] SR2,
						input logic [15:0] SEXT,
						input logic Select,
						output logic [15:0] Output
						);
						
always_comb
	begin
		case(Select)
		
		1'b0: 
			Output = SR2;
		1'b1:
			Output = SEXT;
		
		endcase
	end
	
endmodule 

module m_ADDR1MUX (
							input logic [15:0] PC,
							input logic [15:0] SR1,
							input logic Select,
							output logic [15:0] Output
						);
						
always_comb 
	begin
		case(Select)
		
		1'b0:
			Output = PC;
		1'b1:
			Output = SR1;
			
		endcase
	end
	
endmodule 

module m_ADDR2MUX (
							input logic [15:0] IRoffset6,
							input logic [15:0] IRoffset9,
							input logic [15:0] IRoffset11,
							input logic [1:0] Select,
							output logic [15:0] Output
						);
						
always_comb
	begin
		case(Select)
		
		2'b00:
			Output = 16'b0000000000000000;
		2'b01:
			Output = IRoffset6;
		2'b10:
			Output = IRoffset9;
		2'b11:
			Output = IRoffset11;
			
		endcase
	end
	
endmodule 
							
module m_MDRMUX (
						input logic [15:0] BUS, 
						input logic [15:0] MEM2IO,
						input logic Select,
						output logic [15:0] Output
					);
					
always_comb
	begin
		case(Select)
		
		1'b0:
			Output = BUS;
		1'b1:
			Output = MEM2IO;
			
		endcase
	end
endmodule 

module m_GATES (
						input logic GateALU,
						input logic GateMARMUX,
						input logic GateMDR,
						input logic GatePC,
						input logic [15:0] aluoutput,marmuxoutput, mdroutput, pcoutput,
						input logic [3:0] Select,
						output logic [15:0] Output
					);
					
always_comb
	begin
		case(Select)
		
		4'b1000:
			Output = aluoutput;
		4'b0100:
			Output = marmuxoutput;
		4'b0010:
			Output = mdroutput;
		4'b0001:
			Output = pcoutput;
		default:
			Output = 16'b000000000000;
			
		endcase
	end
endmodule

