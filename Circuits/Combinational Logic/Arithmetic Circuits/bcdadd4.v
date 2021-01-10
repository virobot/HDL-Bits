module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
genvar i;
    wire [3:0] cout_wire;
    bcd_fadd(a[3:0],b[3:0],cin,cout_wire[0],sum[3:0]);
    
    generate
        for(i=4;i<16;i=i+4) begin : loop
            bcd_fadd (a[i+3:i],b[i+3:i],cout_wire[i/4-1],cout_wire[i/4],sum[i+3:i]);
                      end
                      endgenerate
                      assign cout = cout_wire[3];
                      
endmodule
