`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:3003/21/2023 
// Design Name: 
// Module Name:     
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

module nbit_register_file_tb;

  parameter data_width = 32;
  parameter select_width = 5;

  // Inputs to the module
    reg clk;
    reg rst;
    reg [data_width-1:0] write_data;
    reg [4:0] read_sel_1;
    reg [4:0] read_sel_2;
    reg [4:0] write_address;
    reg RegWrite;

    // Outputs from the module
    wire [data_width-1:0] read_data_1;
    wire [data_width-1:0] read_data_2;

    // Instantiate the module
    nbit_register_file dut (
        .clk(clk),
        .rst(rst),
        .write_data(write_data),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .read_sel_1(read_sel_1),
        .read_sel_2(read_sel_2),
        .write_address(write_address),
        .RegWrite(RegWrite)
    );

    // Clock generator
    always #5 clk = ~clk;

    // Stimulus generation
    initial begin
        // Reset the module
        rst = 1;
        #10;
        rst = 0;

        // Write some values to the register file
        write_data = 32'h12345678;
        write_address = 5'h01;
        RegWrite = 1;
        #10;
        write_data = 32'hdeadbeef;
        write_address = 5'h02;
        RegWrite = 1;
        #10;
        write_data = 32'habcdef01;
        write_address = 5'h03;
        RegWrite = 1;
        #10;
        RegWrite = 0;

        // Read some values from the register file
        read_sel_1 = 5'h01;
        read_sel_2 = 5'h03;
        #10;
        
    end

endmodule