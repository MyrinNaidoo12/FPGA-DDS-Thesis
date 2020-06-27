`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2020 01:04:10
// Design Name: 
// Module Name: SigIn
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


module SigIn(Clk, sig_out, bitIn);
//declare input and output
    input Clk;
    output signed [64:0] sig_out;
    input signed [1949:0] bitIn;
//declare the sine ROM - 30 registers each 8 bit wide.  
    reg signed [64:0] sig [0:38]; //input bitstream here to modulate
    wire Clk;
//Internal signals  
    integer i;
    integer j;
    integer freqCount =1;  
    reg signed [64:0] sig_out;
    reg sweep = 0;
//Initialize the sine rom with samples. 
    initial begin
        i = 0;
        j = 0;
        sig[0] = bitIn[64:0];
        sig[1] = bitIn[129:65];
        sig[2] = bitIn[194:130];
        sig[3] = bitIn[259:195];
        sig[4] = bitIn[324:260];
        sig[5] = bitIn[389:325];
        sig[6] = bitIn[454:390];
        sig[7] = bitIn[519:455];
        sig[8] = bitIn[584:520];
        sig[9] = bitIn[649:585];
        sig[10] = bitIn[714:650];
        sig[11] = bitIn[779:715];
        sig[12] = bitIn[844:780];
        sig[13] = bitIn[909:845];
        sig[14] = bitIn[974:910];
        sig[15] = bitIn[1039:975];
        sig[16] = bitIn[1104:1040];
        sig[17] = bitIn[1169:1105];
        sig[18] = bitIn[1234:1170];
        sig[19] = bitIn[1299:1235];
        sig[20] = bitIn[1364:1300];
        sig[21] = bitIn[1429:1365];
        sig[22] = bitIn[1494:1430];
        sig[23] = bitIn[1559:1495];
        sig[24] = bitIn[1624:1560];
        sig[25] = bitIn[1689:1625];
        sig[26] = bitIn[1754:1690];
        sig[27] = bitIn[1819:1755];
        sig[28] = bitIn[1884:1820];
        sig[29] = bitIn[1949:1884];
    end
    
    //At every positive edge of the clock, output a sig wave sample.
    always@ (posedge(Clk))
    begin

        sig_out = sig[i];
        i = i+1;
        if(i == 29)
            i = 0;

            
        
    end

endmodule
