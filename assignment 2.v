assignment no2
1.y=xxx010
2.b=-4
3.b=000000000000000000000000000001110
4.
5.module array(
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

6.16
7.in module top no need to put "initial"
8."hello" word will display
