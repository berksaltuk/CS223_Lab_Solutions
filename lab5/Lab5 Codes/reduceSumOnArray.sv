`timescale 1ns / 1ps
module reduceSumOnArray(input logic clock, writeEnable, buttonSum, buttonNext, buttonPrev, reset,
				  input logic [3:0] writeAddress, 
				  input logic [7:0] writeData,  
				  output logic [11:0] sum,
				  output logic [6:0] seg,
				  output logic [3:0] an,
				  output logic dp);

logic pulse, pulse1, pulse2, pulse3;

logic [7:0] readData1;
logic [7:0] readData2;
logic [3:0] readAddress1; 
logic [3:0] readAddress2;

initial begin
    readData1 = 0;
    readAddress1 = 0; 
    readData2 = 0;
    readAddress2 = 0;
end

debounce d( clock, writeEnable, pulse);
debounce d1( clock, buttonNext, pulse1);
debounce d2( clock, buttonPrev, pulse2);
debounce d3( clock, buttonSum, pulse3);
debounce d4( clock, reset, pulse4);


always_ff@( posedge clock)
	begin
	if( pulse1 )begin
	   if( readAddress1 < 16)begin
	       readAddress1 <= readAddress1 + 1; 
	       end
	   else begin
	       readAddress1 <= 4'b0000;
	   end
	end
	else if(pulse2) begin
	   if( readAddress1 > 0)begin
	       readAddress1 <= readAddress1 - 1; 
	       end
	   else begin
	       readAddress1 <= 15;
	   end
    end
	else begin
	   readAddress1 <= readAddress1; end
	end

reduceSum rs( clock, pulse4, pulse3, readData2, readAddress2, sum);	

ramMemory ram(clock, pulse, pulse4, writeAddress, writeData, readAddress1, readAddress2, readData1, readData2);

SevSeg_4digit sev(clock, readAddress1, 0, readData1[7:4], readData1[3:0], seg, dp, an);

endmodule