`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 12:16:00 PM
// Design Name: 
// Module Name: 64Bit_adder_tb
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
module 64Bit_adder_tb;
  
  // Inputs
  reg [63:0] A;
  reg [63:0] B;
  reg c_in;

  reg clk;
	
  // Outputs
  wire c_out;
  wire [63:0] sum;
  wire error_flag;
  wire c_out_verify;
  wire [63:0] sum_verify;
  
  // Instantiate the Unit Under Test (UUT)
	64Bit_adder 64uut (
		.c_out(c_out), 
		.sum(sum), 
		.A(A), 
		.B(B), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification64bit Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.A(A), 
		.B(B), 
		.c_in(c_in)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			// Use $display here instead of $monitor
			// $monitor will display the message whenever there's a change of a, b, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		
		A = 0;
		B = 0;
		c_in = 1;

		// Wait 10 ns
		#10;
		A = 1;
		B = 0;
		c_in = 1;

	end

	always #20 {A,B,c_in} = {A,B,c_in} + 1;
      
endmodule
