module eight_to_one_mux( input logic x0, x1, x2, x3,
								     x4, x5, x6, x7,
									 c0, c1, c2,
						 output logic y);
	
	logic result1, result2;
	
	four_to_one_mux ftom1(x0, x1, x2, x3, c0, c1, result1);
    four_to_one_mux ftom2(x4, x5, x6, x7, c0, c1, result2);
    
	assign y = (result1 & ~c2) | (result2 & c2);
	
endmodule