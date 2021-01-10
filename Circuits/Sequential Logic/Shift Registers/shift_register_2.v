module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    MUXDFF(LEDR[3],KEY[3],SW[3],KEY[0],KEY[1],KEY[2],LEDR[3]);
    MUXDFF(LEDR[2],LEDR[3],SW[2],KEY[0],KEY[1],KEY[2],LEDR[2]);
    MUXDFF(LEDR[1],LEDR[2],SW[1],KEY[0],KEY[1],KEY[2],LEDR[1]);
    MUXDFF(LEDR[0],LEDR[1],SW[0],KEY[0],KEY[1],KEY[2],LEDR[0]);
endmodule

module MUXDFF (input mux0_0,mux0_1,mux1_1,clk,E,L, output Q);
    wire q1,q2;
    assign q1 = (E) ? mux0_1 : mux0_0;
    assign q2 = (L) ? mux1_1 : q1;
    always @(posedge clk) begin
        Q<=q2;
    end

endmodule
