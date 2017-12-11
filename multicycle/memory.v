`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		IIT Kharagpur
// Engineer:		Siddharth Jain
// 
// Create Date:    12:17:05 11/30/2017 
// Design Name:
// Module Name:    memory 
// Project Name:   Multicycle CPU
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module memory(clk, Abus, Dbusin, Dbusout, memrd, memwr
    );
	input clk;
	input memwr, memrd;
	output [15:0] Dbusin;
	input [15:0] Abus, Dbusout;		//naming convention remains the same, so Dbusin refers to data going out of memory and Dbusout refers to data coming to the memory
	reg [15:0] Dbusin;
	reg [15:0] M[0:15];
	integer i;
	 
	initial 
	begin
		M[0] <= 16'b1111101000000000;		//pop r0
		M[1] <= 16'b1111010000000000;		//add r0
		M[2] <= 16'b1111100000000000;		//push r0
		for( i=3;i<14;i=i+1)
		begin
			M[i] <= 16'b0;
		end
		M[14] <= 16'b0000000000000011;
		M[15] <= 16'b0000000000000110;
	end
	
	always @(posedge clk)
	begin
		if(memrd == 1'b1)
		begin
			Dbusin <= M[Abus];
		end
		if(memwr == 1'b1)
		begin
			M[Abus] <= Dbusout;
		end
	end
endmodule
