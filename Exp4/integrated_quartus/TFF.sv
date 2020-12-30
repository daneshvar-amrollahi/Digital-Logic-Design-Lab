module myTFF(input clk, input rst, output reg t);
	always@(posedge clk, posedge rst)
		if (rst)
			t <= 1'b0;
		else
			t <= ~t;
endmodule
