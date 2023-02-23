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
module B64Bit_csa(c_out, sum, A, B, c_in); 

input [63:0] A; 
input [63:0] B; 
input c_in; 

output [63:0] sum; 
output c_out; 

wire [31:0] sum1; 
wire [31:0] sum2;
wire w1, w2, select; 
wire c_in1, c_in2; 

assign c_in1 = 1'b0;
assign c_in2 = 1'b1;

B32Bit_adder B32B_A1(select, sum[31:0], A[31:0], B[31:0], c_in);
B32Bit_adder B32B_A2(w1, sum1[63:31], A[63:31], B[63:31], c_in1);
B32Bit_adder B32B_A3(w2, sum2[63:31], A[63:31], B[63:31], c_in2);
CSA_mux B32B_mux(c_out, sum[63:32], select,sum1[31:0],sum2[31:0], w1, w2);

endmodule