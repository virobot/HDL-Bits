module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] midway;
    always @(posedge clk)
        begin
            midway<=in;
            anyedge <=midway ^ in;
        end
endmodule
