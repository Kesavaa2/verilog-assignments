assignment no2
1.What is the value of y in binary format in the below snippet?

reg [5:0] y;
initial
begin
y= 'Ox2;
end
answer:y=xxx010;


2.What is the value of the b in the below snippet?

integer b;
initial
begin
b= -'d12/3;
end
answer:b=-4;

3.What value is passed across the port b in the below snippet?

module test(output [32:0]b);
real a=14.5;
assign b = a;
endmodule
answer:b=000000000000000000000000000001110


4.Find the value of the variable t at 1ns &amp; 20ns respectively from the
below snippet.
time = t;
initial begin
#10 t= $time;
#20 ;
end
answer:at 1ns t=0; at 20ns t=10;


5.Write an RTL snippet to initialize all the locations of an array of size:10x8 to
0 at 0ns. Depth= 10, Width = 8bits

module array(
    output reg [7:0] array [0:9] 
);

integer i, j; 

initial 
begin
  for (i = 0; i < 10; i = i + 1) 
begin
  for (j = 0; j < 8; j = j + 1) 
begin
  array[i][j] = 8'b00000000;
end
end
end

endmodule

6.What will be the value of the parameter constant for the instance DUT in
the top module from the below snippet?
module test;
parameter WIDTH=8;
endmodule
module top;
test #(16) OUT ( )
;
endmodule
answer:16

    
7.What is the bug in the following snippet?
module test;
parameter WIDTH=8;

endmodule
module top;
test OUT ( ) ;
initial
defparam OUT.WIDTH=10;
endmodule
answer: in module top no need to put "initial"

    
8.What will be displayed in the console mode for the below snippet?

reg[13*8:1]s;
initial
begin
s = "hello world";
    $display("Value = %s",s[104:65]);

end
answer:"hello" word will display
