module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
	parameter IDLE=0,START=1,RECEIVE=2,WAIT=3,STOP=4,CHECK=5;
    reg [2:0] state,next_state;
    reg [3:0] count;
    reg [7:0] out;
    reg odd_reset;
    reg odd_reg;
    wire odd;
    // Modify FSM and datapath from Fsm_serialdata
    always @(*) begin
        case(state)
            IDLE : next_state = (in) ? IDLE : START;
            START : next_state = RECEIVE;
            RECEIVE : next_state = (count==8)? CHECK : RECEIVE;
            CHECK : next_state = (in) ? STOP : WAIT;
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
        if(reset)
            count<=0;
        else begin
          case(next_state)
            RECEIVE: begin
                		count <= count +1;
            end
            STOP : begin
                	count<=0;
            end
        	default: count<=0;
          endcase
        end
    end
    
    always @(posedge clk) begin
        if(reset)
            out <=0;
        else if(next_state == RECEIVE)
            out[count] <= in;
    end
    
    parity (clk, reset | odd_reset,in,odd);
    
    always @(posedge clk) begin
        if(reset)
            odd_reg <=0;
        else
            odd_reg <=odd;
    end
    
    always @(posedge clk) begin
        case(next_state)
            STOP : odd_reset <= 1;
            IDLE : odd_reset <= 1;
            default : odd_reset <= 0;
        endcase
    end
    
    
    assign done = ((state == STOP) && odd_reg);
    assign out_byte = (done) ? out : 8'b0;        
            
        
        
    // New: Add parity checking.

endmodule
