module full_adder(
	input x, 
	input y,
	input cin,
	output logic s,
	output logic cout
	);
	
	assign s = x ^ y ^ cin;
	assign cout = (x&y) | (y&cin) | (x&cin);
	
endmodule 