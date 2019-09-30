module datapath(
						input logic Clk,
						input logic Reset, 
						input logic GatePC, GateMDR, 
						input logic LD_MAR, LD_MDR,
						input logic LD_IR, LD_BEN, 
						input logic LD_PC, GateMARMUX,
						input logic MIO_EN, 
						input logic [1:0] PCMUX,
						input logic ADDR1MUX,
						input logic [1:0] ADDR2MUX, 
						output logic BEN,
						output logic [15:0] IR, MDR, MAR,
					);
// Internal connections 
logic [15:0] ADDER_OUTPUT;		
logic [15:0] BUS; 
logic [15:0] PC; 
logic [15:0] PCMUXOUT, SR1OUT, ADDR1MUXOUT, ADDR2MUXOUT;
logic [15:0] SEXT6, SEXT9, SEXT11;
		
m_PCMUX PC_MUX(.ADDER(ADDER_OUTPUT), .BUS(BUS), .PC1(PC + 16'b0000000000000001), .Select(PCMUX), .Output(PCMUXOUT));
m_ADDR1MUX ADDR1_MUX(.PC(PC), .SR1(SR1OUT), .Select(ADDR1MUX), .Output(ADDR1MUXOUT));
m_ADDR2MUX ADDR2_MUX(.IRoffset6(SEXT6), .IRoffset9(SEXT9), .IRoffset11(SEXT11), .Select(ADDR2MUX), .Output(ADDR2MUXOUT));


					
					
					
					
					
endmodule 