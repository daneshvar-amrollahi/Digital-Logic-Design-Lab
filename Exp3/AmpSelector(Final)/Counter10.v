module counter10(clk, rst, out);
    input clk, rst;
    output reg [9:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)
            out <= 10'b0000000000;
        else
            out <= out + 10'b0000000001;
    end
endmodule
