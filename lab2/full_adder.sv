module full_adder(input logic a, b, 
				  input logic cin,
				  output logic sum, cout);
	logic firstXor, firstAnd, secondAnd; //internal nodes
	
	assign firstXor = a ^ b;
	assign sum = firstXor ^ cin;
	
	assign firstAnd = firstXor & cin;
	assign secondAnd = a & b;
	
	assign cout = firstAnd | secondAnd;
endmodule 