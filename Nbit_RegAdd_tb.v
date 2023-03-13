`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 02:11:11 PM
// Design Name: 
// Module Name: Nbit_RegAdd_tb
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


module Nbit_RegAdd_tb;

parameter x=8;
reg [x-1:0] a;
reg [x-1:0] b;
reg c_in;
reg select;
reg clk;

wire c_out;
wire [x-1:0] result;
wire c_out_verify;
wire [x-1:0] sum_verify;
wire error_flag;

Nbit_RegAdd #(.n(x)) RegAdder (
    .c_in(c_in),
    .a(a),
    .c_out(c_out),
    .sum(result),
    .select(select),
    .b(b),
    .clk(clk));
    
    Verification_RegAdder #
endmodule
