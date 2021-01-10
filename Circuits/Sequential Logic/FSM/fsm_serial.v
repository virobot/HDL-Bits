module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
	parameter IDLE=0,START=1,RECEIVE=2,WAIT=3,STOP=4;
    reg [2:0] state,next_state;
    reg [3:0] count;
    always @(*) begin
        case(state)
            IDLE : next_state = (in) ? IDLE : START;
            START : next_state = RECEIVE;
            RECEIVE : next_state = (count==8) ? ((in) ? STOP : WAIT) : RECEIVE;
            WAIT : next_state = (in) ? IDLE : WAIT;
            STOP : next_state = (in) ? IDLE : START;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            state<=IDLE;
        else
            state<=next_state;
    end
    
    always @(posedge clk) begin
        if(reset) begin
            done<=0;
        	count<=0;
        end
        else begin
            case(next_state)
                RECEIVE : begin 
                    		done<=0;
                    		count<=count+1;
                		  end
                STOP : begin
                    	done<=1;
                    	count<=0;
                end
                default : begin
                    		done<=0;
                    		count<=0;
                end
            endcase
        end
    end
endmodule
