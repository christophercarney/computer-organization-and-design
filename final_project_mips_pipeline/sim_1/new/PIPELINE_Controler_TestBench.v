`timescale 1ns / 1ps

// the testbench for our controler that sends values to the control of the pipeline causes the pipeline to do the indicated task

module PIPELINE_Controler_TestBench();

    reg clk;
    reg [3:0] switches;
    reg [2:0] buttons;
    wire LED1;
    wire [5:0] IR_controlbits;
    
    ControlBoard contoller(clk, switches, buttons, LED1);
    
    initial
        begin
            clk = 0;
            switches = 4'b1000;
            buttons = 3'b010;
            #20 switches = 4'b0100;
            #20 switches = 4'b0010;
            #20 switches = 4'b0001;
            #20 buttons = 3'b110;
            #20 buttons = 3'b000;
            #20 buttons = 3'b001;
            #20 buttons = 3'b111;
            #20 $stop;
       end
       
   always
        begin
            clk = ~clk;
        end
        
        
endmodule
