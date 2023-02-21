`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 02:05:02 PM
// Design Name: 
// Module Name: four_bitadder
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


module four_bitadder(c_out,sum, A, B, c_in);

input [3:0] A; 
input [3:0] B;
input c_in;

output c_out;
output sum[3:0];


wire [4:0] c;

genvar i;

generate
for (i=0;i<4;i=i+1)
begin
    FA_str FA1_bit(sum[i],c[i+1],A[i],B[i],c[i]);
end
endgenerate

assign c[0] = c_in;
assign c_out = c[4];


endmodule
