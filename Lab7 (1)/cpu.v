`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:11:33 10/25/2016
// Design Name:
// Module Name:    cpu
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

// Define the module 'cpu' and its input and output ports
module cpu(
     rst,
	 clk,
	 initialize,
	 instruction_initialize_data,
	 instruction_initialize_address
);

    // Input ports
    input rst;
    input clk;
    input initialize;
    input [31:0] instruction_initialize_data;
    input [31:0] instruction_initialize_address;

    // Output wires
    wire [31:0] PC_out;
    wire [31:0] instruction;
    wire [31:0] instruction_mem_out;
    assign instruction = (initialize) ? 32'hFFFF_FFFF : instruction_mem_out;
    wire jump; 
    wire [31:0] PC_int; 

    // Instantiate the instruction memory module
    InstrMem InstructionMemory (
        instruction_mem_out, // Output port for instruction memory
        instruction_initialize_data, // Input port for instruction memory data
        (initialize) ? instruction_initialize_address : PC_out, // Input port for instruction memory address
        initialize, // Input port for instruction memory initialization signal
        clk // Input port for clock signal
    );

    // Instantiate the control module
    wire [1:0] ALUOp;
    wire MemRead;
    wire MemtoReg;
    wire RegDst;
    wire Branch; 
    wire ALUSrc;
    wire MemWrite;
    wire RegWrite;
    wire BNE;
    wire Jump;
    wire LUI;
    control Control(
        instruction [31:26], // Input port for instruction opcode
        ALUOp, // Output port for ALU operation type
        MemRead, // Output port for memory read signal
        MemtoReg, // Output port for memory to register signal
        RegDst, // Output port for register destination signal
        Branch, // Output port for branch signal
        ALUSrc, // Output port for ALU source signal
        MemWrite, // Output port for memory write signal
        RegWrite, // Output port for register write signal
        BNE, 
        Jump, 
        LUI
    );

    // Instantiate the register file module
    wire [31:0] write_data;
    wire [4:0] write_register;
    wire [31:0] read_data_1, read_data_2;
    wire [31:0] ALUOut, MemOut;
    mux #(5) Write_Reg_MUX (RegDst, instruction[20:16], instruction[15:11], write_register);
    nbit_register_file Register_File(
        write_data, // Input port for data to be written to register
        read_data_1, // Output port for register data 1
        read_data_2, // Output port for register data 2
        instruction[25:21], // Input port for register source 1 address
        instruction[20:16], // Input port for register source 2 address
        write_register, // Input port for register destination address
        RegWrite, // Input port for register write signal
        clk // Input port for clock signal
    );

    // Instantiate the sign extend module
    wire [31:0] immediate;
    sign_extend Sign_Extend(instruction[15:0], immediate);
    
    
    wire [31:0] LUI_imm;
	  shift_left_16 #(32) Shift_Left_16 (instruction[15:0], LUI_imm);
	 
	 
	 wire [31:0] ALU_imm;
	  mux #(32) ALU_Input_Imm_Mux (LUI, immediate, LUI_imm, ALU_imm);
    

    /// Define wires for the ALU module
    wire [31:0] ALU_input_2;
    wire zero_flag;
    wire [2:0] ALU_function;
    
    // Instantiate the multiplexer to select the second input to the ALU
    mux #(32) ALU_Input_2_Mux (ALUSrc, read_data_2, ALU_imm, ALU_input_2);
    
    // Instantiate the ALU control module to determine the ALU operation
    ALU_control ALU_Control(instruction[5:0], ALUOp, ALU_function);
    
    // Instantiate the ALU module to perform the ALU operation
    ALU ALU(read_data_1, ALU_input_2, ALU_function, ALUOut, zero_flag);
    
    // Instantiate the memory module to access the data memory
    Memory Data_Memory(ALUOut, read_data_2, MemOut, MemRead, MemWrite, clk);
    
    // Instantiate the multiplexer to select the output of the ALU or memory for the write data
    mux #(32) ALU_Mem_Select_MUX (MemtoReg, ALUOut, MemOut, write_data);
    
    // Define wires for the program counter module
    wire [31:0] PC_in;
    wire [31:0] PC_plus_4;
    wire [31:0] Branch_target_address;
    wire [31:0] immediate_x_4;
    
    // Instantiate the program counter module
    PC Program_Counter(PC_out, PC_in, clk, rst);
    
    // Instantiate the adder module to increment the program counter by 4
    Adder #(32) PC_Increment_Adder (PC_out, 32'd4, PC_plus_4);
    
    // Instantiate the shift left 2 module to multiply the immediate value by 4 for the branch target address
    shift_left_2 #(32) Shift_Left_Two (immediate, immediate_x_4);
    
    // Instantiate the adder module to calculate the branch target address
    Adder #(32) Branch_Target_Adder (PC_plus_4, immediate_x_4, Branch_target_address);
    
    // Define wire for the program counter source
    wire PCSrc;
    wire PC_BEQ;
    
    // Perform an AND operation to determine if the branch should be taken
    and Branch_And (PC_BEQ, Branch, zero_flag);
    wire PC_BNE;
	and BNE_And (PC_BNE, BNE, ~(zero_flag));
	or PC_Or (PCSrc, PC_BEQ, PC_BNE);
    
    // Instantiate the multiplexer to select the program counter input
    mux #(32) PC_Input_MUX (PCSrc, PC_plus_4, Branch_target_address, PC_int);
    
    //Instantiate JUMP
    
    wire [27:0] shift_left_out;
    
    shift_left2_jump #(28) jump_target (instruction[25:0], shift_left_out[27:0]);
    
    wire [31:0] target_addr; 
    assign target_addr = {PC_out[31:28], shift_left_out};
    
    mux #(32) mux_JUMP (Jump, PC_int, target_addr, PC_in);


endmodule