module tb_full_adder_structural;

logic a, b, cin;
logic sum, cout;

full_adder has1(a, b, cin, sum, cout);

initial begin
	a = 0; b = 0; cin = 0; #10;
	cin = 1; #10;
	b = 1; cin = 0; #10;
	cin = 1; #10;
	a = 1; b = 0; cin = 0; #10;
	cin = 1; #10;
	b = 1; cin = 0; #10;
	cin = 1; #10;
	
	end
endmodule	

