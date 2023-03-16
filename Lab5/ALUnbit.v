`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 01:17:13 PM
// Design Name: 
// Module Name: ALUnbit
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


module ALUnbit(result,a,b,c_in,ALop);

parameter X = 32;

input [X-1:0] a,b;
input [2:0] ALop;
input c_in;

output [X-1:0] result;

wire [X:0] carry;

assign carry[0] = c_in;

genvar i;
generate
for(i=0;i<X;i=i+1) begin: ALU
ALU1bit ALU(carry[i+1],result[i],a[i],b[i],carry[i],ALop[2:0]);
end
endgenerate

assign {result[X]} = (ALop == 3'b101) ? {~carry[X]} : {carry[X]};

endmodule
