`timescale 1ps/1ps;
module FreqMult(clk, rst, f, adjust, n, valid, acc_out, k);
    input clk, rst, f, adjust;
    input [2:0] n;
    output valid;
    output acc_out;
    output [7:0] k;
      
    wire LdCnt, counten, cout, kcalc; 
    datapath DP(.ref_clk(clk), .rst(rst), .cpu_clk(f), .n(n), .LdCnt(LdCnt), .counten(counten),
                .cout(cout), .kcalc(kcalc), .k(k), .tff_out(acc_out));
                
    controller CU(.clk(clk), .rst(rst), .adjust(adjust), .kcalc(kcalc), .cout(cout), .valid(valid), 
                  .LdCnt(LdCnt), .counten(counten));
                  
endmodule

module FreqMultTB;
    reg clk, rst, adjust, inFreq;
    reg [2:0] n;
    wire valid, acc_out;
    wire [7:0] k;
    FreqMult UUT(.clk(clk), .rst(rst), .f(inFreq), .adjust(adjust), .n(n), .valid(valid), .acc_out(acc_out), .k(k));
    
    reg [7:0] CPUFreq;
    reg [7:0] REFFreq;
    
    initial begin
      CPUFreq = 8'd3; // inFreq = f , MHz
      REFFreq = 8'd150;  //MHz
      n = 3'd2;
      #10;
      rst = 1;    #50;
      rst = 0;    #50;
      adjust = 1; #10;
      clk = 1;    #10;
      clk = 0;    #10;
      adjust = 0;; 
      repeat(5000) begin
          #(500000 / REFFreq); clk = ~clk; //T = (1 / REFFreq) * 10^6 ps 
     
end
    end
    initial begin
      #140;
      inFreq = 0;
      repeat(5000) begin
          #(500000 / CPUFreq); inFreq = ~inFreq; 
      end
    end

endmodule
  
