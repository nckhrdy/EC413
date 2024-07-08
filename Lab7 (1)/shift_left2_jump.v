`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2023 04:56:30 PM
// Design Name: 
// Module Name: shift_left2_jump
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


module shift_left2_jump(
in,out

    );

input [25:0] in;
output [27:0] out;

assign out = {in,2'b00};

endmodule