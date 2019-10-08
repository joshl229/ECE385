module register16 (input logic Clk, Reset, Load,
					input logic [15:0] DataIn,
					output logic [15:0] DataOut);

	always_ff @ (posedge Clk)
	begin
		if (Reset)
			DataOut <= 16'h0000;

		else if (Load)
			DataOut <= DataIn;
	end

endmodule




module eightreg16(input logic Clk, Reset, Load,
						input logic [15:0] DataIn,
						input logic [2:0] SR1in, SR2in, DRIN,
						output logic [15:0] SR2out, SR1out);

logic [7:0][15:0] regout;

	always_ff @ (posedge Clk)
			begin
				if (Load)
					case(DRIN)
						3'b000: regout[0] <= DataIn;
						3'b001: regout[1] <= DataIn;
						3'b010: regout[2] <= DataIn;

						3'b011: regout[3] <= DataIn;
						3'b100: regout[4] <= DataIn;

						3'b101: regout[5] <= DataIn;
						3'b110: regout[6] <= DataIn;

						3'b111: regout[7] <= DataIn;
						default;
					endcase
				else if (Reset)
					begin
						regout[0] <= 16'h0;

						regout[1] <= 16'h0;

						regout[2] <= 16'h0;

						regout[3] <= 16'h0;
						regout[4] <= 16'h0;
						regout[5] <= 16'h0;

						regout[6] <= 16'h0;
						regout[7] <= 16'h0;
					end

			end

			always_comb
			begin
				case(SR1in)
						3'b000: SR1out <= regout[0];
						3'b001: SR1out <= regout[1];

						3'b010: SR1out <= regout[2];
						3'b011: SR1out <= regout[3];

						3'b100: SR1out <= regout[4];

						3'b101: SR1out <= regout[5];
						3'b110: SR1out <= regout[6];

						3'b111: SR1out <= regout[7];
						default;
				endcase


				case(SR2in)
						3'b000: SR2out <= regout[0];
						3'b001: SR2out <= regout[1];

						3'b010: SR2out <= regout[2];
						3'b011: SR2out <= regout[3];
						3'b100: SR2out <= regout[4];

						3'b101: SR2out <= regout[5];
						3'b110: SR2out <= regout[6];

						3'b111: SR2out <= regout[7];
						default;

				endcase

			end

endmodule


module flipflop (input logic Clk, Reset, Load, DataIn,
              output logic DataOut);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset)
			  DataOut <= 1'h0;
		 else if (Load)
			  DataOut <= DataIn;

    end

endmodule


