module myTFF(input clk, rst, output reg t);
	always@(posedge clk, posedge rst)
		if (rst)
			t <= 1'b0;
		else
			t <= ~t;
endmodule