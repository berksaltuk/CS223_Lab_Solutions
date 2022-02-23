module func(input logic a, b, c, d, output logic f);

	eight_to_one_mux muxFunc(1, d, ~d, d, ~d, 1, 0, d, c, b, a, f);

endmodule