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

module ring_oscill_tb();
    wire out;
    reg rst;
    ring_oscillator #(.number_of_inverters(3), .delay(10)) ring (rst, out);
    
    initial begin
      rst = 1'b1; #50;
      rst = 1'b0; #10000;
      $stop;
    end
endmodule
  
    