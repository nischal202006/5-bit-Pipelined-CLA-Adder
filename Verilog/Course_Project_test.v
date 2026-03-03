module Course_Project_test;
    reg [4:0] A, B;
    reg clk;
    wire [4:0] sum;
    wire Carry;
    
    Course_Project dut (.A(A), .B(B), .clk(clk), .sum(sum), .Carry(Carry));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    task apply_testcase(input [4:0] a_in, input [4:0] b_in);
    begin
        @(negedge clk);
        #2;
        A = a_in;
        B = b_in;
        @(posedge clk);
        @(posedge clk);
        #1;
        $display("%0dns\t%05b\t%05b\t|\t%05b\t%b      |",$time, a_in, b_in, sum, Carry);
    end
    endtask
    initial begin
        $dumpfile("Course_Project_test.vcd");
        $dumpvars(0, Course_Project_test);
        A = 5'b00000; 
        B = 5'b00000;
        @(posedge clk); 
        $display("\n   5-bit CLA Adder 1-Cycle Latency Testbench      ");
        $display("Time\tA\tB\t|\tSum\tCarry  |");

        apply_testcase(5'b00000, 5'b00000);
        apply_testcase(5'b00101, 5'b00011); 
        apply_testcase(5'b00111, 5'b01010); 
        apply_testcase(5'b01111, 5'b01100); 
        apply_testcase(5'b10101, 5'b01010); 
        apply_testcase(5'b11111, 5'b00001); 
        apply_testcase(5'b11111, 5'b00100);
        apply_testcase(5'b11111, 5'b11111); 
        #4;
        $finish;
    end
endmodule