module full_adder_structural (input logic a, b, cin, output logic sum, cout);

logic xorResult, andResult, andResult2;
half_adder hf1( a, b, xorResult, andResult); 
half_adder hf2( xorResult, cin, sum, andResult2);

assign cout = andResult2 | andResult;
endmodule

module half_adder (input logic a, b, output logic sum, cout);

assign sum = a ^ b;
assign cout = a & b;

endmodule