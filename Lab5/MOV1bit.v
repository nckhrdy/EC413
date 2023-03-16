`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:07:44 PM
// Design Name: 
// Module Name: MOV1bit
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


module MOV1bit(out1,in1);

input in1; 
output out1;

wire w1;

not not1(w1,in1);
not not2(out1,w1);

endmodule
