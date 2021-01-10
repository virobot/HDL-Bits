/* module top_module(input a,b,c,d, output out, out_n);
wire two_wire1, two_wire2, one_wire1;
assign two_wire1 = a&b;
assign two_wire2 = c&d;
assign one_wire1 = two_wire1 | two_wire2;
assign out = one_wire1;
assign out_n = ~one_wire1;
endmodule */

module top_module(input a,b,c,d, output out, out_n);
wor one_wire;
assign one_wire = a&b;
assign one_wire  = c&d;
assign out = one_wire;
assign out_n = ~one_wire;
endmodule