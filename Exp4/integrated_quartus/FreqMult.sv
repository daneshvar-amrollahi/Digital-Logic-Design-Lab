`timescale 1ps/1ps
module FreqMult(clk, rst, f, adjust, n, valid, acc_out, k, curState);
    input clk, rst, f, adjust;
    input [2:0] n;
    output valid;
    output acc_out;
    output [7:0] k;
	 output [2:0] curState;
      
    wire LdCnt, counten, cout, kcalc; 
	 //wire isInCalcK, isInCounterLoad;
    datapath DP(.ref_clk(clk), .rst(rst), .cpu_clk(f), .n(n), .LdCnt(LdCnt), .counten(counten),
                .cout(cout), .kcalc(kcalc), .k(k), .tff_out(acc_out));
                
    controller CU(.clk(clk), .rst(rst), .adjust(adjust), .kcalc(kcalc), .cout(cout), .valid(valid), 
                  .LdCnt(LdCnt), .counten(counten), .curState(curState));
                  
endmodule