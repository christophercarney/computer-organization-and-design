// CODE FOR THE ALU MUX in the IEstage
// this takes in the 32'bit signExtend and puts it into in1 and the 32'bit from the Read Data 2 for in0;
// it chooses between these 2 on the posedge of the clock using the select bit from the [0] bit of the EX Contorl bit that was evalutated in the ID stage

module ALU_MUX(
	output reg [31:0] out,
	input [31:0] in1,
	input [31:0] in0,
	input sel,
	input clk
	);

	always @(posedge clk)
		begin
			if(sel == 0)
				out <= in0;
			else
				out <= in1;
		end
	
endmodule