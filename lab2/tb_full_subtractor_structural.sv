module tb_full_subtractor_structural;

logic a, b, bin;
logic d, bo;

full_subtractor_structural fss1(a, b, bin, d, bo); 

initial begin
	a = 0; b = 0; bin = 0; #10;
	bin = 1; #10;
	b = 1; bin = 0; #10;
	bin = 1; #10;
	a = 1; b = 0; bin = 0; #10;
	bin = 1; #10;
	b = 1; bin = 0; #10;
	bin = 1; #10;
	
	end
endmodule