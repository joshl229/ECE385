module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a carry select.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
     
	  logic c0, c1, c2, c3, c4, c5, c6;
	  logic [15:0] x1,x2;

	  four_bit_ra ra0 (.x(A[3:0]), .y(B[3:0]), .cin(0), .sum(Sum[3:0]), .cout(c0));
	  four_bit_ra ra1 (.x(A[7:4]), .y(B[7:4]), .cin(0), .sum(x1[7:4]), .cout(c2));
	  four_bit_ra ra2 (.x(A[7:4]), .y(B[7:4]), .cin(1), .sum(x2[7:4]), .cout(c2));
	  four_bit_ra ra3 (.x(A[11:8]), .y(B[11:8]), .cin(0), .sum(x1[11:8]), .cout(c4));
	  four_bit_ra ra4 (.x(A[11:8]), .y(B[11:8]), .cin(1), .sum(x2[11:8]), .cout(c4));
	  four_bit_ra ra5 (.x(A[15:12]), .y(B[15:12]), .cin(0), .sum(x1[15:12]), .cout(c5));
	  four_bit_ra ra6 (.x(A[15:12]), .y(B[15:12]), .cin(1), .sum(x2[15:12]), .cout(c6));
	 
	  
endmodule

// Mux module 
module Mux(
	input[3:0] D0,
	input[3:0] D1, 
	input C0,
	input C1, 
	input select, 
	output logic [3:0] D,
	output logic q
	);
	
	always_comb 
		begin
			if(select == 0) begin
				D = D0;
				q = C0;
			end 
			else begin
				D = D1;
				q=C1;
			end
		end
		
	endmodule 