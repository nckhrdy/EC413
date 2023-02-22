`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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
module 64Bit_adder_tb;
  
  // Inputs
  reg [63:0] A;
  reg [63:0] B;
	reg c_in;
	reg clk;
	// Outputs
	wire c_out;
	wire [63:0] sum;
	wire error_flag;
	wire c_out_verify;
	wire [63:0] sum_verify;
  
  // Instantiate the Unit Under Test (UUT)
	Adder64 uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
