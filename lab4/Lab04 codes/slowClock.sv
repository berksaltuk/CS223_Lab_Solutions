module slowClock( input logic clk, output logic newClk);

	logic [28:0] cntClk;
	
	always @(posedge clk)
		
		begin
			cntClk <= cntClk + 1;
			if( cntClk == 300_000_000)begin
			cntClk <= 0;
			newClk = ~newClk;
			end
		end
		
endmodule
