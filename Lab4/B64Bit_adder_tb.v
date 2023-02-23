`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nicholas Hardy
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
module B64Bit_adder_tb;
  
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
	B64Bit_adder B64uut (
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
			// $monitor will display the message whenever there's a change of A, B, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when A = %d, B = %d, c_in = %d\n", A, B, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		// Test case 1: A and B are both zero
    A = 64'b0;
    B = 64'b0;
    c_in = 0;
    #10; // Wait for adder to compute sum
    $display("sum = %b, c_out = %b", sum, c_out);
    
    // Test case 2: A and B are both one
    A = 64'b1;
    B = 64'b1;
    c_in = 0;
    #10; // Wait for adder to compute sum
    $display("sum = %b, c_out = %b", sum, c_out);
    
    // Test case 3: A and B have alternating bits
    A = 64'b0101010101010101;
    B = 64'b1010101010101010;
    c_in = 0;
    #10; // Wait for adder to compute sum
    $display("sum = %b, c_out = %b", sum, c_out);
    
    // Test case 4: A and B have maximum values
    A = 64'hffffffffffffffff;
    B = 64'hffffffffffffffff;
    c_in = 0;
		$display("sum = %b, c_out = %b", sum, c_out);

	end
      
endmodule