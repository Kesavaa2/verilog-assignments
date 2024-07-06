assignment 5

1.How many DFFs will be inferred from the below snippet.

input c, din;
output reg y3;
reg y1,y2;
always@ ( posedge c) begin
y1 = din;
y2 = y1;
y3 = y2;
end
answer:1 d flip flop

2.How many DFFs will be inferred from the below snippet:

input c,din;
output reg y3;
reg y1,y2;
always@(posedge c)
begin
y1 <= din;
y2 <= y1;
y3 <= y2;
end

answer:3 DFF

3.Write RTL code to design a 3-bit SISO right shift register using
only a Non-blocking assignment. (Do not use any operators).

module siso(
input clk,rst,
input s_in,
output reg s_out
);
reg [2:0]shift_reg;

always@(posedge clk or posedge rst)
begin
if (rst) begin
 shift_reg <= 3'b000;
 s_out <= 0;
end
else begin
 shift_reg <= {s_in,shift_reg[2:1]};
 s_out <= shift_reg;
end
end
endmodule

4.Which of the statements will execute from the below
snippet &  justify the behavior?

reg c = 3’b00x;
always@(*)
begin
casex( c )
3’b000:st1;
3’b100:st2;
3’b001:st3;
endcase
end

answer: st1 because reg c=3b00x; the casex case is cosider the st1 & st3, but st1 is the first match.
so, it will choose st1.

5.Which hardware logic is inferred from the below snippet?

always@(*) begin

case( 1’b1 ) 
a[3] : y = 3;
a[2] : y = 2;;
a[1] : y = 1;
a[0] : y = 0;
endcase
end

answer: priority encoder that has to give high priority to MSB bit.

6.Write RTL code for designing an 8:1 mux using a for loop.
https://www.edaplayground.com/x/ap8j

module mux_8to1
  (input [7:0]in,
   input [2:0]s,
   output reg y);
  
  integer sel;
  
  always @ (*)begin
    y=1'b0;
  
    for(sel=0;sel<=7;sel=sel+1)begin
      if(sel==s)
        y=in[sel];
      else 
        y=1'b0;
    end
  end
endmodule



9.Write RTL code for designing a D latch using a 2:1 mux.

https://www.edaplayground.com/x/ZtpH

module dlatch(input d,en,output reg q);
 assign q=(en==0)?q:d;
endmodule

module dlatch_tb;
  reg d,en;
  wire q;
  
  dlatch dla(d,en,q);
  initial begin
    en=0; d=1;
    #10;
    en=1;d=0;#10;
    en=1;d=1;#10;
    en=0;d=0;#10;
    en=1;d=0;#10;
    en=0;d=1;#10
    en=1;d=1;#10;
    
   #20 $finish;
  end
    initial begin
      $dumpfile("dlatch_tb.vcd");
      $dumpvars();
    end
    endmodule


10.Find the output for the below codes:

1) reg a,b;
always@(a,b) begin
#10 a <= 1'b0;
#1 b <= 1'b1;
a <= 1;
#5 b <= a;
$display($time,"a=%d,b=%d",a,b);
end
Answer:a=0,b=1.

2) reg a,b;
always@(a,b) begin
#10 a = 1'b0;
#1 b = 1'b1;
a = 1;
#5 b = a;
$display($time,"a=%d,b=%d",a,b);
end
answer:a=1,b=1.

3) reg a,b;
initial begin
a=1;
b=a;
$display($time,"a=%d,b=%d",a,b);
end
initial begin
#1 a<=1;
b<=a;
$display($time,"a=%d,b=%d",a,b);
end
answer:a=1,b=1.


11.
module dff(
    input wire clk,  
    input wire d,   
    output reg q 
);

   
    always @(posedge clk) begin
        q <= d;  
    end

endmodule

module work(
input x1,x2,x3,clk,
output reg g,f);

  wire w1,w2;
  
  assign  w1=(x3|f);
  assign  w2=(x2&x1);
    
    dff m1(.clk(clk),.d(w1),.q(g));
  dff m2(.clk(clk),.d(w2),.q(f));

endmodule


https://www.edaplayground.com/x/ipGj
