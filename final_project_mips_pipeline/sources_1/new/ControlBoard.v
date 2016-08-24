// Code to put it on the board that calls the pipeline 
// it supplies the clk as input and the IR value since that is what needs changed to work


module ControlBoard(
    input clk,
    input [3:0] switches,
    input [2:0] buttons,
    output reg LED1,
	output reg [2:0] state
    );

		wire [5:0] controlIRbits;
	
     PIPELINE allstages(clk, state, controlIRbits);

    // led1 is set to the value of the clock so that you can see it when it is 1 and 0
    // then 2 different statements to determine (the first case) what switches (which are the lw(100011), sw(101011), beq(000100), and control board(default) )
    // the other one (the second case) is to deterime which Rtype you want (add out(100000) in(010), subtract out(100010) in(110), and out(100100) in(000),
	// or out(100101) in(001), set on less than out(101010) in(111))
    always@ (*)
        begin
            LED1 = clk;
            case(switches)
                4'b1000: //lw
					begin
						state = 3'd0;	
					end
				4'b0100: //sw
					begin
						state = 3'd1;	
					end
				4'b0010: //beq
					begin
						state = 3'd2;	
					end
				4'b0001:  //Rtype
					begin
						case(buttons)
							3'b010: //add
								begin
								    state = 3'd3;
								end
							3'b110: //sub
								begin
									state = 3'd4;
								end
							3'b000: //and
								begin
									state = 3'd5;	
								end
							3'b001: //or
								begin
									state = 3'd6;
								end
							3'b111: //set on  less than
								begin
									state = 3'd7;	
								end
							default : //unknown
								begin
									state = 3'bxxx;
								end
						endcase
					end
				default : //unknown
					begin
						state = 3'bxxx;
					end
			endcase
		end
				
//		initial
//			begin
//			assign	controlIRbits = 6'd0;
//			end
						
endmodule
