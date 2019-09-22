module carry_lookahead_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
     logic c0, c1, c2;
	  logic [3:0] g;
	  logic [3:0] p;
	  
	 
	  fbla CLA0(.x(A[3:0]), .y(B[3:0]), .cin(0), .sum(Sum[3:0]), .g(g[0]), .p(p[0]));
	  fbla CLA1(.x(A[7:4]), .y(B[7:4]), .cin(c0), .sum(Sum[7:4]), .g(g[1]), .p(p[1]));
	  fbla CLA2(.x(A[11:8]), .y(B[11:8]), .cin(c1), .sum(Sum[11:8]), .g(g[2]), .p(p[2]));
	  fbla CLA3(.x(A[15:12]), .y(B[15:12]), .cin(c2), .sum(Sum[15:12]), .g(g[3]), .p(p[3]));
	  
	  always_comb
			  begin
						c0 = g[0];
						c1 = (g[0] & p[1]) | g[1];
						c2 = (g[0] & p[1] & p[2]) | (g[1] & p[2]) | g[2];
						CO = (g[0] & p[1] & p[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[2] & p[3]) | g[3];
				end
	  
endmodule

// Creates a four bit lookahead adder
module fbla(
	input [3:0] x,
	input [3:0] y,
	input cin,
	output logic [3:0] sum,
	output logic g, 
	output logic p
	);
	
	logic c0, c1, c2;
	logic [3:0] g_carry;
	logic [3:0] p_carry;
	
	// Determines the carry in and carry out bits 
	always_comb
	begin
		g_carry = x & y;
		p_carry = x ^ y;
		c0 = g_carry[0] | (p_carry[0] & cin);
		c1 = g_carry[1] | (g_carry[0] & p_carry[1]) | (p_carry[0] & p_carry[1] & cin);
		c2 = g_carry[2] | (g_carry[1] & p_carry[2]) | (g_carry[0] & p_carry[1] & p_carry[2]) | (cin & p_carry[0] & p_carry[1] & p_carry[2]);
		g = g_carry[3] | (g_carry[2] & p_carry[3]) | (g_carry[1] & p_carry[2] & p_carry[3]) | (g_carry[0] & p_carry[1] & p_carry[2] & p_carry[3]);
		p = p_carry[0] & p_carry[1] & p_carry[2] & p_carry[3];
	end
	
	// Implements the full adders 
	full_adder FA0(.x(x[0]), .y(y[0]), .cin(cin), .s(sum[0]));
	full_adder FA1(.x(x[1]), .y(y[1]), .cin(c0), .s(sum[1]));
	full_adder FA2(.x(x[2]), .y(y[2]), .cin(c1), .s(sum[2]));
	full_adder FA3(.x(x[3]), .y(y[3]), .cin(c2), .s(sum[3]));

endmodule 