module Regtb;
reg [3:0] A;
reg [3:0] B;
reg [1:0] OP;
reg  mode;
reg clk;
reg [1:0] writeAddress;
reg writeReg;
wire [3:0] ALUResult;
wire [3:0] RegA;
wire [3:0] RegB;
reg instructionAble;
wire [1:0] OPMemories;
wire [1:0] PC;
wire [3:0] DataA;
wire [1:0] state;
wire [1:0] ChooseOutputAMemories;
wire [1:0] ChooseOutputBMemories;
wire [1:0] writeAddressMemories;
wire modeMemories;
wire writeRegMemories;
wire [9:0] instructionSignal;
wire [1:0] ChooseOutputA;
wire [1:0] ChooseOutputB;
reg resetCtrl;
reg resetReg;
top u1(.A(A),.B(B),.OP(OP),.mode(mode),.clk(clk),.writeAddress(writeAddress),.writeReg(writeReg),.ALUResult(ALUResult),.RegA(RegA),.RegB(RegB),.instructionAble(instructionAble),.OPMemories(OPMemories),.PC(PC),.state(state),.ChooseOutputAMemories(ChooseOutputAMemories), .ChooseOutputBMemories(ChooseOutputBMemories), .writeAddressMemories(writeAddressMemories), .modeMemories(modeMemories), .writeRegMemories(writeRegMemories), .instructionSignal(instructionSignal), .ChooseOutputA(ChooseOutputA), .ChooseOutputB(ChooseOutputB), .resetReg(resetReg), .resetCtrl(resetCtrl));


initial begin
   clk = 1'b0;
end

 always begin
    #5
   clk = ~clk;

 end



initial begin 
    
    $dumpfile("Regtb.vcd");
    $dumpvars(0,Regtb);
    


    resetReg = 1'b1;
    resetCtrl = 1'b1;
    #2
    resetReg = 1'b0;
    #1
    resetCtrl = 1'b0;
    #1
    instructionAble = 1'b0;
    mode = 1'b0;
    writeReg =1'b1;
    A = 4'b1010;
    B = 4'b1111;
    OP = 2'b00;
    writeAddress = 2'b00;
   
    repeat(4) @(posedge clk);

    #1
     $display("A=%b B=%b OP=%b ALUResult=%b ", A, B, OP, ALUResult);

   
   #1
    mode = 1'b0;
    writeReg =1'b1;
    A = 4'b0101;
    B = 4'b0111;
    OP = 2'b01;
    writeAddress = 2'b01;
    instructionAble = 1'b0;

    repeat(4) @(posedge clk);
    #1

    $display("A=%b B=%b OP=%b ALUResult=%b ", A, B, OP, ALUResult);
    #1
    resetReg = 1'b0;
    resetCtrl = 1'b1;
    #2
    resetCtrl = 1'b0;
    instructionAble = 1'b1;
    #1
    
    repeat(4) @(posedge clk);
    #1
      $display("PC=%b RegA=%b RegB=%b OPMemories=%b ALUResult=%b state =%b instructionSignal =%b ChooseOutputA =%b ChooseOutputB =%b",PC,RegA, RegB, OPMemories, ALUResult, state, instructionSignal, ChooseOutputA, ChooseOutputB);
    
    repeat(4) @(posedge clk);
    #1
      $display("PC=%b RegA=%b RegB=%b OPMemories=%b ALUResult=%b state =%b instructionSignal =%b ChooseOutputA =%b ChooseOutputB =%b",PC,RegA, RegB, OPMemories, ALUResult, state, instructionSignal, ChooseOutputA, ChooseOutputB);
    
    repeat(4) @(posedge clk);
    #1
      $display("PC=%b  RegA=%b RegB=%b OPMemories=%b ALUResult=%b state =%b instructionSignal =%b ChooseOutputA =%b ChooseOutputB =%b",PC,RegA, RegB, OPMemories, ALUResult, state, instructionSignal, ChooseOutputA, ChooseOutputB);
     
     repeat(4) @(posedge clk);
    #1
      $display("PC=%b RegA=%b RegB=%b OPMemories=%b ALUResult=%b state =%b instructionSignal =%b ChooseOutputA =%b ChooseOutputB = %b",PC,RegA, RegB, OPMemories, ALUResult, state, instructionSignal, ChooseOutputA, ChooseOutputB);
      
    repeat(1) @(posedge clk);

     $finish;




end
endmodule





    




