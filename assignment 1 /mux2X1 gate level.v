module mux2to1 (
    input a,       
    input  b,        
    input  s,      
    output  y      
);

wire sb,m1,m2;

not (sb, s);      
and (m1, a,sb);  
and (m2,b,s);     
or (y,m1,m2);  

endmodule
