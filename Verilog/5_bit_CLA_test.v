`timescale 1ns/1ns
module five_bit_CLA_test;
    reg [4:0] A, B;
    wire [4:0] sum;
    wire Carry;
    five_bit_CLA dut (.A(A),.B(B),.sum(sum),.Carry(Carry));
    initial begin
        $dumpfile("5_bit_CLA_test.vcd");
        $dumpvars(0, five_bit_CLA_test);
        $display("5-bit CLA Time |   A    +     B         |  Sum   | Carry");
        $monitor("5-bit CLA %4t |  %b  +   %b      |  %b |  %b",$time, A, B, sum, Carry);
        A = 5'b00001; B = 5'b00000; #10;
        A = 5'b00010; B = 5'b00101; #10;
        A = 5'b01101; B = 5'b01011; #10;
        A = 5'b10101; B = 5'b01010; #10;
        A = 5'b11111; B = 5'b00011; #10;
        A = 5'b11111; B = 5'b11111; #10;
        $finish;
    end
endmodule
