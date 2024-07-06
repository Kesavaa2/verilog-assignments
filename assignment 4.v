assignment 4
1.a=x;
2.b=x;
3.time :0 b=00;
  time:10 b=xx;
  time:10 b=10;
  time:10 b=01;

4. time:0 ,a=x;
   time=155, a=1;
   time =310,a=0;

5. time:0 ,a=x;
   time=155, a=1;
   time =310,a=0;

6.
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

7.
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
     
     
     
8.https://www.edaplayground.com/x/mDrr

module gen_clk(input in_clk);
endmodule

`timescale 1us/1ps
module gen_clk_tb;
  reg in_clk=0;
 
  gen_clk clock(in_clk);
  always #0.001 in_clk=~in_clk;
  
 #5  $stop;
  initial begin
    $dumpfile("clk_gen_tb.vcd");
    $dumpvars;
  end
endmodule


9.

10.module test ;

reg [5:0]channel ;
reg a ;
initial
begin
channel = $fopen("file1.txt","w");
$fwrite(channel,"a=%b",a);
$fclose(channel);
end
endmodule   
     
     
     
