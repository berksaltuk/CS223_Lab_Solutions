module slow_trafficLightSystem(input logic clk, reset, sA, sB,
							   output logic [1:0] lA, [1:0] lB);
		
	logic slowClk;
	
	slowClock sc ( clk, slowClk);
	trafficLightSystem tls ( slowClk, reset, sA, sB, lA, lB);

endmodule	