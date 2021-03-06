`timescale 1ps/1ps
module integSynTB();
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
	
	//wire [7:0] counted;
	wire [2:0] curState;
	integ CUT(.done(done), .clk(clk), .rst(rst), .f(inFreq), .adjust(adjust), 
	         .n(n), .start(start), .x(x), .valid(valid), .fracpart(fracpart), 
	         .intpart(intpart), .k(k), .acc_out(acc_out),
	         .curState(curState));
	
	initial begin
      CPUFreq = 8'd10; // inFreq = f = 10MHz
      REFFreq = 8'd100;  //REFFreq = 100MHz
      n = 3'd0;
      #10;
      rst = 1;    #1000;
      rst = 0;    #1000;
      adjust = 1; #1000;
      clk = 1;    #5000;
      clk = 0;    #5000;
      clk = 1;    #5000;
      clk = 0;    #5000;
      adjust = 0; #5000;
      clk = 1;    #5000;
      clk = 0;
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
	  #46000;
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


