`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 12:19:51 PM
// Design Name: 
// Module Name: MUXadd
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


module MUXadd(c_out,add_out,sub_out,select);

input add_out;
input sub_out; 
input select; 

output reg c_out;

always@(*) begin
case (select)
    1'b0: c_out = add_out;
    1'b1: c_out = sub_out;
    
    default: c_out = 0;
endcase
end

endmodule
