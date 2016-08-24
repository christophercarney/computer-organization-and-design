// Branch Adder for IE stage
// this takes in the delayed 32'bit resault from the IF stage Adder(PC value) and the value of the 32'bit signExtend (IR[15:0]) which is the address
// it takes these 2 values and adds them together 
// this takes place on the posedge of the clk

module ADDER(
    output reg [31:0] add_out,
    input [31:0] add_in1,
    input [31:0] add_in2, 
    input clk
    );
    
    always @(posedge clk)
        begin 
            add_out <= add_in1 + add_in2;
        end
endmodule
