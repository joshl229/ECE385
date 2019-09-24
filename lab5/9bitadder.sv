module ninebitadder(
	input [7:0] A,
	input[7:0] B,
	input cin,
	input fn, 
	output logic [8:0] sum,
	output logic cout
);

logic c0, c1, c2, c3, c4, c5, c6, c7; // internal carries in 9 bit adder
logic [8:0] BB; // internal B or NOT(B)
logic A9, BB9; // internal sign extension bits

assign BB = (B ^ {9{fn}}); // When fn=1 complement B
// Sign extension bits 
assign A9 = A[8]; 
assign BB9 = BB[8];

full_adder FA0(.x(A[0] ), .y(BB[0] ), .cin(fn), .s(sum[0]), .cout(c0));
full_adder FA1(.x(A[1] ), .y(BB[1] ), .cin(c0), .s(sum[1]), .cout(c1));
full_adder FA2(.x(A[2] ), .y(BB[2] ), .cin(c1), .s(sum[2]), .cout(c2));
full_adder FA3(.x(A[3] ), .y(BB[3] ), .cin(c2), .s(sum[3]), .cout(c3));
full_adder FA4(.x(A[4] ), .y(BB[4] ), .cin(c3), .s(sum[4]), .cout(c4));
full_adder FA5(.x(A[5] ), .y(BB[5] ), .cin(c4), .s(sum[5]), .cout(c5));
full_adder FA6(.x(A[6] ), .y(BB[6] ), .cin(c5), .s(sum[6]), .cout(c6));
full_adder FA7(.x(A[7] ), .y(BB[7] ), .cin(c6), .s(sum[7]), .cout(c7));
full_adder FA8(.x(A9 ), .y(BB9 ), .cin(c7), .s(sum[8]), .cout());
endmodule 