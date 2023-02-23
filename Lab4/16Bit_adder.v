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
module 16Bit_adder(c_in, sum, A, B, c_out);
  
  input [15:0] A;
  input [15:0] B; 
  input c_in;
  
  output [15:0] sum; 
  output c_out; 
  
  wire w1, w2, w3; 
  
  four_bitadder 4B_A1(w1, sum[3:0], A[3:0], B[3:0], c_in);
  four_bitadder 4B_A2(w2, sum[7:4],A[7:4], B[7:4], w1);
  four_bitadder 4B_A3(w3, sum[11:8],A[11:8], B[11:8], w2);
  four_bitadder 4B_A4(c_out, sum[15:12],A[15:12], B[15:12], w3);
  
endmodule
  
