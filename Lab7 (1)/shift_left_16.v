`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 07:33:44 PM
// Design Name: 
// Module Name: shift_left_16
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


module shift_left_16(in,out
    );
parameter size = 32;

input [15:0] in;
output [size-1:0] out;

assign out = {in,16'b0000_0000_0000_0000};

endmodule
