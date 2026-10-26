module instructionMemories(input clk,input [1:0] state, input reset,output  [9:0] instructionSignal,output reg [1:0] PC );


ROM u1(.instructionSignal(instructionSignal), .PC(PC));


always @(posedge clk or posedge reset) begin
if(reset)
PC <= 2'b11;
else if(state ==2'b11)
PC <= PC + 2'b01;

end

endmodule


module ROM(input  [1:0] PC, output reg [9:0] instructionSignal);

always @(*) begin 
    case(PC)
    2'b00: instructionSignal = 10'b1100011010;
    2'b01: instructionSignal = 10'b1101101111;
    2'b10: instructionSignal = 10'b0110110011;
    2'b11: instructionSignal = 10'b0101110111;
    endcase

end

endmodule
