module BCD (input clk, reset, ena, output reg [3:0] Q);
    always @(posedge clk) begin
        if(reset)
            Q<=0;
        else if(ena) begin
            if(Q==9)
                Q<=0;
        	else
                Q<=Q+1;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && q[3:0] == 4'd9, q[3:0] == 4'd9};
    BCD bcd0(clk,reset,1,q[3:0]);
    BCD bcd1(clk,reset,ena[1],q[7:4]);
    BCD bcd2(clk,reset,ena[2],q[11:8]);
    BCD bcd3(clk,reset,ena[3],q[15:12]);
endmodule
