module top(input [3:0] A, input [3:0] B,input [1:0] OP,input mode,input clk,input [1:0] writeAddress,input writeReg,input instructionAble,input resetReg, input resetCtrl, output [3:0] ALUResult,output [3:0] RegA,output [3:0] RegB, output [1:0] PC, output [1:0] OPMemories, output [1:0] state, output [1:0] ChooseOutputAMemories,output [1:0] ChooseOutputBMemories, output [1:0] writeAddressMemories, output modeMemories,output writeRegMemories, output [9:0] instructionSignal, output [1:0] ChooseOutputA, output [1:0] ChooseOutputB);

reg [3:0] inputA;
reg [3:0] inputB;
assign modeMemories = instructionSignal[8];



reg inputWriteReg;
reg inputMode;
reg [1:0] inputOP;
reg [1:0] inputWriteAddress;


always @(*) begin
    case(inputMode)
    1'b0:begin
        inputA = A;
        inputB = B;

    end
    1'b1:begin
        inputA = RegA;
        inputB = RegB;
    end
    endcase
end

always @(*) begin
    case(instructionAble)
    1'b1:begin
        inputMode = modeMemories;
        inputOP = OPMemories;
        inputWriteAddress = writeAddressMemories;
        inputWriteReg = writeRegMemories;





        
    end

    1'b0:begin
        inputMode = mode;
        inputOP = OP;
        inputWriteAddress = writeAddress;
        inputWriteReg = writeReg;

    end

    endcase
end



    
Alu u2(.A(inputA),.B(inputB),.OP(inputOP),.Result(ALUResult));
RegisterFile u1(.Result(ALUResult),.clk(clk),.writeReg(inputWriteReg),.reset(resetReg),.writeAddress(inputWriteAddress),.DataA(RegA),.DataB(RegB),.ChooseOutputA(ChooseOutputAMemories),.ChooseOutputB(ChooseOutputBMemories), .ChooseOutputADisplay(ChooseOutputA), .ChooseOutputBDisplay(ChooseOutputB));
instructionMemories u3(.instructionSignal(instructionSignal),.clk(clk), .reset(resetCtrl),.PC(PC),.state(state));
ControlUnit u4(.RegWriteReg(writeRegMemories), .RegwriteAddress(writeAddressMemories), .RegChooseOutputA(ChooseOutputAMemories), .RegChooseOutputB(ChooseOutputBMemories), .ALUOP(OPMemories), .clk(clk), .reset(resetCtrl), .instructionSignal(instructionSignal),.state(state));


endmodule





