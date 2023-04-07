module hazardunit(IFIDWrite,PCWrite,HazardMux, AluOp, IDEX_Rs, IDEX_Rt, IDEX_Rd, MemDest, RegDestMuxOut);

	output reg IFIDWrite, PCWrite, HazardMux;
	input [4:0] IDEX_Rs,IDEX_Rt,IDEX_Rd, RegDestMuxOut;
	input [1:0] AluOp;
	input [4:0] MemDest;
	
    always @(*) 
    begin 
		assign IFIDWrite = 1;
		assign PCWrite = 1;
		assign HazardMux = 0;
	    
        if(RegDestMuxOut==IDEX_Rt && RegDestMuxOut!=0 && AluOp!=3 && AluOp!=0) begin
            assign IFIDWrite = 0;
            assign PCWrite = 0;
            assign HazardMux = 1; 
        end    
        else if(RegDestMuxOut==IDEX_Rs && RegDestMuxOut!=0) begin 
            assign IFIDWrite = 0;
            assign PCWrite = 0;
            assign HazardMux = 1; 
        end
        else if(MemDest==IDEX_Rt && MemDest!=0 && AluOp!=3 && AluOp!=0) begin 
            assign IFIDWrite = 0;
            assign PCWrite = 0;
            assign HazardMux = 1; 
        end
        else if(MemDest==IDEX_Rs && MemDest!=0) begin
            assign IFIDWrite = 0;
            assign PCWrite = 0;
            assign HazardMux = 1; 
        end
        else begin
            assign IFIDWrite = 1;
            assign PCWrite = 1;
            assign HazardMux = 0;
        end
        
   end
        
endmodule