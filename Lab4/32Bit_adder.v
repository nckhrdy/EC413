`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nicholas Hardy
// 
// Create Date: 02/22/2023 12:16:00 PM
// Design Name: 
// Module Name: 16Bit_adder
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
module 32Bit_adder(c_in, sum, A, B, c_out);
  
  input [31:0] A;
  input [31:0] B; 
  input c_in;
  
  output [31:0] sum; 
  output c_out; 
  
  wire w1; 
  
  16Bit_adder 16B_A1(w1, sum[15:0], A[15:0], B[15:0], c_in);
  16Bit_adder 16B_A2(c_out, sum[31:16],A[31:16], B[31:16], w1);
  
endmodule