// delay code for the IE stage
// this code takes the bits of IR[20-16] and the IR[15-11] and delays them one clk cycle
// this keeps it inline with the other data while maintaining the their current values
// this happens with the clk


module IR_to_mux(
    output reg [4:0] EX_Mux0,
    output reg [4:0] EX_Mux1,
    input [4:0] IR_20,
    input [4:0] IR_15,
    input clk
    );
    
    always @(posedge clk)
        begin
            EX_Mux0 <= IR_20;
            EX_Mux1 <= IR_15;
        end
endmodule
