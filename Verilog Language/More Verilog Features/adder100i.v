module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

        FAAA F(a[0],b[0],cin,cout[0],sum[0]);
        genvar i;
        generate for(i=1;i<100;i=i+1) 
            begin: loop_first
            FAAA FA(a[i],b[i],cout[i-1],cout[i],sum[i]);
            end
        endgenerate
endmodule


module FAAA(a,b,cin,cout,sum);
    input a,b,cin;
    output cout,sum;
    assign sum = a^b^cin;
    assign cout = (a*b) | (b*cin) | (cin*a);
endmodule 