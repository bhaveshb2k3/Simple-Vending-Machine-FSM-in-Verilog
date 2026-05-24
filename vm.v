module vending_machine (b,s,a,d,clk,reset);

input [2:0] b,a;  // [b3 b2 b1] and [a3 a2 a1]
input [2:0] s;    //p c d
input clk,reset;
output reg [2:0] d;     //[d3 d2 d1]

reg [2:0] state, next_state;

parameter
s0=3'b000,
s1=3'b001,
s2=3'b010,
s3=3'b011,
s4=3'b100,
s5=3'b101,
s6=3'b110,
s7=3'b111;


always @(posedge clk or posedge reset) begin

if (reset==1) state<=s0;
else state<=next_state;

end



always @(*) begin

next_state=state;
d=3'b000;

case (state) 

s0: begin

d=3'b000;

if (b==3'b001 && a[0]==1) next_state=s1;
if (b==3'b010 && a[1]==1) next_state=s2;
if (b==3'b100 && a[2]==1) next_state=s3;


end

s1: begin
if (s[1]==1) next_state=s0;
else if (s==3'b100) next_state=s4;
end

s2: begin
if (s[1]==1) next_state=s0;
else if (s==3'b100) next_state=s5;
end

s3: begin
if (s[1]==1) next_state=s0;
else if (s==3'b100) next_state=s6;
end

s4: begin
d=3'b001;
if (s[0]==1) 
next_state=s0; 
end

s5: begin
d=3'b010;
if (s[0]==1) 
next_state=s0; 
end

s6: begin
d=3'b100;
if (s[0]==1)
next_state=s0; 
end

default: next_state=s0;

endcase
end

endmodule