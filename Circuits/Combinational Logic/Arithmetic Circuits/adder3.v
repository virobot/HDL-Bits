module fadd(input a,b,c,output cout,sum);
    assign sum = a^b^c;
    assign cout = a&b | b&c | c&a;
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
genvar i;
    fadd(a[0],b[0],cin,cout[0],sum[0]);
    generate
        for(i=1;i<3;i++)
            begin :loop1
                fadd fa(a[i],b[i],cout[i-1],cout[i],sum[i]);
            end
    endgenerate
endmodule
