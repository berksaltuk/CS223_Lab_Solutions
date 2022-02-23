module tb_trafficLightSystem();

	logic clk, reset;
	logic sA, sB;
	logic [1:0] lA,  lB;
	
	trafficLightSystem tls(clk, reset, sA, sB, lA, lB);
	
	initial
		begin
		reset <= 1; #10; 
		reset <= 0;
		
		sA <= 1; sB <= 0; #10;
		sA <= 0; sB <= 0; #20;
		sA <= 0; sB <= 1; #40;
		sA <= 0; sB <= 0; #10;
		
		reset <= 1;
		
		end
	
	always // no sensitivity list, so it always executes
		begin
		clk <= 1; #5; clk <= 0; #5;
		end
	
	
endmodule	