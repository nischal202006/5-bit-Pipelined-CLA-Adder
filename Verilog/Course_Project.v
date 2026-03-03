`timescale 1ns/1ns
module D_FF(input D,input clk,output reg Q);
     initial Q = 1'b0;
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

module D_FF_five(input [4:0]D,input clk,output reg [4:0]Q);
   initial Q = 5'b00000;
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

module five_bit_CLA(input [4:0]A,B,output [4:0]sum,output Carry);
wire [4:0]P,G;
wire C0,C1,C2,C3,C4;
assign P[0]   = A[0]^B[0];
assign P[1]   = A[1]^B[1];
assign P[2]   = A[2]^B[2];
assign P[3]   = A[3]^B[3];
assign P[4]   = A[4]^B[4];

assign G[0]   = A[0]&B[0];
assign G[1]   = A[1]&B[1];
assign G[2]   = A[2]&B[2];
assign G[3]   = A[3]&B[3];
assign G[4]   = A[4]&B[4];

assign C0     = 1'b0;
assign C1     = G[0];
assign C2     = G[1] | (P[1] & G[0]); 
assign C3     = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]);
assign C4     = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]); 
assign Carry  = G[4] | (P[4] & G[3]) | (P[4] & P[3] & G[2]) | (P[4] & P[3] & P[2] & G[1]) | (P[4] & P[3] & P[2] & P[1] & G[0]);

assign sum[0] = C0^P[0];
assign sum[1] = C1^P[1];
assign sum[2] = C2^P[2];
assign sum[3] = C3^P[3];
assign sum[4] = C4^P[4];
endmodule

module Course_Project(input  [4:0] A, B,input clk,output [4:0] sum,output Carry);
    wire [4:0] Q_A, Q_B, sum_D;
    wire C5;

    D_FF_five in_A(.D(A), .clk(clk), .Q(Q_A));
    D_FF_five in_B(.D(B), .clk(clk), .Q(Q_B));

    five_bit_CLA cla(.A(Q_A), .B(Q_B), .sum(sum_D), .Carry(C5));

    D_FF_five out_Sum(.D(sum_D), .clk(clk), .Q(sum));
    D_FF out_Carry(.D(C5), .clk(clk), .Q(Carry));

endmodule