`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		IIT Kharagpur
// Engineer:		Siddharth Jain
// 
// Create Date:    07:48:26 11/30/2017 
// Design Name:   
// Module Name:    datapath 
// Project Name: 	 Multicycle CPU
// Target Devices: 
// Tool versionots: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
	module datapath(clk, tmar, ldmar, tmdr, ldmdr, memwr, memrd, rd, wr, tsp, ldsp, tpc, ldpc, ldt, 
				tir, ldir, m1, m2, dcond, ir1, ir2, Abus, Dbusin, Dbusout, fnotsel_cont);

	input clk, tmar, ldmar, tmdr, ldmdr, memwr, memrd, rd, wr, tsp, ldsp, tpc, ldpc, ldt, tir, ldir, m1, m2;
	input [15:0] Dbusin;
	input [2:0] fnotsel_cont;
	output dcond;
	output [15:0] Abus, Dbusout;
	output [2:0] ir2;
	output [3:0] ir1;
	wire [2:0] ir3;
	wire [15:0] xbus, y_alu, zbus;
	wire [15:0] m2_out;
	wire [2:0] m1_out;
	wire cout, zout, vout, sout;
	wire ldflag;
	wire [15:0] sp_out, pc_out, mdr_out, ir_out, rb_out;

	reg_16bit mar(clk, ldmar, tmar, zbus, Abus);		//output of mar goes in Abus, input of mar comes from ALU(zbus)
	reg_16bit_sp sp(clk, ldsp, tsp, zbus, sp_out);		//output of sp goes in xbus, input of sp comes from ALU(zbus)
	reg_16bit pc(clk, ldpc, tpc, zbus, pc_out);		//output of pc goes in xbus, input of pc comes from ALU(zbus)
	reg_16bit t(clk, ldt, 1'b1, xbus, y_alu);		//output of t goes in Y of ALU, input of t comes from xbus
	reg_16bit_mdr mdr(clk, ldmdr, tmdr, m2_out, mdr_out, Dbusout);		//input of mdr comes from output of Mux M2, output1 goes in xbus and output2 goes in Dbusout
	reg_16bit_ir ir(clk, ldir, tir, Dbusin, ir1, ir2, ir3, ir_out);		//input of ir comes from Dbusin, outputs are ir1, ir2, ir3, ir4; ir4 direclty goes in xbus

	regbank rbank(clk, rd, wr, ir3, zbus, rb_out);		//input of regbank is from zbus, output of regbank goes to xbus

	mux_2to1_3 mux1(clk, fnotsel_cont, ir2, m1_out, m1);		//output size = 3bits
	mux_2to1_16 mux2(clk, Dbusin, zbus, m2_out, m2);		//output size = 16bits
	mux_5to1 mm41(clk, sp_out, pc_out, mdr_out, ir_out, rb_out, tsp, tpc, tmdr, tir, rd, xbus);
	
	functional_unit alu(clk, xbus, y_alu, zbus, m1_out, cout, ldflag);

	status_selector ss(clk, cout, zout, vout, sout, ir1, dcond, ldflag);

	status_detector sd(clk, cout, zout, vout, sout, zbus);

endmodule

module reg_16bit_sp(clk, ld, t, in, out);
	input clk, ld, t;
	input [15:0] in;
	output [15:0] out;
	reg [15:0] out;
	reg [15:0] data = 16'b0000000000001111;
	
	initial
	begin
		data <= 16'b0000000000001111;
	end
	always @*
	begin
		if(t == 1'b1)
		begin
			out <= data;
		end
	end
	
	always @(negedge clk)
	begin
		data <= data;
		if(ld == 1'b1)
		begin
			data <= in;			
		end
	end

endmodule

module reg_16bit(clk, ld, t, in, out);
	input clk, ld, t;
	input [15:0] in;
	output [15:0] out;
	reg [15:0] out;
	reg [15:0] data = 16'b0;
	
	initial
	begin
		data <= 16'b0;
	end
	always @*
	begin
		if(t == 1'b1)
		begin
			out <= data;			
		end
	end

	always @(negedge clk)
	begin
		data <= data;
		if(ld == 1'b1)
		begin
			data <= in;
		end
	end
endmodule

module reg_16bit_mdr(clk, ld, t, in, out1, out2);
	input clk, ld, t;
	input [15:0] in;
	output [15:0] out1, out2;
	reg [15:0] out1, out2;		//out1 = data bus, out2 = Dbus memory
	reg [15:0] data;

	always @*
	begin
		out2 <= data;
		if(t == 1'b1)
		begin
			out1 <=  data;
		end
	end

	always @(negedge clk)
	begin
		data <= data;
		if(ld == 1'b1)
		begin
			data <= in;
		end
	end
endmodule

module reg_16bit_ir(clk, ld, t, in, ir1, ir2, ir3, ir4);		//ir1 = ir[15:12], ir2 = ir[11:9], ir3 = ir[8:6], ir4 = ir[11:0]
	input clk, ld, t;
	input [15:0] in;
	output [3:0] ir1;
	reg [3:0] ir1;
	output [2:0] ir2, ir3;
	reg [2:0] ir2, ir3;
	output [11:0] ir4;
	reg [15:0] ir4;
	reg [15:0] data;

	always @*
	begin
		ir1 <= data[15:12];
		ir2 <= data[11:9];
		ir3 <= data[8:6];
		if(t == 1'b1)
		begin
			ir4[15:12] <= 4'b0000;
			ir4[11:0] <= data[11:0];
		end
	end

	always @(negedge clk)
	begin
		data <= data;
		if(ld == 1'b1)
		begin
			data <= in;
		end
	end
endmodule

module regbank(clk, rd, wr, ir3, in, out);
	input clk, rd, wr;
	input [2:0] ir3;
	input [15:0] in;
	output [15:0] out;
	wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8;
	wire ld1, ld2, ld3, ld4, ld5, ld6, ld7, ld8;
	wire t1, t2, t3, t4, t5, t6, t7, t8;

	mux_1to8 mm18_1(clk, wr, ir3, ld1, ld2, ld3, ld4, ld5, ld6, ld7, ld8);

	reg_16bit r1(clk, ld1, 1'b1, in, out1);
	reg_16bit r2(clk, ld2, 1'b1, in, out2);
	reg_16bit r3(clk, ld3, 1'b1, in, out3);
	reg_16bit r4(clk, ld4, 1'b1, in, out4);
	reg_16bit r5(clk, ld5, 1'b1, in, out5);
	reg_16bit r6(clk, ld6, 1'b1, in, out6);
	reg_16bit r7(clk, ld7, 1'b1, in, out7);
	reg_16bit r8(clk, ld8, 1'b1, in, out8);
	
	mux_8to1 mm81(clk, out1, out2, out3, out4, out5, out6, out7, out8, ir3, out);
endmodule

module mux_1to8(clk, wr, x, o1, o2, o3, o4, o5, o6, o7, o8);
	input clk;
	input wr;
	input [2:0] x;
	output o1, o2, o3, o4, o5, o6, o7, o8;
	wire nx2, nx1, nx0;

	not not1(nx0, x[0]);
	not not2(nx1, x[1]);
	not not3(nx2, x[2]);

	and(o1, wr, nx2, nx1, nx0);
	and(o2, wr, nx2, nx1, x[0]);
	and(o3, wr, nx2, x[1], nx0);
	and(o4, wr, nx2, x[1], x[0]);
	and(o5, wr, x[2], nx1, nx0);
	and(o6, wr, x[2], nx1, x[0]);
	and(o7, wr, x[2], x[1], nx0);
	and(o8, wr, x[2], x[1], x[0]);
	
endmodule

module mux_8to1(clk, in1, in2, in3, in4, in5, in6 , in7, in8, sel, out);
	input clk;
	input [15:0] in1, in2, in3, in4, in5, in6, in7, in8;
	input [2:0] sel;
	output [15:0] out;
	reg [15:0] out;
	
	always @(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8)
	begin
		if(sel == 3'b000)
		begin
			out <= in1;
		end
		else if(sel == 3'b001)
		begin
			out <= in2;
		end
		else if(sel == 3'b010)
		begin
			out <= in3;
		end
		else if(sel == 3'b011)
		begin
			out <= in4;
		end
		else if(sel == 3'b100)
		begin
			out <= in5;
		end
		else if(sel == 3'b101)
		begin
			out <= in6;
		end
		else if(sel == 3'b110)
		begin
			out <= in7;
		end
		else if(sel == 3'b111)
		begin
			out <= in8;
		end
	end
endmodule

module mux_5to1(clk, in1, in2, in3, in4, in5, sel1, sel2, sel3, sel4, sel5, out);
	input clk;
	input sel1, sel2, sel3, sel4, sel5;
	input [15:0] in1, in2, in3, in4, in5;
	output [15:0] out;
	reg [15:0] out;
	
	always @*
	begin
		if(sel1 == 1'b1)
		begin
			out <= in1;
		end
		else if(sel2 == 1'b1)
		begin
			out <= in2;
		end
		else if(sel3 == 1'b1)
		begin
			out <= in3;
		end
		else if(sel4 == 1'b1)
		begin
			out <= in4;
		end
		else if(sel5 == 1'b1)
		begin
			out <= in5;
		end
	end
endmodule

module mux_2to1_3(clk, in1, in2, out, sel);
	input clk;
	input [2:0] in1, in2;
	input sel;
	output [2:0] out;
	reg [2:0] out;

	always @(in1 or in2 or sel)
	begin
		if(sel == 1'b0)
		begin
			out <= in1;
		end
		else 
		begin
			out <= in2;
		end
	end
endmodule

module mux_2to1_16(clk, in1, in2, out, sel);
	input clk;
	input [15:0] in1, in2;
	input sel;
	output [15:0] out;
	reg [15:0] out;

	always @(in1 or in2 or sel)
	begin
		if(sel == 1'b0)
		begin
			out <= in1;
		end
		else 
		begin
			out <= in2;
		end
	end
endmodule

module functional_unit(clk, x, y, z, fnotsel, cout, ldflag);
	input clk;
	input [15:0] x,y;
	input [2:0] fnotsel;
	output [15:0] z;
	output cout;
	output ldflag;
	reg ldflag;
	reg [15:0] z;
	reg cout;
	reg c;
	integer i;

	always @(x or y  or fnotsel)
	begin
		if(fnotsel == 3'b000)
		begin
			z <= x+y;
			c <= 0;
			for(i=0;i<16;i=i+1)
			begin
				c <= (x[i] & y[i]) | ((x[i] | y[i]) & c);
			end
			cout <= c;
			ldflag <= 1;
		end
		else if(fnotsel == 3'b001)
		begin
			z <= -x;
			cout <= 0;
			ldflag <= 1;
		end
		else if(fnotsel == 3'b010)
		begin
			z <= x|y;
			cout <= 0;
			ldflag <= 1;
		end
		else if(fnotsel == 3'b011)
		begin
			z <= ~x;
			c <= x[0] & 1'b1;
			for(i=0;i<16;i=i+1)
			begin
				c <= x[i] & c;
			end
			cout <= c;
			ldflag <= 1;
		end
		else if(fnotsel == 3'b100)
		begin
			z <= x + 1;
			cout <= 0;
			ldflag <= 1;
		end
		else if(fnotsel == 3'b101)
		begin
			z <= x - 1;
			cout <= 0;
			ldflag <= 1;
		end
		else if(fnotsel == 3'b110)
		begin
			z <= x;
			cout <= 0;
			ldflag <= 1;
		end
		else 
		begin
			z <= y;
			cout <= 0;
			ldflag <= 1;
		end
	end
endmodule 

module status_selector(clk, cout, zout, vout, sout, sel, dcond, ldflag);
	input clk;
	input cout, zout, vout, sout, ldflag;
	wire c, z, v, s;
	wire nc, nz, nv, nots;
	output dcond;
	input [3:0] sel;

	flipflop ff1(clk, cout, c, nc, ldflag);
	flipflop ff2(clk, zout, z, nz, ldflag);
	flipflop ff3(clk, vout, v, nv, ldflag);
	flipflop ff4(clk, sout, s, nots, ldflag);

	mux_16to1 cc(clk, 1'b1, c, nc, z, nz, v, nv, s, nots, sel, dcond);

endmodule

module flipflop(clk, in, q, qnot, ld);
	input clk;
	input in;
	input ld;
	output q, qnot;
	reg q,qnot;
	reg data;

	always @(posedge clk)
	begin
		if(ld == 1)
		begin
			data <= in;
		end
		else
		begin
			data <= data;
		end
	end

	always @*
	begin
		qnot <= ~q;
	end
endmodule

module mux_16to1(clk, in1, in2, in3, in4, in5, in6, in7, in8, in9, sel, out);
	input clk;
	input in1, in2, in3, in4, in5, in6, in7, in8, in9;
	input [3:0] sel;
	output out;
	reg out;
	
	always @(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or out)
	begin
		if(sel == 4'b0000)
		begin
			out <= in1;
		end
		else if(sel == 4'b0001)
		begin
			out <= in2;
		end
		else if(sel == 4'b0010)
		begin
			out <= in3;
		end
		else if(sel == 4'b0011)
		begin
			out <= in4;
		end
		else if(sel == 4'b0100)
		begin
			out <= in5;
		end
		else if(sel == 4'b0101)
		begin
			out <= in6;
		end
		else if(sel == 4'b0110)
		begin
			out <= in7;
		end
		else if(sel == 4'b0111)
		begin
			out <= in8;
		end
		else if(sel == 4'b1000)
		begin
			out <= in9;
		end
	end
endmodule
	
	

module status_detector(clk, cout, zout, vout, sout, in);
	input clk;
	input cout;
	input [15:0] in;
	output zout, vout, sout;

	xor xor1(vout, in[15], cout);
	nor nor1(zout, in[15], in[14], in[13], in[12], in[11], in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);
	and and1(sout, in[15], 1'b1);
endmodule
