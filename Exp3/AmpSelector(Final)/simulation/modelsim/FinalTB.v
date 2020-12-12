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

module FinalTB();
    wire [7:0] out1, out2;
    reg clk, rst;
    reg [2:0] FuncSel;
    reg[7:0] PL1, PL2; //parallel load for counters in clock divider
    reg preset;
    wire [7:0] counted1, counted2;
    wire clk1, clk2;
    reg JKReset;
    reg [1:0] AmpSel1, AmpSel2;
    wire [12:0] sw1, sw2;
    
    assign sw1 = {AmpSel1, FuncSel, PL1};
    assign sw2 = {AmpSel2, FuncSel, PL2};
    
    FuncGenWithFreqAndAmp UUT1(.dividedClock(clk1), .JKReset(JKReset),
                              .preset(preset), .clk(clk), .sw(sw1), 
                              .counted(counted1), .out(out1), .rst(rst));
                              
    FuncGenWithFreqAndAmp UUT2(.dividedClock(clk2), .JKReset(JKReset),
                              .preset(preset), .clk(clk), .sw(sw2), 
                              .counted(counted2), .out(out2), .rst(rst));
                              
    initial begin
        JKReset = 0;
        preset = 0;
        rst = 1;
        #1000;
        rst = 0;
       	preset = 1;
       	JKReset = 1;
       	PL1 = 145; PL2 = 165; 
       	AmpSel1 = 2'b01;
       	AmpSel2 = 2'b11;
       	#1000; 
       	
        FuncSel = 3'b000;
        repeat(8) begin
          repeat(150000) begin
              clk = 1; #20; //ring oscillator
              clk = 0; #20;  
          end
          
          FuncSel = FuncSel + 3'b001;  
        end  
      
    end
endmodule

/*
module CDividerTB();
    wire dividedClk;
    reg JKreset, enable, clk, rst;
    reg [7:0] inp;
    wire [7:0] counted;
    ClockDivider UUT(.dividedClk(dividedClk), .JKreset(JKreset), .enable(enable),
                      .clk(clk), .inp(inp), .count74193(counted));
                      
    initial begin
        JKreset = 0;
        enable = 0;
        //rst = 1;
        #1000;
        //rst = 0;
        enable = 1;
        JKreset = 1;
        inp = 145;
        #1000;
        
        repeat(1000) begin
            clk = 1; #20;
            clk = 0; #20;  
        end
    
 	  end 
  
endmodule
*/