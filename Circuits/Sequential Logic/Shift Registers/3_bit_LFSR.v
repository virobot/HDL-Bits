module LFSR (input mux0,mux1,clk, L, output Q);
    wire L_out;
    assign L_out = (L) ? mux1 : mux0;
    always @(posedge clk)
        begin
            Q<=L_out;
        end
endmodule

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    LFSR (LEDR[2],SW[0],KEY[0],KEY[1],LEDR[0]);
    LFSR (LEDR[0],SW[1],KEY[0],KEY[1],LEDR[1]);
    LFSR (LEDR[1]^LEDR[2],SW[2],KEY[0],KEY[1],LEDR[2]);
endmodule
