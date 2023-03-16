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
wire c_out_add;
wire c_out_sub;
wire not_b;

wire addORsubb_select;

assign addORsubb_select = (ALop == 3'b101);

not not1(not_b,b);

MOV1bit mov(MOV_out,a);
NOT1bit not(NOT_out,a);
FA_str adder(c_out_add,ADD_out,a,b,c_in);
FA_str subtracter(c_out_sub,SUB_out,a,not_b,c_in);
OR1bit Or(OR_out,a,b);
AND1bit And(AND_out,a,b);

MUXadd aMux(c_out,c_out_add,c_out_sub,addORsubb_select);
MUX_3_to_8 t2eMux(result,MOV_out,NOT_out,ADD_out,SUB_out,OR_out,AND_out,NOR_out,NAND_out,SLT_out,ALop);

endmodule
