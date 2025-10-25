module apb(pclk, presetn, paddr, pprot, psel0,psel1, psel2, psel3, psel4, psel5, psel6, psel7, psel8, psel9, psel10, psel11, psel12, psel13, psel14, psel15, penable, pwrite, pwdata, penable, pstrb, pready, prdata, pslverr );
	input pclk;
	input presetn;
	input [31:0] paddr;
	input pprot;
	input psel0, psel1, psel2, psel3, psel4, psel5, psel6, psel7, psel8, psel9, psel10, psel11, psel12, psel13, psel14, psel15;
	input pwrite;
	input penable;
	input [31:0] pwdata;
	input [3:0] pstrb;
	output reg pready;
	output reg [31:0] prdata;
	output reg pslverr;
	int count;

	//Memory creation each memory for each slave 
	reg [7:0] mem0[10000:0]; //Slave 0
       /*reg [7:0] mem1[10000:0]; //Slave 1
 	reg [7:0] mem2[10000:0]; //Slave 2
	reg [7:0] mem3[10000:0]; //Slave 3
	reg [7:0] mem4[10000:0]; //Slave 4
	reg [7:0] mem5[10000:0]; //Slave 5
	reg [7:0] mem6[10000:0]; //Slave 6
	reg [7:0] mem7[10000:0]; //Slave 7
	reg [7:0] mem8[10000:0]; //Slave 8
	reg [7:0] mem9[10000:0]; //Slave 9
	reg [7:0] mem10[10000:0];//Slave 10
	reg [7:0] mem11[10000:0];//Slave 11
	reg [7:0] mem12[10000:0];//Slave 12
	reg [7:0] mem13[10000:0];//Slave 13
	reg [7:0] mem14[10000:0];//Slave 14
       	reg [7:0] mem15[10000:0];//Slave 15
*/
	always@(posedge pclk)begin 
		//Check  if presetn signals
		if(presetn==1'b0)begin 
			for(int i = 0; i<100001; i++)begin
				mem0[i] = 0;
			end//End of memory initialization loop
		end //End of presetn = 1'b1
		else begin 
			//Check if master is sending penable  signals
			if(penable==1'b0)
				pready = 0;
			if(penable==1'b1)begin
				//make slave is ready to recieve the the addres and other signals
				pready = 1'b1;
				//Check which slave is ready for transmission
				if(psel0==1'b1)begin
					//Check if the address is aligned or unaligned
					if(paddr%($size(pwdata)/8)==0)begin
						pslverr = 1'b0;
						count = 0;
						for(int i = 0; i<($size(pwdata)/8); i++)begin
							if(pstrb[i]==1'b1)begin
								mem0[paddr+count] = wdata[i*8 :+ 8];
								count = count+1
						end//End of transaction
					end//Address is aligned 
					else begin 
						pslverr = 1'b1;
					end//Address is unaligned 	
				end//End psel0==1'b1
			end//End penable = 1'b1
		end//End of presetn = 1'b1
	end 
endmodule

module top;
bit pclk, presetn;
initial begin 
	pclk  = 0;
	forever #5 pclk = ~pclk;
end
apb_dut dut(.pclk(pclk), pres
