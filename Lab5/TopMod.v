`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:12:15 PM
// Design Name: 
// Module Name: OR1bit
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

module TopMod(R0,R0_verify,clk,a,b,c_in,ALop);

parameter X = 32;

input c_in;
input clk;
input [X-1:0] a;
input [X-1:0] b;
input [2:0] ALop;

output [X:0] R0;
output [X:0] R0_verify;

wire [X:0] w1;
wire [X:0] w2;
wire c_out;

ALUnbit alu(w1,a,b,c_in,ALop);
TOPnbit_verification verify(w2,clk,c_in,a,b,ALop);

REG regi(R0,clk,w1);
REG regi_v(R0_verify,clk,w2);

endmodule