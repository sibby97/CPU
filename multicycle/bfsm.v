`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:23 10/20/2017 
// Design Name: 
// Module Name:    bfsm 
// Project Name: 
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
module bfsm(clk, reset, ldir, ldmdr, ldmar, ldsp, ldpc, ldt, tir, tmdr, tmar, tsp, tpc, tt, rd, wr, memrd, memwr, state, ir, dcond, fnsel, M1
    );

	input clk, reset;
	input[6:0] ir;
	input dcond;//desired condition
	output ldir, ldmdr, ldmar, ldsp, ldpc, ldt, tir, tmdr, tmar, tsp, tpc, tt, rd, wr, memrd, memwr, M1;
	reg ldir, ldmdr, ldmar, ldsp, ldpc, ldt, tir, tmdr, tmar, tsp, tpc, tt, rd, wr, memrd, memwr, M1;//M1 is enable for mux
	output[3:0] state;
	reg[3:0] state;		
	output[2:0] fnsel;
	reg[2:0] fnsel;
	//000 add
	//001 neg
	//010 inc
	//011 dec
	//100 or
	//101 not
	//110 trans
	initial
	begin
		state <= 4'b0000;
		ldir <= 0;
		ldmdr <=0;
		ldmar <=0;
		ldsp <=0;
		ldpc <=0;
		ldt <=0;
		tir <=0;
		tmdr <=0;
		tmar <=0;
		tsp <=0;
		tpc <=0;
		tt <=0;
		rd <=0;
		wr <=0;
		memrd <=0;
		memwr <=0;
		fnsel <=3'b000;
		M1 <=0;//M1 is 0 if datapath decides fnsel and 1 if controller decides fnsel
	end
	
	always @(posedge clk)
	begin
		casex (state)
			4'b0000:
			begin
				if(reset == 0)
				begin
					ldir <= 0;
					ldmdr <=0;
					ldmar <=1;
					ldsp <=0;
					ldpc <=0;
					ldt <=0;
					tir <=0;
					tmdr <=0;
					tmar <=0;
					tsp <=0;
					tpc <=1;
					tt <=0;
					rd <=0;
					wr <=0;
					memrd <=0;
					memwr <=0;
					fnsel <=3'b110;//trans
					M1 <=1;
					state <=4'b0001;
				end
				else
				begin
					state <= 4'b0000;
					ldir <= 0;
					ldmdr <=0;
					ldmar <=0;
					ldsp <=0;
					ldpc <=0;
					ldt <=0;
					tir <=0;
					tmdr <=0;
					tmar <=0;
					tsp <=0;
					tpc <=0;
					tt <=0;
					rd <=0;
					wr <=0;
					memrd <=0;
					memwr <=0;
					fnsel <=3'b000;
					M1 <=0;
					state <=4'b0000;
				end
			end
			4'b0001:
			begin
				ldir <= 1;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=0;
				ldpc <=1;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=1;
				tsp <=0;
				tpc <=1;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=1;
				memwr <=0;
				fnsel <=3'b010;//inc
				M1 <=1;
				if(ir[6:3] == 4'b1111)
				begin
					if(ir[2:0] == 3'b000)
					begin
						state <=4'b0100;
					end
					else
					begin
						state <=4'b0010;
					end
				end
				else if(dcond <= 1)
				begin 
					state <=4'b0101;
				end
				else
				begin
					state <=4'b0000;
				end
				
			end
			4'b0010:
			begin
				ldir <= 0;
				ldmdr <=0;
				ldmar <=1;
				ldsp <=0;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=1;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b110;//trans
				M1 <=1;
				state <=4'b0011;
			end
			4'b0011:
			begin		//////
				ldir <= 0;
				ldmdr <=1;
				ldmar <=0;
				ldsp <=1;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=1;
				tsp <=1;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=1;
				memwr <=0;
				fnsel <=3'b010;//inc
				M1 <=1;
				state <=4'b1011;
			end
			4'b0100:
			begin
				ldir <= 0;
				ldmdr <=1;
				ldmar <=0;
				ldsp <=0;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=0;
				tpc <=0;
				tt <=0;
				rd <=1;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b110;//trans
				M1 <=1;
				state <=4'b1000;
			end
			4'b0101:
			begin		//////tir<=1;
				ldir <= 0;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=0;
				ldpc <=0;
				ldt <=1;
				tir <=1;
				tmdr <=0;
				tmar <=0;
				tsp <=0;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b000;//no func
				M1 <=0;
				state <=4'b0110;
			end
			4'b0110:
			begin
				ldir <= 0;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=0;
				ldpc <=1;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=0;
				tpc <=1;
				tt <=1;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b000;//add
				M1 <=1;
				state <=4'b0000;
			end
			4'b0111:
			begin
				ldir <= 0;
				ldmdr <=1;
				ldmar <=0;
				ldsp <=0;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=0;
				tpc <=1;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b110;//trans
				M1 <=1;
				state <=4'b1000;
			end
			4'b1000:
			begin
				ldir <= 0;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=1;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=1;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b011;//dec
				M1 <=1;
				state <=4'b1001;
			end
			4'b1001:
			begin
				ldir <= 0;
				ldmdr <=0;
				ldmar <=1;
				ldsp <=0;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=1;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b110;//trans
				M1 <=1;
				state <=4'b1010;
			end
			4'b1010:
			begin		////////memwr <=1;
				ldir <= 0;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=0;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=0;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=1;
				fnsel <=3'b000;//no func
				M1 <=0;
				if(ir[6:3] == 4'b1001)
				begin
					state <=4'b0101;
				end
				else if(ir[6:3] == 4'b1111)
				begin
					state <=4'b0000;
				end
			end
			4'b1011:
			begin
				ldir <= 0;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=0;
				ldpc <=0;
				ldt <=1;
				tir <=0;
				tmdr <=1;
				tmar <=0;
				tsp <=0;
				tpc <=0;
				tt <=0;
				rd <=0;
				wr <=0;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b000;//no func
				M1 <=0;
				state <=4'b1100;
			end
			4'b1100:
			begin
				ldir <= 0;
				ldmdr <=0;
				ldmar <=0;
				ldsp <=0;
				ldpc <=0;
				ldt <=0;
				tir <=0;
				tmdr <=0;
				tmar <=0;
				tsp <=0;
				tpc <=0;
				tt <=1;
				rd <=1;
				wr <=1;
				memrd <=0;
				memwr <=0;
				fnsel <=3'b000;//no func
				M1 <=0;
				state <=4'b0000;
			end
			default:
			begin
			end
		endcase
	end
	

endmodule
