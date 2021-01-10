module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk)
        if(~resetn)
            q<=0;
    else if(byteena[0] && byteena[1])
        q<=d;
        else if(byteena[0])
            q<={q[15:8],d[7:0]};
    else if(byteena[1])
        q<={d[15:8],q[7:0]};
    
endmodule
