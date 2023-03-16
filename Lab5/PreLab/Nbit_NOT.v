`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 02:03:01 PM
// Design Name: 
// Module Name: Nbit_NOT
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


module Nbit_NOT(out, in);

parameter n = 8;
input [n-1:0] in;
output [n-1:0] out;

genvar i; 

generate
for (i=0;i<n;i=i+1)
begin
not(out[i],in[i]);
end
endgenerate
endmodule
