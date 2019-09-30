module sext5 (input  logic [4:0] DataIn,
			   output logic [15:0] DataOut);
		
		always_comb
		begin

			if (DataIn[4] == 1)
				DataOut[15:5] = 11'h1;

			else
				DataOut[15:5] = 11'h0;

			DataOut[4:0] = DataIn;
		end
		
endmodule


module sext6 (input  logic [5:0] DataIn,
			   output logic [15:0] DataOut);
		
		always_comb
		begin

			if (DataIn[5] == 1)
				DataOut[15:6] = 10'h1;

			else
				DataOut[15:6] = 10'h0;

			DataOut[5:0] = DataIn;
		end
endmodule 



module sext9 (input  logic [8:0] DataIn,
			   output logic [15:0] DataOut);
		
		always_comb
		begin

			if (DataIn[8] == 1)
				DataOut[15:9] = 7'h1;

			else
				DataOut[15:9] = 7'h0;

			DataOut[8:0] = DataIn;
		end
endmodule 



module sext11 (input  logic [10:0] DataIn,
			   output logic [15:0] DataOut);
		
		always_comb
		begin

			if (DataIn[10] == 1)
				DataOut[15:11] = 5'h1;

			else
				DataOut[15:11] = 5'h0;

			DataOut[10:0] = DataIn;
		end
endmodule 
		