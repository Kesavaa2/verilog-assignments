module hs(input  a,b, output di,bo);
assign di=a^b;
assign bo=~a&b;
endmodule

module hs(input a,b,c,output D,B);
wire di1,bo1,bo2;
hs _HA1(a,b,di1,bo1);
hs _HA2(di1,c,D,bo2);
assign B=bo1|bo2;
endmodule
