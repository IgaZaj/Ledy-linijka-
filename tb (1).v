`timescale 1ns / 1ps

module tb;
reg clk_i, enable_i, rst_ni, dir_i;

wire [3:0] leds_no;

ex_5 uut(clk_i, enable_i, rst_ni, dir_i, leds_no);
defparam uut.d1.DivRatio = 4;

initial

	begin	
	
	clk_i=0;
	enable_i=0;
	rst_ni=1;
	dir_i=1;
	
	#2 rst_ni=0;
	#10 rst_ni=1;
	#200 enable_i=1;	
	#1000 dir_i=0;
	
	end


always 

	clk_i= #10 !clk_i;


endmodule 