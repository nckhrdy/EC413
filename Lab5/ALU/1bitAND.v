`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 04:32:55 PM
// Design Name: 
// Module Name: 1bitAND
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
module 1bitAND(out1,in1,in2);
input in1; 
input in2;
output out1;

and and1(out1,in1,in2);

endmodule