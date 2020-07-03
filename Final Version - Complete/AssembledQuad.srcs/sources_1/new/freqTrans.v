`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2020 00:13:41
// Design Name: 
// Module Name: freqTrans
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


module freqTrans(Clk, inA, outA, outRFreq);
//declare input and output
    input Clk;
    input [64:0] inA;
    output [64:0] outA;
    output [64:0] outRFreq;
//declare the sine ROM - 30 registers each 8 bit wide.  

    wire Clk;
    wire [64:0] inA;
    reg [64:0] outA;
    real temp;
    reg [64:0] outRFreq;
    integer temp2;
//Initialize the sine rom with samples. 

    //At every positive edge of the clock, output a sine wave sample.
    always@ (posedge(Clk))
    begin
        temp = (1000000000.0/(inA*58.0));
        //temp2 = (temp/58);
        outA = temp;
        temp2 = temp;
        outRFreq = (1000000000.0/(temp2*58));
    end

endmodule
