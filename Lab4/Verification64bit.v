//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:17 02/22/2023 
// Design Name: 
// Module Name:    Verification64bit
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Verification64bit(c_out, sum, A, B, c_in);

  input	[63:0] A;
  input [63:0] B;
  input c_in; 
  
  output [63:0] sum; //declare outputs c_out and sum, one bit each
  output c_cout;

  assign {c_out, sum} = A + B + c_in;

endmodule
