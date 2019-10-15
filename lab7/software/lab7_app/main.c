// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
	volatile unsigned int *LED_PIO = (unsigned int*)0x000000a0; //make a pointer to access the PIO block
	volatile unsigned int *SWITCH_PIO = (unsigned int*)0x00000080; // Pointer access to switch PIO
	volatile unsigned int *RESET_PIO = (unsigned int*)0x00000070; // Pointer access to reset
	volatile unsigned int *SUM_PIO = (unsigned int*)0x00000060; // Pointer access to sum
	*LED_PIO = 0; //clear all LEDs
	volatile int sum = 0x0;
	int summed = 0;
	while ( (1+1) != 3) //infinite loop
	{
		if (*SUM_PIO == 0) // If the sum button is pressed, start summing
			summed = 0;

		if ((*SUM_PIO == 1) && (summed == 0) ) // If you're allowed to sum and the sum button was pressed, then sum
		{
			sum = sum + *SWITCH_PIO;
			summed = 1;
		}

		if (*RESET_PIO == 0) // If reset is pressed, clear the sum and don't allow to sum
		{
			sum = 0x0;
			summed = 1;
		}

		*LED_PIO = sum; // Display the sum
	}
	return 1; //never gets here
}
