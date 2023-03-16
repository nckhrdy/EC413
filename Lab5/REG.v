`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:28:10 PM
// Design Name: 
// Module Name: REG
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


module REG(reg_out,clk,reg_in);

parameter X = 32;

input clk; 
input [X:0] reg_in;

output [X:0] reg_out;

reg [X:0] register; 

assign reg_out = register;

always@(posedge clk) begin
register <= reg_in;
end

endmodule
