module tb_vm;

reg [2:0] b,s,a;
reg clk,reset;
wire [2:0] d;

vending_machine dut (
    .a(a),
    .b(b),
    .s(s),
    .d(d),
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin

clk = 1;

$monitor("clk=%b b=%b a=%b s=%b reset=%b d=%b time=%0t state=%b",
          clk,b,a,s,reset,d,$time,dut.state);


// =====================================================
// TEST CASE 1 : NORMAL OPERATION
// =====================================================

// Product 1
$display("\nTEST CASE 1A : PRODUCT 1");

reset=1; #10;
reset=0; #10;

a=3'b111;

b=3'b000; #10;
b=3'b001; #10;
b=3'b000; #10;

s=3'b100; #20;
s=3'b001; #10;


// Product 2
$display("\nTEST CASE 1B : PRODUCT 2");

reset=1; #10;
reset=0; #10;

a=3'b111;

b=3'b000; #10;
b=3'b010; #10;
b=3'b000; #10;

s=3'b100; #30;
s=3'b001; #10;


// Product 3
$display("\nTEST CASE 1C : PRODUCT 3");

reset=1; #10;
reset=0; #10;

a=3'b111;

b=3'b000; #10;
b=3'b100; #10;
b=3'b000; #10;

s=3'b100; #30;
s=3'b001; #10;


// =====================================================
// TEST CASE 2 : CANCEL OPERATION
// =====================================================

$display("\nTEST CASE 2 : CANCEL OPERATION");

reset=1; #10;
reset=0; #10;

a=3'b111;

b=3'b000; #10;
b=3'b100; #10;
b=3'b000; #10;

s=3'b010; #10;

s=3'b100; #30;
s=3'b001; #10;


// =====================================================
// TEST CASE 3 : PRODUCT UNAVAILABLE
// =====================================================

$display("\nTEST CASE 3 : PRODUCT UNAVAILABLE");

reset=1; #10;
reset=0; #10;

a=3'b011;

b=3'b000; #10;
b=3'b100; #10;
b=3'b000; #10;

s=3'b010; #10;

s=3'b100; #30;
s=3'b001; #10;


// =====================================================
// TEST CASE 4 : MULTIPLE BUTTONS PRESSED
// =====================================================

// Two buttons
$display("\nTEST CASE 4A : TWO BUTTONS PRESSED");

reset=1; #10;
reset=0; #10;

a=3'b111;

b=3'b000; #10;
b=3'b110; #10;
b=3'b000; #10;

s=3'b010; #10;

s=3'b100; #30;
s=3'b001; #10;


// Three buttons
$display("\nTEST CASE 4B : THREE BUTTONS PRESSED");

reset=1; #10;
reset=0; #10;

a=3'b111;

b=3'b000; #10;
b=3'b111; #10;
b=3'b000; #10;

s=3'b010; #10;

s=3'b100; #30;
s=3'b001; #10;


$finish;

end

endmodule
