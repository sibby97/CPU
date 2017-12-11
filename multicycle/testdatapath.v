`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:20 11/30/2017
// Design Name:   datapath
// Module Name:   C:/Users/1997j/Documents/COA Lab/Assignment2_15CS30036_15CS30043/Assignment2_working/multicycle/testdatapath.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testdatapath;

	// Inputs
	reg clk;
	reg tmar;
	reg ldmar;
	reg tmdr;
	reg ldmdr;
	reg memwr;
	reg memrd;
	reg rd;
	reg wr;
	reg tsp;
	reg ldsp;
	reg tpc;
	reg ldpc;
	reg ldt;
	reg tir;
	reg ldir;
	reg m1;
	reg m2;
	reg [15:0] Dbusin;
	reg [2:0] fnotsel_cont;

	// Outputs
	wire dcond;
	wire [3:0] ir1;
	wire [2:0] ir2;
	wire [15:0] Abus;
	wire [15:0] Dbusout;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.clk(clk), 
		.tmar(tmar), 
		.ldmar(ldmar), 
		.tmdr(tmdr), 
		.ldmdr(ldmdr), 
		.memwr(memwr), 
		.memrd(memrd), 
		.rd(rd), 
		.wr(wr), 
		.tsp(tsp), 
		.ldsp(ldsp), 
		.tpc(tpc), 
		.ldpc(ldpc), 
		.ldt(ldt), 
		.tir(tir), 
		.ldir(ldir), 
		.m1(m1), 
		.m2(m2), 
		.dcond(dcond), 
		.ir1(ir1), 
		.ir2(ir2), 
		.Abus(Abus), 
		.Dbusin(Dbusin), 
		.Dbusout(Dbusout), 
		.fnotsel_cont(fnotsel_cont)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		tmar = 0;
		ldmar = 0;
		tmdr = 0;
		ldmdr = 0;
		memwr = 0;
		memrd = 0;
		rd = 0;
		wr = 0;
		tsp = 0;
		ldsp = 0;
		tpc = 0;
		ldpc = 0;
		ldt = 0;
		tir = 0;
		ldir = 0;
		m1 = 0;
		m2 = 0;
		Dbusin = 0;
		fnotsel_cont = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always 
	begin
		#5 clk = !clk;
	end
      
endmodule

