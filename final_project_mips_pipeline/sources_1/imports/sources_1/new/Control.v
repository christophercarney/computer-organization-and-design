// Control code for the IDStage
// it takes the first 6 bits of the 32 bit IR and determines the values of the control bits
// the case statement is for the operations given to us and the x signifys a don't care
// the default is for the Rtype in which the default is needed since we have not defined all possible out comes of the IR[31:26]
// all of this happens on the clk

module Control(
    output reg [1:0] WB,
    output reg [2:0] M,
    output reg [3:0] EX,
    input [5:0] IR,
    input clk
    );
    
    always @(posedge clk)
        begin
            WB <= 2'b00;
            M <= 3'b000;
            EX <= 4'b0000;
            
            case(IR)
                 6'b100011 : //lw
                    begin
                        WB <= 2'b11;
                        M <= 3'b010;
                        EX <= 4'b0001;
                    end
                 6'b101011 : //sw
                    begin
                        WB <= 2'b0x;
                        M <= 3'b001;
                        EX <= 4'bx001;
                    end
                 6'b000100 : //beq
                    begin
                        WB <= 2'b0x;
                        M <= 3'b100;
                        EX <= 4'bx010;
                    end
                 default: //Rtype
                    begin
                        WB <= 2'b10;
                        M <= 3'b000;
                        EX <= 4'b1100;
                    end
          endcase
          end
                        
    
    
endmodule
