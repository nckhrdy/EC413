`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 01:03:19 PM
// Design Name: 
// Module Name: MUX_3_to_8
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


module MUX_3_to_8(out1,MOV_out,NOT_out,ADD_out,SUB_out,OR_out,AND_out,NOR_out,NAND_out,SLT_out,select);

input MOV_out,NOT_out,ADD_out,SUB_out,OR_out,AND_out,NOR_out,NAND_out,SLT_out;
input [2:0] select;

output reg out1;

always@(*) begin
case(select)
    3'b000: out1 = MOV_out;
    3'b001: out1 = NOT_out;
    3'b010: out1 = ADD_out;
    3'b011: out1 = NOR_out;
    3'b100: out1 = SUB_out;
    3'b101: out1 = NAND_out;
    3'b110: out1 = AND_out;
    3'b111: out1 = SLT_out;
endcase 
end
endmodule
