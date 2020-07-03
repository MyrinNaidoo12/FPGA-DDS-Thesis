`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2020 22:29:50
// Design Name: 
// Module Name: multiVer
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


module multiVer(Clk, inA, inB, outAB);
//declare input and output
    input Clk;
    input signed [64:0] inA;
    input signed [64:0] inB;
    output signed [130:0] outAB;
//declare the sine ROM - 30 registers each 8 bit wide.  

    wire Clk;
    wire signed [64:0] inA;
    wire signed [64:0] inB;
    reg signed [130:0] outAB;
//Initialize the sine rom with samples. 

    //At every positive edge of the clock, output a sine wave sample.
    always@ (posedge(Clk))
    begin
        outAB = inA*inB;
    end

endmodule

