module four_to_one_mux( input logic x0, x1, x2, x3, c0, c1,
					    output logic y);
	
	logic and0, and1, and2, and3;
	
	assign and0 = x0 & ~c0 & ~c1;
	assign and1 = x1 & c0 & ~c1;
	assign and2 = x2 & ~c0 & c1;
	assign and3 = x3 & c0 & c1;
	
	assign y = and0 | and1 | and2 | and3;
endmodule