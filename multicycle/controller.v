`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		IIT Kharagpur
// Engineer: 		Siddharth Jain
// 
// Create Date:    10:23:21 11/28/2017 
// Design Name: 
// Module Name:    controller 
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
// Code your design here
  module controller(clk, ir1, ir2, dcond, memwr, memrd, tmar, ldmar, tmdr, ldmdr, rd, 
						wr, tsp, ldsp, tpc, ldpc, tir, ldir, ldt, m1, m2, fnsel);
	//ir1 <= ir[15:12], ir2 <= ir[11:9]
	input clk, dcond;
	input [3:0] ir1;
	input [2:0] ir2;
	output memwr, memrd, tmar, ldmar, tmdr, ldmdr, rd, wr, tsp, ldsp, tpc, ldpc, tir, ldir, m1, m2, ldt;
	reg memwr, memrd, tmar, ldmar, tmdr, ldmdr, rd, wr, tsp, ldsp, tpc, ldpc, tir, ldir, m1, m2, ldt;
	output [2:0] fnsel;
	reg [2:0] fnsel = 3'b0;
	reg [4:0] nextstate = 5'b0;
	reg [4:0] state = 5'b0;

	initial 
	begin
		memwr <= 0;
		memrd <= 0;
		tmar <= 0;
		ldmar <= 0;
		tmdr <= 0;
		ldmdr <= 0;
		rd <= 0;
		wr <= 0;
		tsp <= 0;
		ldsp <= 0;
		tpc <= 0;
		ldpc <= 0;
		tir <= 0;
		ldir <= 0;
		ldt <= 0;
		m1 <= 0;
		m2 <= 0;
		fnsel <= 3'b0;
	end
	always @(posedge clk)
	begin
		if(nextstate == 5'b0)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 1;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 1;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b110;
			state <= nextstate;
			nextstate <= 5'b00001;
		end
		else if(nextstate == 5'b00001)
		begin
			memwr <= 0;
			memrd <= 1;
			tmar <= 1;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 1;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			nextstate <= 5'b10000;
		end
		else if(nextstate == 5'b10000)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			if(ir1 == 4'b1111)
			begin
				if(ir2 == 3'b100)
				begin
					tpc <= 1;
					ldpc <= 1;
					fnsel <= 3'b100;
					nextstate <= 5'b00110;
				end
				else
				begin
					tpc <= 1;
					ldpc <= 1;
					fnsel <= 3'b100;
					nextstate <= 5'b01010;
				end
			end
			else
			begin
				if(ir1 == 4'b1001)
				begin
					tpc <= 1;
					ldpc <= 1;
					fnsel <= 3'b100;
					nextstate <= 5'b00010;
				end
				else
				begin
					if(dcond == 1)
					begin
						tpc <= 1;
						ldpc <= 1;
						fnsel <= 3'b100;
						nextstate <= 5'b01000;
					end
					else 
					begin
						nextstate <= 5'b00000;
					end
				end
			end
		end
		else if(nextstate == 5'b00010)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 1;
			ldsp <= 1;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b100;		//changed to sp = sp+1 because of the stack design
			state <= nextstate;
			nextstate <= 5'b00011;
		end
		else if(nextstate == 5'b00011)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 1;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 1;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 1;
			fnsel <= 3'b110;
			state <= nextstate;
			nextstate <= 5'b00100;
		end
		else if(nextstate == 5'b00100)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 1;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 1;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b110;
			state <= nextstate;
			nextstate <= 5'b00101;
		end
		else if(nextstate == 5'b00101)
		begin
			memwr <= 1;
			memrd <= 0;
			tmar <= 1;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			nextstate <= 5'b10001;
		end
		else if(nextstate ==	5'b10001)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			if(ir1 == 4'b1111)
			begin
				nextstate <= 5'b00000;
			end
			else
			begin
				nextstate <= 5'b01000;
			end
		end		
		else if(nextstate == 5'b00110)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 1;
			ldsp <= 1;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b100;		//changed to sp = sp+1 because of the stack design
			state <= nextstate;
			nextstate <= 5'b00111;
		end
		else if(nextstate == 5'b00111)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 1;
			rd <= 1;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 1;
			fnsel <= 3'b110;
			state <= nextstate;
			nextstate <= 5'b00100;
		end
		else if(nextstate == 5'b01000)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 1;
			ldir <= 0;
			ldt <= 1;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			nextstate <= 5'b01001;
		end
		else if(nextstate == 5'b01001)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 1;
			ldpc <= 1;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			nextstate <= 5'b00000;
		end
		else if(nextstate == 5'b01010)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 1;
			ldmar <= 1;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 1;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b110;
			state <= nextstate;
			nextstate <= 5'b01011;
		end
		else if(nextstate == 5'b01011)
		begin
			memwr <= 0;
			memrd <= 1;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;			 
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			nextstate <= 5'b10011;
		end
		else if(nextstate == 5'b10011)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 1;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;			 
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;
			state <= nextstate;
			nextstate <= 5'b01100;
		end
		else if(nextstate == 5'b01100)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 1;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;			 
			ldt <= 1;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b000;		//changed to sp = sp-1 because of the stack design
			state <= nextstate;
			nextstate <= 5'b10100;
		end
		else if(nextstate == 5'b10100)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 1;
			ldsp <= 1;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;			 
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b101;		//changed to sp = sp-1 because of the stack design
			state <= nextstate;
			nextstate <= 5'b10010;
		end
		else if(nextstate == 5'b10010)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;			 
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b101;		//changed to sp = sp-1 because of the stack design
			state <= nextstate;
			if(ir2 == 3'b101)
			begin
				nextstate <= 5'b01110;
			end
			else if(ir2 == 3'b110)
			begin
				nextstate <= 5'b01111;
			end
			else
			begin
				nextstate <= 5'b01101;
			end
		end
		else if(nextstate == 5'b01101)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 1;
			wr <= 1;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;			 
			ldt <= 0;	
			m1 <= 1;		//fnsel comes directly from ir2
			m2 <= 0;
			fnsel <= 3'b101;
			state <= nextstate;
			nextstate <= 5'b00000;
		end
		else if(nextstate == 5'b01110)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 1;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 0;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b111;
			state <= nextstate;
			nextstate <= 5'b00000;
		end
		else if(nextstate == 5'b01111)
		begin
			memwr <= 0;
			memrd <= 0;
			tmar <= 0;
			ldmar <= 0;
			tmdr <= 0;
			ldmdr <= 0;
			rd <= 0;
			wr <= 0;
			tsp <= 0;
			ldsp <= 0;
			tpc <= 0;
			ldpc <= 1;
			tir <= 0;
			ldir <= 0;
			ldt <= 0;
			m1 <= 0;
			m2 <= 0;
			fnsel <= 3'b111;
			state <= nextstate;
			nextstate <= 5'b00000;
		end
	end
endmodule
