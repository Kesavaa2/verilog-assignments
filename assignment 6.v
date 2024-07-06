1.Write RTL code for designing a Moore overlapping sequence detector in order to detect a sequence 1010 with MSB first.

module moore1010_fsm_ov(input clk,
                        input rst,
                        input x,
                        output reg  y);
  
  reg [2:0] cs,nst;
  
  parameter  s0=3'b000, 
             s1=3'b001, 
             s2=3'b010, 
             s3=3'b011, 
             s4=3'b100;
  
  always @ (posedge clk or posedge rst) begin
    
    if(rst)
    cs<=s0;
    else
      cs<=nst;
  end
  
  always @ (cs,x) begin
    
    case(cs)
      
  s0 : begin
    
    if(x==1)
      nst=s1;
    else 
      nst=s0;
  end
      
  s1 : begin
    
    if(x==1)
      nst=s1;
    else 
      nst=s2;
  end
   
  s2 : begin
    
    if(x==1)
      nst=s3;
    else 
      nst=s0;
  end
      
    
  s3 : begin
    
    if(x==1)
      nst=s1;
    else 
      nst=s4;
  end
      
    
  s4 : begin
    
    if(x==1)
      nst=s3;
    else 
      nst=s0;
  end      
  default: nst=s0;
 endcase
  end
  
//   assign y = (cs==s4) ? 1 : 0 ;
  
  always @ (cs) begin
    case(cs)
      
       s0 : y=0;
       s1 : y=0;
       s2 : y=0;
       s3 : y=0;
       s4 : y=1;
      default : y=0;
    endcase
  end 
endmodule


2. Write RTL code for designing a Mealy overlapping sequence detector in order to detect a sequence 1101 with LSB first.


module mealy1011fsm_ov(input clk,
                        input rst, 
                        input x,
                        output reg y);

  reg [1:0] cs,nst;
  parameter s0=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;
  
  
  always @ (posedge clk or posedge rst)begin
    if(rst) 
    cs<=s0;
else 
  cs=nst;
end
  
  always @(cs,x)begin
   
    case(cs)
      s0 : begin
        if(x==1)
        nst=s1;
         
      else
        nst=s0;
      end
      
      s1 : begin
        if(x==0)
        nst=s2;
       
      else
        nst=s1;
      end
      
      s2 :begin
        if(x==1) 
        nst=s3;
         
      else 
        nst=s0;
      end
      
      s3 :begin
      if(x==1)
        nst=s1;
      
      else 
       nst=s2;
      end
      default : nst=s0;
endcase
    end
//end
 // end
  assign y = (cs==s3) && (x==1) ? 1 : 0;
endmodule


3.
