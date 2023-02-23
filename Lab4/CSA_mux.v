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
module CSA_mux(carry, select, sum, A, B, c_out1, c_out2);

  input [31:0] A; 
  input [31:0] B; 
  input carry, c_out1, c_out2; 

  output select;
  output [31:0] sum; 

  assign carry = select ? c_out2 : c_out1;
  assign sum = select ? B : A;

endmodule

