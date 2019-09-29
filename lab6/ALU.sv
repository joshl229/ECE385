module ALU (input  logic [15:0] A, B,
			input  logic [1:0]  ALUK,
			output logic [15:0] OUTPUT);

		always_comb
		begin
			case (ALUK)

				2'b00:
					OUTPUT = A + B;
				2'b01:
					OUTPUT = A & B;
				2'b10:
					OUTPUT = ~A;
				2'b11:
					OUTPUT = A;
			endcase
		end

endmodule
