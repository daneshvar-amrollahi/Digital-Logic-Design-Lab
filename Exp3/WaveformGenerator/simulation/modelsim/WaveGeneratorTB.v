`timescale 1ns/1ns;

module ring_oscillator#(parameter number_of_inverters = 5, parameter delay = 10) (input rst, output out);
        
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

module WaveGeneratorTB();
  
    wire [7:0] out;
    reg clk, rst;
    reg [2:0] select;
    
    WaveformGenerator UUT(.clk(clk), .rst(rst), .sel(select), .out(out));
    
    initial begin
        rst = 1; #5;
        clk = 1; #10;
        rst = 0; #5;
        clk = 0;
        select = 3'b000;
        repeat(8) begin
          repeat(2048) begin
              clk = 1; #20;
              clk = 0; #20;  
          end
          
          select = select + 3'b001;  
        end
    end
endmodule
