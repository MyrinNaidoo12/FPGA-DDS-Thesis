
module sinemodule(Clk, freq, mode, data_out, co_out);
//declare input and output
    input Clk;
    input freq;
    input mode;
    output signed [64:0] data_out;
    output signed [64:0] co_out;
//declare the sine ROM - 30 registers each 8 bit wide.  
    reg signed [64:0] sine [0:38];
    wire Clk;

    wire freq;
    wire mode;
//Internal signals  
    integer i;
    integer j;
    integer freqCount =1;  
    reg signed [64:0] data_out;
    reg signed [64:0] co_out;
    reg sweep = 0;
//Initialize the sine rom with samples. 
    initial begin
        i = 0;
        j = 0;
        data_out = 0;
        sine[0] = 0;
        sine[1] = 16;
        sine[2] = 31;
        sine[3] = 45;
        sine[4] = 58;
        sine[5] = 67;
        sine[6] = 74;
        sine[7] = 77;
        sine[8] = 77;
        sine[9] = 74;
        sine[10] = 67;
        sine[11] = 58;
        sine[12] = 45;
        sine[13] = 31;
        sine[14] = 16;
        sine[15] = 0;
        sine[16] = -16;
        sine[17] = -31;
        sine[18] = -45;
        sine[19] = -58;
        sine[20] = -67;
        sine[21] = -74;
        sine[22] = -77;
        sine[23] = -77;
        sine[24] = -74;
        sine[25] = -67;
        sine[26] = -58;
        sine[27] = -45;
        sine[28] = -31;
        sine[29] = -16;
        sine[30] = 0;
        sine[31] = 16;
        sine[32] = 31;
        sine[33] = 45;
        sine[34] = 58;
        sine[35] = 67;
        sine[36] = 74;
        sine[37] = 77;
        sine[38] = 77;
    end
    
    //At every positive edge of the clock, output a sine wave sample.
    always@ (posedge(Clk))
    begin
        if(mode == 0)
            begin
            data_out = sine[i];
            co_out = sine[i+7];
            j = j+1;
            if(j == freq)
                begin
                    i = i+ 1;
                    j = 0;
                end
            if(i == 29)
                i = 0;

        end
        if(mode == 1)
            begin
            data_out = sine[i];
            co_out = sine[i+7];
            j = j+1;
            if(j == freqCount)
                begin
                    i = i+ 1;
                    j = 0;
                end
            if(i == 29)
            begin
                i = 0;
                freqCount = freqCount +1;
            end
        end
        
    end

endmodule
