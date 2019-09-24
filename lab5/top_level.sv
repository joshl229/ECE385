module top_level(input logic	clk,
					  input logic	[7:0] s, 
					  input logic reset, 
					  input logic run,
					  input logic cleara_loadb,
						
						output logic [6:0] ahexu, ahexl, bhexu, bhexl,
						output logic [7:0] aval, bval,
						output logic x
						);
						
// Declare Internal Registers
logic[7:0] A;
logic[7:0] B;
logic[8:0] XA; // 9 bit extended A

// Declare Internal Wires
logic reset_sh, run_sh, cleara_loadb_sh; // inputs from switches
logic clr_ld_s, shift_s, add_s, sub_s; // outputs from control logic 
logic b_in;
logic m;

// Combinational logic 
assign aval = A; // connect Aval to A
assign bval = B; // Connect Bval to B

// Instantiation of modules
reg_8 register_a (
			.Clk(clk),
			.Reset(clr_ld_s | reset_sh),
			.Shift_In(x),
			.Load(add_s | sub_s),
			.Shift_En(shift_s),
			.Data_In(XA[7:0]),
			.Shift_Out(b_in),
			.Data_Out(A) 
			);
			
reg_8 register_b (
			.Clk(clk),
			.Reset(reset_sh),
			.Shift_In(b_in),
			.Load(clr_ld_s),
			.Shift_En(shift_s),
			.Data_In(s),
			.Shift_Out(),
			.Data_Out(B)
			);
			
ninebitadder adder(
		.A(A),
		.B(s),
		.cin(sub_s),
		.sum(XA),
		.fn(sub_s),
		.cout()
		);

flip_flop flipflop(
		.clk(clk),
		.load(add_s | sub_s),
		.reset(clr_ld_s | reset_sh),
		.in(XA[8]),
		.out(m)
		);
		
control_unit controller(
		.run(run_sh),
		.clrA_ldB(cleara_loadb_sh),
		.clk(clk),
		.reset(reset_sh),
		.M(B[0]),
		.clr_ld(clr_ld_s),
		.shift(shift_s),
		.add(add_s),
		.sub(sub_s)
		);
		
// Drives LEDs 		
 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(ahexl) );
 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(bhexl) );
								

 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(ahexu) );	
 HexDriver        HexBU (
                       .In0(B[7:4]),
                        .Out0(bhexu) );
				
// Button Synchronizer				
 sync button_sync[2:0] (clk, {~reset, ~cleara_loadb, ~run}, {reset_sh, run_sh, cleara_loadb_sh});
 
 endmodule
