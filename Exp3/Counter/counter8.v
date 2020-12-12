module counter8(clk, rst, out);
    input clk, rst;
    output reg [7:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)
            out <= 8'b00000000;
        else
            out <= out + 8'b00000001;
    end
endmodule



module cnt8TB();
    reg clk, rst;
    wire [7:0] out;
    
    counter8 UUT(.clk(clk), .rst(rst), .out(out));
    
    initial begin
        rst = 1;
        clk = 1; #10;
        rst = 0; #10;
        clk = 0; #10;
        repeat(50) begin
            clk = 1; #10;
            clk = 0; #10;
        end
  end
endmodule