`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:33:15 11/28/2017
// Design Name:   controller
// Module Name:   C:/Users/1997j/Documents/COA Lab/Assignment2_15CS30036_15CS30043/Assignment2_working/multicycle/testcontroller.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testcontroller;

	// Inputs
	reg clk;
	reg [3:0] ir1;
	reg [2:0] ir2;
	reg dcond;

	// Outputs
	wire memwr;
	wire memrd;
	wire tmar;
	wire ldmar;
	wire tmdr;
	wire ldmdr;
	wire rd;
	wire wr;
	wire tsp;
	wire ldsp;
	wire tpc;
	wire ldpc;
	wire tir;
	wire ldir;
	wire ldt;
	wire m1;
	wire m2;
	wire [2:0] fnsel;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.clk(clk), 
		.ir1(ir1), 
		.ir2(ir2), 
		.dcond(dcond), 
		.memwr(memwr), 
		.memrd(memrd), 
		.tmar(tmar), 
		.ldmar(ldmar), 
		.tmdr(tmdr), 
		.ldmdr(ldmdr), 
		.rd(rd), 
		.wr(wr), 
		.tsp(tsp), 
		.ldsp(ldsp), 
		.tpc(tpc), 
		.ldpc(ldpc), 
		.tir(tir), 
		.ldir(ldir), 
		.ldt(ldt), 
		.m1(m1), 
		.m2(m2), 
		.fnsel(fnsel)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ir1 = 4'b0000;
		ir2 = 3'b100;
		dcond = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always
	begin
		#5 clk = !clk;
	end
      
endmodule

