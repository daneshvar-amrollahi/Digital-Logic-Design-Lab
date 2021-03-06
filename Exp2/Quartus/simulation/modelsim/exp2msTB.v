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

module exp2msTB();
    wire TFF_out;
    wire [15:0] duration;
    wire [7:0] cnt;
    reg JKReset, enable, clk_regulator;
    reg [7:0] fset_max, fset_min, fset_ref;
    
    wire clk_divider, inc, dec;
    
    wire [7:0] adjustedLoad;
    wire [7:0] set_period;
    
    reg rst;
    ring_oscillator RNGO(rst, clk_divider); //20MHz clk
    
    
    exp2 freg(.TFF_out(TFF_out), .inc(inc), .dec(dec), .duration(duration), .cnt(cnt), .JKreset(JKReset), 
              .clk_divider(clk_divider), .rst_regulator(rst), .fset_max(fset_max), .fset_min(fset_min), .enable(enable),
              .fset_ref(fset_ref), .clk_regulator(clk_regulator), .adjustedLoad(adjustedLoad), .set_period(set_period));
    
    initial begin
        rst = 1'b1;
        JKReset = 0;
        enable = 0;
        
        #1000;
        
        fset_ref = 125;
        fset_min = 90;
        fset_max = 160;
        rst = 0;
        JKReset = 1;
        enable = 1;
        #1000;
        repeat(60000)
        begin
              clk_regulator = 0; //50MHz FPGA clock for freq_regulator
              #20.5;
              clk_regulator = 1;
              #20.5;
        end
        
        fset_ref = 170;
        repeat(60000)
        begin
              clk_regulator = 0; //50MHz FPGA clock for freq_regulator
              #20.5;
              clk_regulator = 1;
              #20.5;
        end
        $stop;
    end
    
endmodule