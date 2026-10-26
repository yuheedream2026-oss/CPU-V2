module ControlUnit(input clk, input reset, input [9:0] instructionSignal,output reg RegWriteReg,output reg [1:0] RegwriteAddress,output reg [1:0] RegChooseOutputA, output reg [1:0] RegChooseOutputB,  output reg [1:0] ALUOP, output reg [1:0] state);

always @(posedge clk or posedge reset) begin
if(reset)
state <= 2'b11;
else
state <= state + 2'b01;

end


always @(*) begin
    case(state)
    2'b00:begin
        RegChooseOutputA = {instructionSignal[7],instructionSignal[6]};
        RegChooseOutputB = {instructionSignal[5],instructionSignal[4]};
        ALUOP = 2'b00;
        RegwriteAddress = 2'b00;
        RegWriteReg = 1'b0;
    end

    2'b01:begin
        RegChooseOutputA = {instructionSignal[7],instructionSignal[6]};
        RegChooseOutputB = {instructionSignal[5],instructionSignal[4]};
        ALUOP = {instructionSignal[3],instructionSignal[2]};
        RegwriteAddress = 2'b00;
        RegWriteReg = 1'b0;
    end

    2'b10:begin
        RegChooseOutputA = {instructionSignal[7],instructionSignal[6]};
        RegChooseOutputB = {instructionSignal[5],instructionSignal[4]};
        ALUOP = {instructionSignal[3],instructionSignal[2]};
        RegwriteAddress =  {instructionSignal[1],instructionSignal[0]};
        RegWriteReg = 1'b0;

    end

    2'b11:begin
        RegChooseOutputA = {instructionSignal[7],instructionSignal[6]};
        RegChooseOutputB = {instructionSignal[5],instructionSignal[4]};
        ALUOP = {instructionSignal[3],instructionSignal[2]};
        RegwriteAddress =  {instructionSignal[1],instructionSignal[0]};
        RegWriteReg = instructionSignal[9];

    end


    endcase
end
endmodule
