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
