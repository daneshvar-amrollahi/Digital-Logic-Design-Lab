module MUX2x1(input [7:0] A, input [7:0] B, input sel, output [7:0] out);
	assign out = (sel == 1 ? B : A);
endmodule

