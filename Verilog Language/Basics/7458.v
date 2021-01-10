module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wor wire1,wire2;

assign wire1 = p2a & p2b;
assign wire1 = p2c & p2d;

assign wire2 = p1a & p1b & p1c;
assign wire2 = p1f & p1e & p1d;

assign p2y = wire1;
assign p1y = wire2;


endmodule