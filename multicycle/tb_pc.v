`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:32:52 12/09/2017
// Design Name:   reg_16bit_ir
// Module Name:   C:/Users/1997j/Documents/COA Lab/Assignment2_15CS30036_15CS30043/Assignment2_working/multicycle/tb_pc.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_16bit_ir
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_pc;

	// Inputs
	reg clk;
	reg ld;
	reg t;
	reg [15:0] in;

	// Outputs
	wire [3:0] ir1;
	wire [2:0] ir2;
	wire [2:0] ir3;
	wire [15:0] ir4;

	// Instantiate the Unit Under Test (UUT)
	reg_16bit_ir uut (
		.clk(clk), 
		.ld(ld), 
		.t(t), 
		.in(in), 
		.ir1(ir1), 
		.ir2(ir2), 
		.ir3(ir3), 
		.ir4(ir4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ld = 0;
		t = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always
	begin
		#5 clk = !clk;
		#10 ld = 1;
		in = 16'b0000000011111010;
	end
      
endmodule

