module two_bit_adder(input logic a0, b0, a1, b1, cin0 output logic sum0, sum1, cout1);
	
	logic cin1;
	
	full_adder fa1(a0, b0, cin0,sum0, cin1);
	full_adder fa1(a1, b1, cin1, sum1, cout1);
	
	
endmodule
