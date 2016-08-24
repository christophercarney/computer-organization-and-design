// CODE FOR THE ALU in the IEStage
// this takes in the 32'bit data that was located in the rs Register and the 32'bit result from the ALU_mux(runs on posedge clk) 
// it also takes in the 3'bits control from the ALU_Controler(runs on posedge clk)
// since this runs on the negedge of the clock it should get the correct values from the 2 previous memtioned reseults
// it outputs the 32'bit data depending on what the ALU_Controler tells it to do.
// this includes add, subtact, and, or, set on less than
// the default is needed since not all cases have be defined which we set to 32'b of unknowns

module ALU(
	output reg [31:0] data,
	output reg zero,
	input [2:0] control,
	input [31:0] inputA,
	input [31:0] inputB,
	input clk
	);


	always @(negedge clk)
		begin
			case(control)
				3'b010 :	//add
					begin	
						data <= inputA + inputB;
					end
 				3'b110 :	//subtract
					begin
						data <= inputA - inputB;
					end
				3'b000 : 	//and
					begin
						data <= inputA & inputB;
					end
				3'b001 :	//or
					begin
						data <= inputA | inputB;
					end
				3'b111 :	//set on less than
					begin	
						data <= inputA < inputB;
					end
				default : 	//unknown
					begin
						data <= 32'hxxxxxxxx;
					end
			endcase
		end
		
		always @(*)
			begin
				zero = (data == 0);
			end
endmodule