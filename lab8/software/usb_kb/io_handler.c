//io_handler.c
#include "io_handler.h"
#include <stdio.h>

void IO_init(void)
{
	*otg_hpi_reset = 1;
	*otg_hpi_cs = 1;
	*otg_hpi_r = 1;
	*otg_hpi_w = 1;
	*otg_hpi_address = 0;
	*otg_hpi_data = 0;
	// Reset OTG chip
	*otg_hpi_cs = 0;
	*otg_hpi_reset = 0;
	*otg_hpi_reset = 1;
	*otg_hpi_cs = 1;
}

void IO_write(alt_u8 Address, alt_u16 Data)
{
//*************************************************************************//
//									TASK								   //
//*************************************************************************//
//							Write this function							   //
//*************************************************************************//
// Step 1: Address Setup
	*otg_hpi_address = Address;
// Step 2: Chip Select Setup
	*otg_hpi_cs = 0; // Active low
// Step 3: Write cycle
	*otg_hpi_w = 0; // Active low
	*otg_hpi_data = Data;

// Step 4: Go back to default signals
	*otg_hpi_w = 1; // Active low
	*otg_hpi_cs = 1; // Active low
}

alt_u16 IO_read(alt_u8 Address)
{
	alt_u16 temp;
//*************************************************************************//
//									TASK								   //
//*************************************************************************//
//							Write this function							   //
//*************************************************************************//
	//printf("%x\n",temp);
	// Step 1: Address Setup
	*otg_hpi_address = Address;

	// Step 2: Chip Select Setup
	*otg_hpi_cs = 0; // Active low

	// Step 3: Read Cycle
	*otg_hpi_r = 0; // Active Low
	temp = *otg_hpi_data;

	// Step 4: Go back to default signals
	*otg_hpi_cs = 1; // AL
	*otg_hpi_r = 1; // AL

	return temp;
}
