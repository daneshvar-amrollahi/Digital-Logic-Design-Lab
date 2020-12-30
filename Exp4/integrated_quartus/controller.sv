module controller(clk, rst, adjust, kcalc, cout, valid, LdCnt, counten, curState);
  input clk, rst, adjust, kcalc, cout;
  output reg valid, LdCnt, counten;
  output [2:0] curState;
  
  assign curState =  (ps == idle) ? 3'b000:
							(ps == starting) ? 3'b001:
							(ps == calculatingK) ? 3'b010:
							(ps == counterLoad) ? 3'b011:
							(ps == counting) ? 3'b100:
							3'b111;
  
  typedef enum {idle, starting, calculatingK, counterLoad, counting} FSMStates;
	FSMStates ps, ns;
  always @(posedge clk, posedge rst)
    if (rst)
      ps <= idle;
    else
      ps <= ns;
        
  always @(adjust, kcalc, cout) begin
    ns = idle;
    case (ps)
      idle: if (adjust) ns = starting; else ns = idle;
      starting: if (adjust) ns = starting; else ns = calculatingK;
      calculatingK: if (kcalc) ns = counterLoad; else ns = calculatingK;
      counterLoad: ns = counting;
      counting: if (adjust) ns = starting; else begin if (cout) ns = counterLoad; else ns = counting; end
      default: ns = idle;
    endcase
  end
  
  always @(ps) begin
    {valid, LdCnt, counten} = {1'b0, 1'b0, 1'b0};
    case (ps)
      counterLoad: {LdCnt, valid} = {1'b1, 1'b1};
      counting: {counten, valid} = {1'b1, 1'b1};
    endcase
  end
  
endmodule

