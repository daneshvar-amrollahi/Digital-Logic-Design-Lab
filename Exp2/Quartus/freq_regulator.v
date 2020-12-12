module freq_regulator(clk, rst, psi, setPeriod, inc, dec, count, adjustedDiv);
  input clk, rst, psi;
  input [7:0] setPeriod;
  output reg inc, dec;
  output reg [15:0] count;
  output reg [7:0] adjustedDiv;
  
  reg oldpsi, enable;
 
  always @(posedge clk, posedge rst)
    if (rst)
      oldpsi <= 1'b0;
    else
      oldpsi <= psi;

  always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)
            count <= 16'b0000000000000000;
        else begin
            case ({oldpsi, psi})
                2'b00: count <= count;
                2'b01: count <= 16'b0000000000000000;
                2'b11: count <= count + 16'b0000000000000001;
                2'b10: count <= count;
            endcase
        end
    end
  
    
    always @(oldpsi or psi or count or setPeriod) begin
        {inc, dec} = 2'b00;
        if ({oldpsi, psi} == 2'b10) begin
            if (count + 16'b0000000000000001 > {8'b00000000, setPeriod})
                inc = 1'b1;
            if (count + 16'b0000000000000001 < {8'b00000000, setPeriod})
                dec = 1'b1;
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)
            adjustedDiv <= 8'b0111_1111;
        else if ({oldpsi, psi} == 2'b10) begin
            if (inc == 1'b1)
                adjustedDiv <= adjustedDiv + 8'b00000001;
            if (dec == 1'b1)
                adjustedDiv <= adjustedDiv - 8'b00000001;    
        end
    end
endmodule
