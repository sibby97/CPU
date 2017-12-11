`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		IIT Kharagpur
// Engineer: 		Siddharth Jain
// 
// Create Date:    09:24:22 11/30/2017 
// Design Name:
// Module Name:    top 
// Project Name: 	 Multicycle CPU
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
module top(clk, Abus, Dbusin, Dbusout, memrd, memwr
    );
	input clk;
	output [15:0] Abus;
	input [15:0] Dbusin;
	output [15:0] Dbusout;
	output memrd, memwr;
	wire tmar, ldmar, tmdr, ldmdr, memwr, memrd, rd, wr, tsp, ldsp, tpc, ldpc, ldt, 
				tir, ldir, m1, m2, dcond;
	wire [3:0] ir1;
	wire [2:0] ir2;
	wire [2:0] fnotsel_cont;

	controller c(clk, ir1, ir2, dcond, memwr, memrd, tmar, ldmar, tmdr, ldmdr, rd, 
						wr, tsp, ldsp, tpc, ldpc, tir, ldir, ldt, m1, m2, fnotsel_cont);
	datapath d(clk, tmar, ldmar, tmdr, ldmdr, memwr, memrd, rd, wr, tsp, ldsp, tpc, ldpc, ldt, 
				tir, ldir, m1, m2, dcond, ir1, ir2, Abus, Dbusin, Dbusout, fnotsel_cont);
				

endmodule
