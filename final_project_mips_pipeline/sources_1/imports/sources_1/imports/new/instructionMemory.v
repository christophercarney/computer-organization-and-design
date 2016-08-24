// part of the IF stage
// data is assigned when addr changes which is the addr is the value of the pc
// the intial block was there to intially assign values to the RAM inwhich there is 128 32bits of RAM

module instructionMemory(addr, data);
    input[31:0] addr;
    output reg [31:0] data;
    
    reg [31:0]RAM[0:127];
    
    initial
        begin
        RAM[0] = 32'hA00000AA;
        RAM[4] = 32'h10000011;
        RAM[8] = 32'h20000022;
        RAM[12] = 32'h30000033;
        RAM[16] = 32'h40000044;
        RAM[20] = 32'h50000055;
        RAM[24] = 32'h60000066;
        RAM[28] = 32'h70000077;
        RAM[32] = 32'h80000088;
        RAM[36] = 32'h90000099;
        end
        
    always@ (*)
    begin
        data = RAM[addr];
    end

endmodule