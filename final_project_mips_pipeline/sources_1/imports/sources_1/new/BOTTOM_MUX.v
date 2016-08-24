// BOTTOM MUX FOR THE IEStage
// This is the mux that is located at the bottum of the diagram given to us in lab 2
// it gets it select bit from the first bit of the Ex_control[3] and the other inputs are the delayed bits of IR from the IF Stage
// ID_0 is the IR[20:16] (rt) and the ID_1 is the IR[15:11] (rd)
// named accordingly the ID_0 is choosen when select is 0 and ID_1 is choosen when select equals 1
// this runs on the posedge of the clk


module BOTTOM_MUX(
        output reg [4:0] MEM_Latch,
        input [4:0] ID_0,
        input [4:0] ID_1,
        input sel,
        input clk
    );
    
    always @(posedge clk)
        begin
            if(sel == 0)
                MEM_Latch <= ID_0;
            else
                MEM_Latch <= ID_1;
        end
endmodule
