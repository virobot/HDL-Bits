module fadd(input a,b,c,output sum,cout);
    assign sum = a^b^c;
    assign cout = a&b | b&c | c&a;
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] cout;
    fadd (x[0],y[0],0,sum[0],cout[0]);
genvar i;
    generate
        for(i=1;i<4;i++)
            begin: loop1
                fadd fa(x[i],y[i],cout[i-1],sum[i],cout[i]);
            end
    endgenerate
    assign sum[4] = cout[3];
endmodule
