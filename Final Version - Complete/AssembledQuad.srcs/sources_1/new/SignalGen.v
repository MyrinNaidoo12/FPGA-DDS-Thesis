`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 03:56:58
// Design Name: 
// Module Name: SignalGen
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


module SignalGen(Clk, sig_out);
//declare input and output
    input Clk;
    output signed [64:0] sig_out;
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
        sig[0] = 0;
        sig[1] = 0;
        sig[2] = 1;
        sig[3] = 1;
        sig[4] = 2;
        sig[5] = 2;
        sig[6] = 3;
        sig[7] = 3;
        sig[8] = 4;
        sig[9] = 4;
        sig[10] = 5;
        sig[11] = 5;
        sig[12] = 6;
        sig[13] = 6;
        sig[14] = 7;
        sig[15] = 7;
        sig[16] = 8;
        sig[17] = 8;
        sig[18] = 9;
        sig[19] = 9;
        sig[20] = 0;
        sig[21] = 0;
        sig[22] = 1;
        sig[23] = 1;
        sig[24] = 2;
        sig[25] = 2;
        sig[26] = 3;
        sig[27] = 3;
        sig[28] = 4;
        sig[29] = 4;
        sig[30] = 5;
        sig[31] = 5;
        sig[32] = 6;
        sig[33] = 6;
        sig[34] = 6;
        sig[35] = 7;
        sig[36] = 7;
        sig[37] = 8;
        sig[38] = 8;
    end
    
    //At every positive edge of the clock, output a sig wave sample.
    always@ (posedge(Clk))
    begin

        sig_out = sig[i];
        j = j+1;
        if(j == 20)
        begin
            j = 0;
            i = i+1;
            if(i == 20)
                i = 0;
        end
            
        
    end

endmodule
