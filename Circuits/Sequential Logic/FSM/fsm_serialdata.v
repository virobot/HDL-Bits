module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
	parameter IDLE=0,START=1,RECEIVE=2,STOP=3,WAIT=4;
    reg [2:0] state, next_state;
    reg [3:0] count;
    reg [7:0] data;
    // Use FSM from Fsm_serial
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
    
    // New: Datapath to latch input bits.
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
    
    always @(posedge clk) begin
        if(reset)
            data<=0;
        else if(next_state == RECEIVE)
            data[count]<=in;
    end
    
    assign out_byte = (done) ? data : 0;
endmodule
