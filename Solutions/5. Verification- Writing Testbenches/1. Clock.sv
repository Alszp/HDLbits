module top_module ( );
timeunit 1ps;
    reg clk;
 parameter half_PERIOD = 5;
    initial clk = 0;
  always #half_PERIOD clk=~clk;
      dut dut1(clk);
endmodule
