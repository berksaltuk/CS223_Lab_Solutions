module reduceSum(input logic clock, reset, 
                 input logic buttonSum,
                 input logic[7:0] readData2,
                 output logic [3:0] readAddress2,
				 output logic[11:0] sum);

typedef enum logic [1:0] {s0, s1, s2} statetype;

statetype [2:0] state, nextstate;

logic [4:0] i, nextI;
logic [11:0] tempSum, nextSum;

assign sum = tempSum;
assign readAddress2 = i;

always_ff @(posedge clock) // register
begin
        if(reset)begin
            state <= s0;
            i <= 0;
            tempSum <= 0;
        end
            
        else begin
			state <= nextstate; 
			i <= nextI;
			tempSum <= nextSum;
		end
end

always_comb // next state
	case( state)
		s0: begin
			if(buttonSum) begin
				nextstate = s1; end
			else begin
				nextstate = s0; end
		nextI = i;
		nextSum = tempSum;
		end
		s1: 
		begin
		    nextI = 0;
		    nextSum = 0;
		    nextstate = s2;
		end    		
		s2:
		begin
		   if(i < 16)
		   begin 
		      nextSum = tempSum + readData2;
                      
              nextstate = s2;
		       end
		   else begin
		        nextstate = s0;end
		 nextI = i + 1;  
		 end 
    default: nextstate = s0;
	endcase

endmodule