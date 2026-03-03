`timescale 1ns/1ns

module D_FF(input D,input Clk,output reg Q);
     initial Q = 1'b0;
    always @(posedge Clk) begin
        Q <= D;
    end
endmodule