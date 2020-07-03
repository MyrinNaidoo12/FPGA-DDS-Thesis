`timescale 1ns / 1ps
`include "sinemodule.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2020 00:09:45
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench();// Declare inputs as regs and outputs as wires
reg clock, freq, mode;
wire signed [64:0] counter_out;
wire signed [64:0] co_out;
wire [64:0] freqT;
wire [64:0] RealF;
wire signed [64:0] signal1;
wire signed [64:0] signal2;
wire signed [256:0] ModOut;

wire signed [129:0] QuadOut1;
wire signed [129:0] QuadOut2;
// Initialize all variables
initial begin        
  $display ("time\t clk reset enable counter");	
  $monitor ("%g\t", 
	  $time, clock, counter_out, co_out, signal1, QuadOut1, QuadOut2,ModOut);	
  clock = 1;       // initial value of clock
  freq = 2;
  mode = 0;

  #500 $finish;      // Terminate simulation
end

// Clock generator
always begin
  #1 clock = ~clock; // Toggle clock every tick
end

// Connect DUT to test bench
freqTrans ft(clock, 17000000, freqT, RealF);
sinemodule testCase (
clock,
freqT,
mode,
counter_out,
co_out
);

SignalGen sigNew(clock, signal1);
SignalGen sigTwo(clock, signal2);
multiVer msin(clock, signal1, counter_out, QuadOut1);
multiVer mcos(clock, signal1, co_out, QuadOut2);
add adder(clock, QuadOut1, QuadOut2, ModOut);

endmodule

