module ninebitadder(

		input [7:0] A,
		input [7:0] B,
		input cin,
		output logic [8:0] sum
		);
		
		logic c0, c1, c2, c3, c4, c5, c6, c7;
		logic [8:0] Bm;
		assign Bm = B ^ {8{cin}};
		
		full_adder fa00(.x(A[0]), .y(Bm[0]), .cin(cin), .s(sum[0]), .cout(c0));
		full_adder fa01(.x(A[1]), .y(Bm[1]), .cin(c0), .s(sum[1]), .cout(c1));
		full_adder fa02(.x(A[2]), .y(Bm[2]), .cin(c1), .s(sum[2]), .cout(c2));
		full_adder fa03(.x(A[3]), .y(Bm[3]), .cin(c2), .s(sum[3]), .cout(c3));
		full_adder fa04(.x(A[4]), .y(Bm[4]), .cin(c3), .s(sum[4]), .cout(c4));
		full_adder fa05(.x(A[5]), .y(Bm[5]), .cin(c4), .s(sum[5]), .cout(c5));
		full_adder fa06(.x(A[6]), .y(Bm[6]), .cin(c5), .s(sum[6]), .cout(c6));
		full_adder fa07(.x(A[7]), .y(Bm[7]), .cin(c6), .s(sum[7]), .cout(c7));
		full_adder fa08(.x(A[7]), .y(Bm[7]), .cin(c7), .s(sum[8]), .cout());
		
endmodule
