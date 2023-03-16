`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:57:44 PM
// Design Name: 
// Module Name: SLT1bit
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


module SLT1bit(out1,in1,in2);

input [31:0] in1;
input [31:0] in2;

output out1;

assign out1 = (in1<in2) ? 1:0;


endmodule
