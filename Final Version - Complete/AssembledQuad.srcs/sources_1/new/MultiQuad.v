`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 03:49:29
// Design Name: 
// Module Name: MultiQuad
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


module multiQuad(Clk, inA, inB, outAB);
//declare input and output
    input Clk;
    input signed [64:0] inA;
    input signed [64:0] inB;
    output signed [129:0] outAB;
//declare the sine ROM - 30 registers each 8 bit wide.  

    wire Clk;
    wire signed [64:0] inA;
    wire signed [64:0] inB;
    reg signed [129:0] outAB;
//Initialize the sine rom with samples. 

    //At every positive edge of the clock, output a sine wave sample.
    always@ (posedge(Clk))
    begin
        outAB = inA*inB;
    end

endmodule
