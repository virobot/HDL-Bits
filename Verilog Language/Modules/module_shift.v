module top_module ( input clk, input d, output q );
wire q1,q2;
	
my_dff (clk,d,q1);
my_dff (clk,q1,q2);
my_dff (clk,q2,q);

endmodule