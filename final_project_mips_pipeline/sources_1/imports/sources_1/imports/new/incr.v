// part of the IF stage
// adder + 4 for the pc
// always does it on the clock 

module incr(in, out, clk);
	input [31:0] in;
	output reg [31:0] out;
	input clk;
	
	always @ (posedge clk)
	begin
		out <= in + 32'd4;
	end
endmodule