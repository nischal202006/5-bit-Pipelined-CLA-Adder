`timescale 1ns/1ns
module D_FF_test;
    reg D, Clk;
    wire Q;

    D_FF dut (.D(D), .Clk(Clk), .Q(Q));

    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin
        $dumpfile("D_FF_test.vcd");
        $dumpvars(0, D_FF_test);
        $display("D-Flip Flop Time | D Clk | Q ");
        $monitor("D-Flip Flop %4t | %b  %b  | %b  ", $time, D, Clk, Q);
    D = 0; #10;
    D = 1; #10;
    D = 1; #10;
    D = 0; #10; 
    D = 1; #10;  
    $monitoroff;
        $finish;
    end
endmodule
