module freq_range_spec(input [7:0] fset_ref, fset_max, fset_min, output [7:0] setPeriod);
  assign setPeriod = fset_ref > fset_max ? fset_max:
                      fset_ref < fset_min ? fset_min:
                      fset_ref; 
endmodule

