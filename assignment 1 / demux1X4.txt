module demux1X4 (
    input wire d,   
    input wire [1:0] s, 
    output wire [3:0] y   
);

assign y[0] = d & ~s[1] & ~s[0];
assign y[1] = d & ~s[1] & s[0];
assign y[2] = d & s[1] & ~s[0];
assign y[3] = d & s[1] & s[0];

endmodule
