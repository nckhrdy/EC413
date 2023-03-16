`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:57:44 PM
// Design Name: 
// Module Name: SLT1bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TOPnbit_verification(result,clk,c_in,a,b,ALop);

  parameter X = 32;
	input [2:0] ALop;
	input clk;
	input [X-1:0] a, b;
	input c_in;
	output [X:0] result;

	
	wire [X-1:0] sum_to_reg;
	
	assign { result} = //verifies each function 
	(ALop == 3'b000) ? {a}:
	(ALop == 3'b001) ? {~a}:
	(ALop == 3'b011) ? {a&b}:
	(ALop == 3'b100) ? {a|b}:
	(ALop == 3'b101) ? {a-b}:
	(ALop == 3'b110) ? a+b+c_in:
	0;

endmodule