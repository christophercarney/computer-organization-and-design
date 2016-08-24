// IF stage Mux 
// If the select bit equals one then it chooses the in1 and if the select bit = 0 it chooses the in0
// happens on the negedge of the clk so that it chooses after it gets the correct value from the incr (adder + 4 ) 
// this is also used for the WB stage



module mux(in0, in1, sel, out, clk);
	input [31:0] in1, in0;
	input sel, clk;
	output reg [31:0] out;
	
	always @ (negedge clk)
	begin
		if (sel == 0)
			out <= in0;
		else
			out <= in1;
	end
endmodule
