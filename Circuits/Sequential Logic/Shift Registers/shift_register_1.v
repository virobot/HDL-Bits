module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg q1,q2,q3;
    always @(posedge clk) begin
        if(~resetn)
            out<=0;
        else begin
           out = in>>1;
        end
    end
endmodule
