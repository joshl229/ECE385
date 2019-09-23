module 9bitadder(
	input [8:0] x,
	input[8:0] y,
	input cin,
	output logic [8:0] sum,
	output logic cout
);

logic c0, c1, c2, c3, c4, c5, c7;

full_adder FA0(.x(x[0] ), .y(y[0] ), .cin(cin), .s(sum[0]), .cout(c0));
full_adder FA1(.x(x[1] ), .y(y[1] ), .cin(c0), .s(sum[1]), .cout(c1));
full_adder FA2(.x(x[2] ),.y(y[2] ), .cin(c1), .s(sum[2]), .cout(c2));
full_adder FA3(.x(x[3] ),.y(y[3] ), .cin(c2), .s(sum[3]), .cout(c3));
full_adder FA4(.x(x[4] ),.y(y[4] ), .cin(c3), .s(sum[4]), .cout(c4));
full_adder FA5(.x(x[5] ),.y(y[5] ), .cin(c4), .s(sum[5]), .cout(c5));
full_adder FA6(.x(x[6] ),.y(y[6] ), .cin(c5), .s(sum[6]), .cout(c6));
full_adder FA7(.x(x[7] ),.y(y[7] ), .cin(c6), .s(sum[7]), .cout(c7));
full_adder FA8(.x(x[8] ),.y(y[8] ), .cin(c7), .s(sum[8]), .cout(cout));

endmodule 