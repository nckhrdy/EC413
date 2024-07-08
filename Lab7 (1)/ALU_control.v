`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [1:0] ALUOp,
	 output reg [2:0] func
    );

 always @(*) begin
	if (ALUOp == 3'b000) begin  
		if (instruction == 6'h20)      // ADD
		func = 3'd0;
		else if (instruction == 6'h22) // SUB
		func = 3'd1;
		else if (instruction == 6'h24) // AND 
		func = 3'd2;
		else if (instruction == 6'h25) // OR
		func = 3'd3;
		else if (instruction == 6'h27) // NOR
		func = 3'd4;
		else if (instruction == 6'h26) // XOR
		func = 3'd5; 
		else if (instruction == 6'h2A) // SLT
		func = 3'd6; 
		else
		func = 3'd7;
		
	end else if (ALUOp == 3'b001) begin // BNE
        func = 3'd1;  
	   
	end else if (ALUOp == 3'b010) begin //LW and SW and LUI
		func = 3'd0;
		
	end else if (ALUOp == 3'b011) begin // ADDI
		func = 3'd0;
	end else if (ALUOp == 3'b100) begin // ANDI
		func = 3'd2;
		end
		
     else if (ALUOp == 3'b101) begin // LUI
		func = 3'd7;
	
	end 
	else begin
		func = 3'd7;
	end
   end


endmodule
