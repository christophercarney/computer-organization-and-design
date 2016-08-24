// Sign Extend Code for the IE stage
// This takes the last 16 bits of the IR (IR[15:0]) and takes the bit of IR[15] to extend it to 32 bits
// this happens on the clk


module SignExtend(
    output reg [31:0] IR_out,
    input [15:0] IR_in,
    input clk
    );
    
    always @(posedge clk)
        begin
            IR_out <= {{16{IR_in[15]}},IR_in[15:0]};
        end
            
endmodule
