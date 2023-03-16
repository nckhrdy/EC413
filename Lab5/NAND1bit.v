`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:51:53 PM
// Design Name: 
// Module Name: NAND1bit
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


module NAND1bit(out1,in1,in2);

input in1;
input in2;

output out1;

wire sum,c_out;

FA_str fa_inst(c_out,sum,in1,in2,1'b1);
and #1 and_inst(out1,sum,c_out);

endmodule
