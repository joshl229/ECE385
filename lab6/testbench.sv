//taken from.

module testbench();

    timeunit 10ns; 

    timeprecision 1ns;

    logic [15:0] S;
    logic Clk, Reset, Run, Continue;  
	 logic [11:0] LED;
    logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
    logic CE, UB, LB, OE, WE;
    logic [19:0] ADDR;
    wire [15:0] Data;
	 logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
	 lab6_toplevel lc3(.*);


    // Toggle the clock
    // #1 means wait for a delay of 1 timeunit
    always begin : CLOCK_GENERATION
        #1 Clk = ~Clk;
    end

    initial begin: CLOCK_INITIALIZATION
        Clk = 0;
    end 


    initial begin: TEST_VECTORS
        Reset = 0;	
		 #2 Reset = 1; // Toggle Rest
		 
		 S= 16'h0014;
		   Run = 0;
			#2 Run = 1; 
		#6 Continue = 0;
		 #6 Continue = 1; 
		 #6 Continue = 0;
		 #6 Continue = 1;
		 #6 Continue = 0;
		 #6 Continue = 1;

		 #6 Continue = 0;
		 #6 Continue = 1; 
		 #6 Continue = 0;
		 #6 Continue = 1;
		 #6 Continue = 0;
		 #6 Continue = 1;
		 
		 #6 Continue = 0;
		 #6 Continue = 1; 
		 #6 Continue = 0;
		 #6 Continue = 1;
		 #6 Continue = 0;
		 #6 Continue = 1;
		 
		 #6 Continue = 0;
		 #6 Continue = 1; 
		 #6 Continue = 0;
		 #6 Continue = 1;
		 #6 Continue = 0;
		 #6 Continue = 1;
		 
		 #6 Continue = 0;
		 #6 Continue = 1; 
		 #6 Continue = 0;
		 #6 Continue = 1;
		 #6 Continue = 0;
		 #6 Continue = 1;
		 
    end

endmodule