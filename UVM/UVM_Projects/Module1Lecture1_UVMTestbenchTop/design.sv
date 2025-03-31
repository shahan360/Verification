// Code your design here
// Code your design here

// This is our interface
interface dut_if (input bit clock);
  logic reset;
  logic [31:0] in1;
  logic [31:0] in2;
  logic [31:0] result;
  
  //build a modport for DUT
  modport DUTPORT (
    input clock,
    inout reset,
    input in1,
    input in2,
    output result );
  
  //build a modport for test
  modport TESTPORT(
    input clock,
    output reset,
    output in1,
    output in2,
    input result);
  
endinterface  


// This is our DUT.


module dut(
  input clock, reset,
  input [31:0] in1, in2,
  output logic [31:0] result);
  
  always @(posedge clock) begin
      //reset is active high
      if (reset == 1) begin
          result <= 32'h0;
      end
       
      else begin
          // perform XOR operation
          result <= in1 ^ in2;     
      end
  end
	       
endmodule // dut