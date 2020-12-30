module datapath(ref_clk, rst, cpu_clk, n, LdCnt, counten, cout, kcalc, k, tff_out);
  input ref_clk, rst, cpu_clk, counten, LdCnt;
  input [2:0] n;
  output reg kcalc, tff_out;
  output cout;
  output [7:0] k;
    
  reg [7:0] duration;
  reg old_cpu_clk;
  
  always @(posedge ref_clk, posedge rst) 
      if (rst) begin
        old_cpu_clk <= 1'b0;
        tff_out <= 1'b0;
      end
      else 
	      old_cpu_clk <= cpu_clk;
    
  always @(posedge ref_clk) begin
         case ({old_cpu_clk, cpu_clk})
         2'b00: duration <= duration;
         2'b01: duration <= 8'b0000_0001;
         2'b10: duration <= duration;
         2'b11: duration <= duration + 1;
         endcase
  end
  
  always @(posedge ref_clk) begin
        if ({old_cpu_clk, cpu_clk} == 2'b10) 
				  kcalc <= 1'b1;
 			   else
 			if ({old_cpu_clk , cpu_clk} == 2'b01)   
				  kcalc <= 1'b0;   
	end
	
  
	assign k = (duration << 1) >> n;
	
	//////////////////////////
	
	reg [7:0] cnt;
	always @(posedge ref_clk)
	   if (LdCnt)
	     cnt <= (8'b1111_1111 - (k >> 1)); //Parallel Load
	   else
	     if (counten)
	       cnt <= cnt + 1;
	     else
	      cnt <= cnt;   
	     
	assign cout = (cnt == 255);
	
	always @(posedge cout) //T flip flop toggling
	   tff_out <= ~tff_out;
	   
endmodule