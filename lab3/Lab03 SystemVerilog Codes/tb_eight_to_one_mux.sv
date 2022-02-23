module tb_eight_to_one_mux;

logic x0, x1, x2, x3, x4, x5, x6, x7, c0, c1, c2, y;

eight_to_one_mux etom1(x0, x1, x2, x3, x4, x5, x6, x7, c0, c1, c2, y);

integer i;
initial begin
	
	for( i = 0; i < 2**11; i++) begin
		{x0, x1, x2, x3, x4, x5, x6, x7, c0, c1, c2} = i; #1;
	end
end

endmodule	