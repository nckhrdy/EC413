`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:32:26 PM
// Design Name: 
// Module Name: ALU1bit
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


module ALU1bit(c_out,result,a,b,c_in,ALop);

input a;
input b; 
input c_in; 
input [2:0] ALop;

output c_out;
output result; 

wire MOV_out; 
wire NOT_out; 
wire ADD_out; 
wire SUB_out; 
wire OR_out; 
wire AND_out; 
wire NOR_out; 
wire NAND_out; 
wire SLT_out; 

wire addORsubb_select = (ALop == 3'b101);

not not1(not_b,b);



endmodule
