module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] midway;
    always @(posedge clk) begin
        midway <=in;
        pedge <= in & ~midway;
    end
endmodule
