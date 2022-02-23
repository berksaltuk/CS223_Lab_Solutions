module tb_func;

logic a, b, c, d, f;

func func1 (a, b, c, d, f);

integer i;
initial begin
	
	for( i = 0; i < 2**5; i++) begin
		{a, b, c, d, f} = i; #1;
	end
end

endmodule	