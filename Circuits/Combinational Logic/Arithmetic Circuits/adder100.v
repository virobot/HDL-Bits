module fadd(input a,b,c,output sum,cout);
    assign sum = a^b^c;
    assign cout = a&b | b&c | c&a;
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
genvar i;
    wire [99:0] cout_wire;
    fadd (a[0],b[0],cin,sum[0],cout_wire[0]);
    generate
        for(i=1;i<100;i++) begin: loop
            fadd fa(a[i],b[i],cout_wire[i-1],sum[i],cout_wire[i]);
        end
    endgenerate
    assign cout = cout_wire[99];
    
endmodule
