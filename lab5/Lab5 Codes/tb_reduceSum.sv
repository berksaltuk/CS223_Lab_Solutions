module tb_reduceSum();
    
    logic clock, writeEnable;
	logic [3:0] writeAddress;
	logic [7:0] writeData; 
	logic [3:0] readAddress1;
	logic [3:0] readAddress2;
	logic [7:0] readData1; 
	logic [7:0] readData2;
	logic  buttonSum;
	logic reset;
    logic [11:0] sum;

    reduceSum rs( clock, reset, buttonSum, readData2, readAddress2, sum);	
	ramMemory ram(clock, writeEnable, reset, writeAddress, writeData, readAddress1, readAddress2,
				  readData1, readData2);
			  
	
	initial
		begin
		reset = 1; #100 reset = 0;
		writeEnable = 1; 
		
		for( int i = 0; i < 8; i++)
		begin
		  writeAddress = i;#10;
		  writeData = i;#10;
		end
		
		for( int i = 8; i < 16; i++)
		begin
		  writeAddress = i;#10;
		  writeData = 1;#10;
		end
		writeEnable = 0;
		
		for( int i = 0; i < 16; i++)
		begin
		  readAddress1 = i;#10;
		end

	   buttonSum = 1; #30
	   buttonSum = 0;
	end

		
always // no sensitivity list, so it always executes
		begin
		clock <= 1; #5; clock <= 0; #5;
		end
endmodule