`timescale 1ns/1ns
module Processor(clk, rst, select, count, out);
    input clk, rst;
    input [2:0] select;
    input [7:0] count;
    output reg [7:0] out;
    reg [7:0] rhomboid, square, saw_tooth, rectified, modulated, reciprocal;
  
    reg [7:0] up_trig, down_trig;
    always @(count) begin
        {up_trig, down_trig} = 16'b0000_0000_0000_0000;
        if (count[7] == 1'b0) begin
            up_trig = count;
            down_trig = -count;
        end
        else 
        begin
            up_trig = 8'b1111_1111 - count;
            down_trig = count - 8'b1111_1111;
        end
    end

    always @(count or up_trig or down_trig) begin
        rhomboid = 8'b0000_0000;
        if (count[0] == 1'b0)
            rhomboid = up_trig + 8'b0111_1111;
        else
            rhomboid = down_trig + 8'b0111_1111;
    end

    always @(count) begin
        square = -127;
        if (count[7] == 1'b0)
            square = 127;
    end

    always @(count) begin
        saw_tooth = count;
    end

    always @(count) begin
        reciprocal = 256 / (8'b11111111 - count + 8'b00000001) - 127;
    end
  
    reg [15:0] sine, cosine, next_sine, next_cosine;

    always @(sine or cosine) begin
        next_sine = sine + {{6{cosine[15]}}, cosine[15:6]};
    end

    always @(next_sine or cosine) begin
        next_cosine = cosine - {{6{next_sine[15]}}, next_sine[15:6]};
    end

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            sine <= 16'b0000_0000_0000_0000;
            cosine <= 16'b0111_0101_0011_0000;
        end
        
        else 
        begin
            sine <= next_sine;
            cosine <= next_cosine;
        end
    end

    reg [7:0] sine_shifted;
    always @(sine) begin
        sine_shifted = sine[15:8] + 127;
    end

    always @(sine or sine_shifted) begin
        rectified = 8'b00000000;
        if (sine[15] == 1'b0)
            rectified = sine_shifted;
        else
            rectified = -sine_shifted;
    end

    always @(count or sine_shifted) begin
        modulated = 8'b00000000;
        if (count[4] == 1'b0)
            modulated = sine_shifted;
        else
            modulated = -sine_shifted;
    end

    always @(rhomboid or sine_shifted or square or reciprocal
            or saw_tooth or rectified or modulated
            or select) 
    begin
        out = 8'b00000000;
        case (select)
            3'b000: out = rhomboid - 127;
            3'b001: out = sine_shifted - 127;
            3'b010: out = square;
            3'b011: out = reciprocal - 255;
            3'b100: out = saw_tooth - 127;
            3'b101: out = rectified - 127;
            3'b110: out = modulated - 127;
            3'b111: out = 8'b00000000;
        endcase
    end
endmodule