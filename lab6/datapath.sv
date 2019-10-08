module datapath(
						input logic Clk,
						input logic Reset_ah, 
						input logic GatePC, GateMDR, 
						input logic LD_MAR, LD_MDR,
						input logic LD_IR, LD_BEN, 
						input logic LD_PC, GateMARMUX,
						input logic LD_CC,
						input logic MIO_EN, 
						input logic [1:0] PCMUX,
						input logic [15:0] MDR_In,
						input logic ADDR1MUX,
						input logic [1:0] ADDR2MUX, 
						input logic DRMUX, SR1MUX, SR2MUX,
						input logic LD_REG,
						input logic GateALU, 
						input logic [1:0] ALUK,
						input logic LD_LED, 
						output logic BEN,
						output logic [15:0] IR, MDR, MAR, PC,
						output logic [11:0] LED
					);
// Internal connections 
logic [15:0] ADDER_OUTPUT;		
logic [15:0] BUS; 
logic [15:0] PCMUXOUT, SR1OUT, ADDR1MUXOUT, ADDR2MUXOUT, SR2OUT;
logic [15:0] SEXT6, SEXT9, SEXT11, SEXT5;
logic [2:0] DRMUXOUT, SR1MUXOUT, SR2MUXOUT;
logic [15:0] ALUOUT, MDRMUXOUT;
logic NIN, ZIN, PIN, NOUT, ZOUT, POUT;

// Assigning values
assign ADDER_OUTPUT = ADDR1MUXOUT + ADDR2MUXOUT;
assign SEXT6 = {{10{IR[5]}}, IR[5:0]};
assign SEXT9 = {{7{IR[8]}}, IR[8:0]};
assign SEXT11 = {{5{IR[10]}}, IR[10:0]};
assign SEXT5 = {{11{IR[4]}}, IR[4:0]};

// NZP
always_comb 
	begin
		
		NIN = BUS[15]; // Tells if negative or not
		PIN = ~( BUS[15] | (BUS == 16'b000000000000) ); // Tells if positive or not
		
		if( BUS == 16'b000000000000 )
			begin
			ZIN = 1'b1;
			end
			
		else
			begin
			ZIN = 1'b0;
			end
	end

// Connecting the MUXes		
m_PCMUX PC_MUX(.ADDER(ADDER_OUTPUT), .BUS(BUS), .PC1(PC + 16'b0000000000000001), .Select(PCMUX), .Output(PCMUXOUT));
m_ADDR1MUX ADDR1_MUX(.PC(PC), .SR1(SR1OUT), .Select(ADDR1MUX), .Output(ADDR1MUXOUT));
m_ADDR2MUX ADDR2_MUX(.IRoffset6(SEXT6), .IRoffset9(SEXT9), .IRoffset11(SEXT11), .Select(ADDR2MUX), .Output(ADDR2MUXOUT));
m_DRMUX DR_MUX(.IR(IR[11:9]), .Select(DRMUX), .Output(DRMUXOUT));
m_SR1MUX SR1_MUX(.IR11(IR[11:9]), .IR8(IR[8:6]), .Select(SR1MUX), .Output(SR1MUXOUT));
m_SR2MUX SR2_MUX(.SR2(SR2OUT), .SEXT(SEXT5), .Select(SR2MUX), .Output(SR2MUXOUT));
m_MDRMUX MDR_M(.BUS(BUS), .MEM2IO(MDR_In), .Output(MDRMUXOUT), .Select(MIO_EN));
m_GATES Gates(.GateALU(GateALU), .GateMARMUX(GateMARMUX), .GateMDR(GateMDR), .GatePC(GatePC), .Select({GateALU, GateMARMUX, GateMDR, GatePC}), .aluoutput(ALUOUT), .marmuxoutput(ADDER_OUTPUT), .mdroutput(MDR), .pcoutput(PC), .Output(BUS));


// Connecting Registers 
eightreg16 REG_FILE(.Clk(Clk), .Reset(Reset_ah), .Load(LD_REG), .DataIn(BUS), .SR1in(SR1MUXOUT), .SR2in(IR[2:0]), .DRIN(DRMUXOUT), .SR2out(SR2OUT), .SR1out(SR1OUT));
register16 PC_REG(.Clk(Clk), .Reset(Reset_ah), .Load(LD_PC), .DataIn(PCMUXOUT), .DataOut(PC));
register16 IR_REG(.Clk(Clk), .Reset(Reset_ah), .Load(LD_IR), .DataIn(BUS), .DataOut(IR));
register16 MAR_REG(.Clk(Clk), .Reset(Reset_ah), .Load(LD_MAR), .DataIn(BUS), .DataOut(MAR));
register16 MDR_REG(.Clk(Clk), .Reset(Reset_ah), .Load(LD_MDR), .DataIn(MDRMUXOUT), .DataOut(MDR));

// Connecting ALU 
ALU new_ALU(.A(SR1OUT), .B(SR2MUXOUT), .ALUK(ALUK), .OUTPUT(ALUOUT));

// Connecting Flip Flop
NZP NZP(.Clk(Clk), .NIn(NIN), .ZIn(ZIN), .PIn(PIN), .LD_CC(LD_CC), .NOut(NOUT), .ZOut(ZOUT), .POut(POUT));
flipflop BENABLE(.Clk(Clk), .Reset(Reset_ah), .Load(LD_BEN), .DataIn(IR[11] & NOUT| IR[10] & ZOUT | IR[9] & POUT), .DataOut(BEN));	

// Pause 
always_ff @ (posedge Clk)
	begin
		if(LD_LED)
			LED<=IR[11:0];
		else
			LED<=12'b000000000000;
	end

					
endmodule 