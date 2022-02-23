module tb_two_to_four_decoder;

logic a, b;
logic y0, y1, y2, y3;

two_to_four_decoder ttfd1( a, b, y0, y1, y2, y3);

initial begin
	a = 0; b = 0; #10;
	a = 0; b = 1; #10;
	a = 1; b = 0; #10;
	a = 1; b = 1; #10;
end
endmodule