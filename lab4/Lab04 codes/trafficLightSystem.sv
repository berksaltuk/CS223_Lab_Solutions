module trafficLightSystem( input logic clk, reset, sA, sB,
						   output logic [1:0] lA, [1:0] lB);
	
	typedef enum logic [2:0] {s0, s1, s2, s3, s4, s5, s6, s7} statetype;
	
	statetype [2:0] state, nextstate;
	
	parameter green = 2'b00;
	parameter yellow = 2'b01;
	parameter red = 2'b10;
	
	always_ff @(posedge clk, posedge reset) // register
	
		if( reset )
			state <= s0;
		else	
			state <= nextstate; 
	
	always_comb // next state
	case( state)
		s0:
			if(sA)
				nextstate = s0;
			else
				nextstate = s1;
				
		s1: nextstate = s2;
		s2: nextstate = s3;
		s3: nextstate = s4;
		
		s4: 
			if(sB)
				nextstate = s4;
			else
				nextstate = s5;
			
		s5: nextstate = s6;
		s6: nextstate = s7;
		s7: nextstate = s0;
		default: nextstate = s0;
	endcase
	
	always_comb // output
	case( state)
		s0: 
		begin
		lA = green;
		lB = red;
		end
		
		s1: 
		begin
		lA = yellow;
		lB = red;
		end
		
		s2: 
		begin
		lA = red;
		lB = red;
		end
		
		s3: 
		begin
		lA = red;
		lB = yellow;
		end
		
		s4: 
		begin
		lA = red;
		lB = green;
		end
		
		s5: 
		begin
		lA = red;
		lB = yellow;
		end
		
		s6: 
		begin
		lA = red;
		lB = red;
		end
		
		s7: 
		begin
		lA = yellow;
		lB = red;
		end
	endcase
endmodule