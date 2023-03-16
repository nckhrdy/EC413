`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 02:05:16 PM
// Design Name: 
// Module Name: Nbit_RegAdd
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


module Nbit_RegAdd(c_in, c_out, sum, a, b, clk, select);

parameter n=8;

input [n-1:0] a;
input [n-1:0] b;
input c_in;
input clk; 
output c_out;
output [n-1:0] sum;
input select;

wire [n-1:0] sum_adder;
wire [n-1:0] sum_select;
wire c_adder;
wire [n-1:0] not_a_out;

Nbit_Adder #(n) Adder (c_adder, sum_adder, a,b,c_in);
Nbit_NOT #(n) Not (not_a_out,a);
assign sum_select = select ? not_a_out: sum_adder;
Nbit_Register #(n) Sum_Reg (sum, sum_selet, clk);
Nbit_Register #(1) Cout_Reg (c_out, c_adder, clk);
endmodule
