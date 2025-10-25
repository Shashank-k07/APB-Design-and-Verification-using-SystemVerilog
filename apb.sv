module apb(PWRITE, PADDR, PRDATA, PENABLE, PSELx, PRESETn, PCLK, PWDATA, PREADY, PSLVERR);
	input PWRITE, PENABLE, PCLK, PRESETn;
	input[15:0] PSELx;
	input[32:0] PWDATA, PADDR;
	output[32:0]PRDATA;
	output PSLVERR, PREADY;

	//memory block 
	reg[7:0] mem0[0:255];
	reg[7:0] mem1[0:255];
	reg[7:0] mem2[0:255];
	reg[7:0] mem3[0:255];
	reg[7:0] mem4[0:255]; 
	reg[7:0] mem5[0:255];
	reg[7:0] mem6[0:255];
	reg[7:0] mem7[0:255];
	reg[7:0] mem8[0:255];
	reg[

