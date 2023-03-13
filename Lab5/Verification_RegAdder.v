module Verification_RegAdder(c_out,a,b,c_in,select,clk);
  parameter n=8; 
  input [n-1:0] a; 
  input [n-1:0] b; 
  input c_in; 
  output reg c_out;
  output reg [n-1:0] sum; 
  output select; 
  input clk;
  
  wire [n-1:0] sum_temp; 
  wire c_out_temp;
  assign {c_out_temp, sum_temp} = a + b + c_in;
  
  always@(posedge clk)
    begin 
      c_out <= c_out_temp; 
      sum <= (select) ? ~a : sum_temp;
    end
endmodule
