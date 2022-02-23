`timescale 1ns / 1ps
module ramMemory( input logic clock, writeEnable, reset, 
				  input logic [3:0] writeAddress, 
				  input logic [7:0] writeData, 
				  input logic [3:0] readAddress1, 
				  input logic [3:0] readAddress2, 
				  output logic [7:0] readData1, 
				  output logic [7:0] readData2);

logic [7:0] RAM[15:0];

always_ff @(posedge clock) begin
    if( reset ) begin 
    for(int i = 0; i < 16; i++)begin
	   RAM[i] = 8'b00000000;
    end end
	else if (writeEnable) 
	begin
		if( writeAddress == readAddress1)
        begin
		readData1 <= writeData;
        RAM[writeAddress] <= writeData;
        end
        else
        begin
            RAM[writeAddress] <= writeData;
        end
    readData2 <= RAM[readAddress2];
	end
	
    else 
    begin
		readData1 <= RAM[readAddress1];
		readData2 <= RAM[readAddress2];
	end
end
endmodule