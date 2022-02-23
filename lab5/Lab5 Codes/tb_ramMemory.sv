module tb_ramMemory();

	logic clock, writeEnable;
	logic [3:0] writeAddress;
	logic [7:0] writeData; 
	logic [3:0] readAddress1;
	logic [3:0] readAddress2;
	logic [7:0] readData1; 
	logic [7:0] readData2;
	
	ramMemory ram(clock, writeEnable, writeAddress, writeData, readAddress1, readAddress2,
				  readData1, readData2);
				  
	initial
		begin
		writeEnable = 1; writeAddress = 4'b0000;
		writeData = 8'b00_000_001; #10
		
		writeAddress = 4'b0001; 
		writeData = 8'b00_000_100; #10
		
		readAddress1 = 4'b0001; #10 readAddress2 = 4'b0100; #10
		
		
		writeEnable = 0;
		end
		
	always // no sensitivity list, so it always executes
		begin
		clock <= 1; #5; clock <= 0; #5;
		end
		
	endmodule