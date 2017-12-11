`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:31:29 11/30/2017
// Design Name:   top
// Module Name:   C:/Users/1997j/Documents/COA Lab/Assignment2_15CS30036_15CS30043/Assignment2_working/multicycle/testbench.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk;
	wire [15:0] Abus;
	wire [15:0] Dbusin;

	// Outputs
	wire [15:0] Dbusout;
	wire memrd;
	wire memwr;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk),
		.Abus(Abus), 
		.Dbusin(Dbusin), 
		.Dbusout(Dbusout),
		.memrd(memrd),
		.memwr(memwr)
	);
	
	// Instantiate the Unit Under Test (UUT)
	memory uut1 (
		.clk(clk),  
		.Abus(Abus), 
		.Dbusin(Dbusin), 
		.Dbusout(Dbusout),
		.memrd(memrd),
		.memwr(memwr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
	begin
		#5 clk = !clk;
	end
      
endmodule

