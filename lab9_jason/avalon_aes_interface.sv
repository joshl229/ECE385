/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

logic [31:0] reg_data [15:0];
logic [31:0] data_out;


	
always_ff @ (posedge Clk)
	begin
			case(AVL_BYTE_EN)
	
			4'b1111:
				data_out[31:0] = AVL_WRITEDATA[31:0];
	
			4'b1100:
				data_out[31:16] = AVL_WRITEDATA[31:16];
			4'b0011:
				data_out[15:0] = AVL_WRITEDATA[15:0];
		
			4'b1000:
				data_out[31:24] = AVL_WRITEDATA[31:24];

			4'b0100:
				data_out[23:16] = AVL_WRITEDATA[23:16];
			4'b0010:
				data_out[15:8] = AVL_WRITEDATA[15:8];
			4'b0001:
				data_out[8:0] = AVL_WRITEDATA[8:0];
		endcase
		
		
	if (RESET)
		reg_data[0] = 32h'0;
		reg_data[1] = 32h'0;
		reg_data[2] = 32h'0;
		reg_data[3] = 32h'0;
		reg_data[4] = 32h'0;
		reg_data[5] = 32h'0;
		reg_data[6] = 32h'0;
		reg_data[7] = 32h'0;
		reg_data[8] = 32h'0;
		reg_data[9] = 32h'0;
		reg_data[10] = 32h'0;
		reg_data[11] = 32h'0;
		reg_data[12] = 32h'0;
		reg_data[13] = 32h'0;
		reg_data[14] = 32h'0;	
		reg_data[15] = 32h'0;	
		reg_data[16] = 32h'0;	
			
	else 
			data_out[AVL_ADDR] = reg_data
	end
   






endmodule
