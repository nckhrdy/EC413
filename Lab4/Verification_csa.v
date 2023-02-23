`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nicholas Hardy
// 
// Create Date: 02/22/2023 12:16:00 PM
// Design Name: 
// Module Name: 64Bit_adder_tb
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
module Verification_csa(c_out, sum, a, b, c_in);

	input [63:0] A;    
	input [63:0] B; 

	input c_in;

  output [63:0] sum;

	output c_out;
    
	assign {c_out, sum} = A + B + c_in;

endmodule