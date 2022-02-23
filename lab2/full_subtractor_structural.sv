module full_subtractor_structural(input logic a, b, bin, output logic d, bo);
logic xorResult, andResult, andResult2;

half_subtractor hs1(a, b, xorResult, andResult);
half_subtractor hs2( xorResult, bin, d, andResult2);

assign bo = andResult | andResult2;

endmodule

module half_subtractor(input logic a, b, output logic d, bo);

assign d = a ^ b;
assign bo = ~a & b;

endmodule