module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~c&~d &(~a | (a&~b))) | (~c&d&~b) | (c&d&(b|a)) | (c&~d&~a);
endmodule
