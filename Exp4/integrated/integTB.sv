`timescale 1ps/1ps
module integTB();
  reg start;
	reg [15:0] x;
	wire done;
	wire [1:0] intpart;
	wire [15:0]fracpart;
	
	reg clk, rst, adjust, inFreq;
  reg [2:0] n;
  wire valid, acc_out;
  wire [7:0] k;    
  reg [7:0] CPUFreq;
  reg [7:0] REFFreq;
	
	FreqMult UUT(.clk(clk), .rst(rst), .f(inFreq), .adjust(adjust), .n(n), .valid(valid), .acc_out(acc_out), .k(k));
	exponential exp(.clk(acc_out), .rst(rst), .start(start), .x(x), .done(done),  .intpart(intpart), .fracpart(fracpart));
	
	initial begin
      CPUFreq = 8'd10; // inFreq = f = 10MHz
      REFFreq = 8'd150;  //REFFreq = 150MHz
      n = 3'd1;
      #10;
      rst = 1;    #50;
      rst = 0;    #50;
      adjust = 1; #10;
      clk = 1;    #10;
      clk = 0;    #10;
      adjust = 0;
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
	///////////////////////////////////////////////////
	initial begin
	  #140000;
	  start = 1; x = 16'h8000; //0.5
		#150000; start = 0;
		#5000000;
		
		#50 start = 1; x = 16'b0; //0
		#150000; start = 0;
		#5000000;
		
		#50 start = 1; x = 16'b0100_0000_0000_0000; //0.25
		#150000; start = 0;
		#5000000;
	end
	
	initial begin
	#900000000 $stop;
	end
endmodule
