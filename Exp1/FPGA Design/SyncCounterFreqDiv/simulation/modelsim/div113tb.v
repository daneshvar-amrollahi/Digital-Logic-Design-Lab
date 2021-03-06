`timescale 1ns/1ns
module ring_oscillator#(parameter number_of_inverters = 3, parameter delay = 10) (input rst, output out);
        
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

module div113tb();
    wire clk;
    reg rst;
    ring_oscillator #(.number_of_inverters(3), .delay(10)) ring (rst, clk);
    wire [7:0] out;
    reg [7:0] inp = 8'b10001110; //255 - 113 = 142 = 10001110
    reg preset;
    wire cout;
    div113 UUT(.output0(out[0]), .output1(out[1]), .output2(out[2]), .output3(out[3]), .output4(out[4]), .output5(out[5]), .output6(out[6]), .output7(out[7]),
      .input0(inp[0]), .input1(inp[1]), .input2(inp[2]), .input3(inp[3]), .input4(inp[4]), .input5(inp[5]), .input6(inp[6]), .input7(inp[7]),
       .MSBcout(cout), .clk(clk), .preset(preset));  
    initial begin
      rst = 1'b1; #50;
      preset = 0;
      #100;
      preset = 1;
      #50;
      rst = 1'b0; #1000000;
      
      $stop;
    end
endmodule
