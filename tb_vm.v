module tb_vm;

reg [2:0] b,s,a;
reg clk,reset;
wire [2:0] d;

vending_machine dut (.a(a),.b(b),.s(s),.d(d),.clk(clk),.reset(reset));


always #5 clk=~clk;
initial begin
clk=1;

$monitor("clk=%b b=%b a=%b s=%b reset=%b d=%b time=%0t state=%b",clk,b,a,s,reset,d,$time,dut.state);

reset=1;#10;
reset=0;#10;
a=3'b111;
b=3'b000;#10;
b=3'b111;#10;
b=3'b000;#10;
s=3'b010;#10;
s=3'b100;#30;
s=3'b001;#10;

$finish;

end
endmodule