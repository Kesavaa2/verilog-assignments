assignment 4
1.What value of a is displayed on the console output? Justify the  same.
reg[1:0]a;
initial
begin
$display($time,“a=%d”,a);
a =2’d3;
#10;
a = 2’d2;
end
answer:a=x;


2.What is the value of b displayed on the console output? Justify the
same.

reg[1:0]b;
initial
begin
$strobe($time,“b=%d”,b);
b =2’d3;
b = 2’dx;
#10;
b = 2’d2;
end
answer:b=x;

3.What values are monitored for the variable b till the end of
simulation time? Display the same.

reg[1:0]b;
initial
begin
$monitor($time,“b=%d”,b);
b = 2’d0;
b = 2’dx;
#10;
b = 2’d2;
#10;

b = 2’d1;
$monitoroff;
#10;
b = 2’d2;
$monitoron;
#10;
#100 $finish;
end
  
answer:
  time :0 b=00;
  time:10 b=xx;
  time:10 b=10;
  time:10 b=01;

4. Display the console output for the following.

`timescale 10ns/1ns
parameter P=15.5;
reg a;
initial begin
$monitor($time,“Value of a = %b”,a); #P a =
1’b1;
#P a = 1’b0;
end
  
    answer:time:0 ,a=x;
         time=155, a=1;
         time =310,a=0;


5. Display the console output for the following.
`timescale 10ns/1ns
parameter P=15.5 ;
reg a ;
initial
begin
$monitor($realtime,“Value of a = %b”,a);
#P a = 1’b1;
#P a = 1’b0;
end

  answer:time:0 ,a=x;
        time=155, a=1;
        time =310,a=0;

6.Write Verilog code in order to generate 5 odd random numbers
between 1 to 10.
  
module odd;
  reg [3:0]out ;
  integer i;
  initial begin
  for(i=1;i<=10;i=i+1)begin
    if(i%2==1)begin
   assign out =i;
      $display("out=%d",out);
end
 end
  end
  initial begin
  $dumpfile("odd.vcd"); 
  $dumpvars;
  end
endmodule

7.Write RTL code for designing a JK Flip-flop and use the following input
states as `define macro: SET, RESET, TOGGLE, HOLD.
  
module jkff(input clk,rst,j,k,output reg q,qb);
`define SET 2'b10 
`define RESET 2'b01 
 `define HOLD 2'b00 
 `define TOGGLE 2'b11
  
  always @(posedge clk,posedge rst)begin
    if (rst==1)begin
      q <= 1'b0;
      qb <= 1'b1;
    end
    else begin
       case({j,k})
   `SET:begin
      q <= 1'b1;
     qb <= 1'b0;
   end
   `RESET:begin
       q <= 1'b0;
     qb <= 1'b1;
   end
   `HOLD:begin
       q <= q;
     qb <= qb;
   end    
   `TOGGLE:begin
     q <= ~q;
     qb <= ~qb;
   end
         default:begin
             q <= 1'b0;
             qb <=1'b1;
         end
      endcase
    end
  end
 endmodule
     
     
     
8.Write Verilog code in order to generate a clock signal of frequency ;
1Ghz. Use the following timescale: `timescale 1us/1ps
  

module gen_clk(input in_clk);
endmodule

`timescale 1us/1ps
module gen_clk_tb;
  reg in_clk=0;
 
  gen_clk clock(in_clk);
  always #0.0005 in_clk=~in_clk;
  
 #5  $stop;
  initial begin
    $dumpfile("clk_gen_tb.vcd");
    $dumpvars;
  end
endmodule


9.

10.Find the bug if any in the following File write operation snippet.

module test ;
reg [5:0]channel ;
reg a ;
initial
begin
channel = $fopen(“file1.txt”);
$monitor(channel,”a=%b”,a);
end
endmodule
  
answer:
module test ;
reg [5:0]channel ;
reg a ;
initial
begin
channel = $fopen("file1.txt","w");
$fwrite(channel,"a=%b",a);
$fclose(channel);
end
endmodule   
     
     
     
