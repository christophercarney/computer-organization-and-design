// ALU_CONTROLER for IEStage
// this is the code that takes in the first 6'bits of the IR[5:0] and the 2'bits of control from EX_Control[2:1]
// this code is split into two parts.
// 1.) the first case statment is for the 2 control bits. (ALUop) this determines what type it is : sw, lw, branch equals, Rtype
// 2.) the second case statment is for the 6'bits of IR[5:0] (funct). This only evaluates if the ALUop says it is an Rtype.
//      since there are many different Rtypes we needed this case statment to determine between add, subtract, and, or, set less than
// Again both of these needed a default case where for the 5'bit (funct) case we used just x's (don't cares) and for the 2'bit (ALUop) we used the x's (don't cares) as our default
// all of this takes place on the posedge of the clk


module ALU_CONTROL(
    output reg [2:0] select,
    input [5:0] funct,
    input [1:0] ALUop,
    input clk
    );
    
    always @(posedge clk)
        begin
            case(ALUop)
                2'b00 :  //sw, lw
                    begin
                        select <= 3'b010;
                    end
                2'b01 : //branch equals
                    begin
                        select <= 3'b110;
                    end
                2'b10 : //rtype
                    begin 
                        case(funct)
                            6'b100000 : //add
                                begin
                                    select <= 3'b010;
                                end
                            6'b100010 : //subtract
                                begin
                                    select <= 3'b110;
                                end
                            6'b100100 : //and
                                begin
                                    select <= 3'b000;
                                end
                            6'b100101 : //or
                                begin
                                    select <= 3'b001;
                                end
                            6'b101010 : //set on less than
                                begin
                                    select <= 3'b111;
                                end
                            default : 
                                begin
                                    select <= 3'bxxx;
                                end
                        endcase
                    end
                    
              2'b11 : // default case
                begin
                    select <= 3'bxxx;
                end
          endcase
       end
                     
endmodule
