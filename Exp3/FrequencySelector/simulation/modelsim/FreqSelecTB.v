`timescale 1ns/1ns;

module ring_oscillator#(parameter number_of_inverters = 5, parameter delay = 10) (input rst, output out);
        
        reg w[0:number_of_inverters - 1];
        integer i;
        always @* begin
            if(rst)
                w[0] = 1'b0;
            else 
            begin 
                for (i = 0; i < number_of_inverters ; i = i + 1)
                    #delay w[(i + 1) % number_of_inverters] <= ~w[i];
            end
        end
        assign out = w[0];
endmodule

module FuncGenWithFreqSelTB();
  
    wire [7:0] out1, out2, out3;
    reg clk, rst;
    reg [2:0] select;
    reg[7:0] PL1, PL2, PL3; //parallel load for counters in clock divider
    reg preset;
    wire [7:0] counted1, counted2, counted3;
    wire clk1, clk2, clk3;
    reg JKReset;
    FuncGenWithFreqSel UUT1(.JKReset(JKReset), .dividedClock(clk1), .count74193(counted1), .clk(clk), .rst(rst), .sel(select), .out(out1), .preset(preset), .pl(PL1) );
    FuncGenWithFreqSel UUT2(.JKReset(JKReset), .dividedClock(clk2), .count74193(counted2), .clk(clk), .rst(rst), .sel(select), .out(out2), .preset(preset), .pl(PL2) );
    FuncGenWithFreqSel UUT3(.JKReset(JKReset), .dividedClock(clk3), .count74193(counted3), .clk(clk), .rst(rst), .sel(select), .out(out3), .preset(preset), .pl(PL3) );

    
    initial begin
        JKReset = 0;
        preset = 0;
        rst = 1;
        #1000;
        rst = 0;
       	preset = 1;
       	JKReset = 1;
       	PL1 = 145; PL2 = 150; PL3 = 155; 
       	#1000; 
       	
        select = 3'b000;
        repeat(8) begin
          repeat(120000) begin
              clk = 1; #20; //ring oscillator
              clk = 0; #20;  
          end
          
          select = select + 3'b001;  
        end
    end
endmodule

/*
module clockDividerTB();
    wire dividedClk;
    reg JKReset, enable;
    reg [7:0] pl;
    reg clk;
    wire [7:0] cnt;
    reg rst;
    ClockDivider UUT(.dividedClk(dividedClk), .JKreset(JKReset), .enable(enable), 
                    .inp(pl), .clk(clk), .count74193(cnt));
                    
    initial begin
        JKReset = 0;
        enable = 0;
        rst = 1;
        #1000;
        rst = 0;
       	enable = 1;
       	JKReset = 1;
       	pl = 150;
       	
       	repeat(10000) begin
       	    clk = 1; #20;
       	    clk = 0; #20;  
   	    end
    end
  
endmodule
*/