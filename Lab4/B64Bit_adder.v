`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nicholas Hardy
// 
// Create Date: 02/22/2023 12:16:00 PM
// Design Name: 
// Module Name: 64Bit_adder
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
module B64Bit_adder(c_in, sum, A, B, c_out);
  
  input [63:0] A;
  input [63:0] B; 
  input c_in;
  
  output [63:0] sum; 
  output c_out; 
  
  wire w1, w2, w3; 
  
  B16Bit_adder B16B_A1(w1, sum[15:0], A[15:0], B[15:0], c_in);
  B16Bit_adder B16B_A2(w1, sum[31:16], A[31:16], B[31:16], w1);
  B16Bit_adder B16B_A3(w1, sum[47:32], A[47:32], B[47:32], w2);
  B16Bit_adder B16B_A4(c_out, sum[63:48], A[63:48], B[63:48], w3);
  
endmodule
