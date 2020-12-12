`timescale 1ns/1ns

module lm_555_tb(); 

    reg rst, clk;
    wire pulse1k, pulse10k, pulse100k;

    lm_555_timer #(.Resistor1(1), .Resistor2(1), .capacitor(10)) timer0 (clk, rst, pulse1k);
    lm_555_timer #(.Resistor1(1), .Resistor2(10), .capacitor(10)) timer1 (clk, rst, pulse10k);
    lm_555_timer #(.Resistor1(1), .Resistor2(100), .capacitor(10)) timer2 (clk, rst, pulse100k);

    initial begin
        rst = 1'b1;
        #10;
        clk = 1;
        #10;
        rst = 1'b0;
        #10;
        
        repeat(10000)
        begin
          #10;
          clk = 1;
          #10;
          clk = 0;
        end
    end
endmodule
