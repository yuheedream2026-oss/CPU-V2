module RegisterFile(input [3:0]Result,input writeReg,input clk,input reset,input [1:0] writeAddress,output reg [3:0] DataA,output reg [3:0] DataB ,input [1:0] ChooseOutputA,input [1:0] ChooseOutputB,output [1:0] ChooseOutputADisplay, output [1:0] ChooseOutputBDisplay);
 
 
reg [3:0] writeEnable;
wire [3:0] R0;
wire [3:0] R1;
wire [3:0] R2;
wire [3:0] R3;



assign ChooseOutputADisplay = ChooseOutputA;
assign ChooseOutputBDisplay = ChooseOutputB;

wire wireWriteEnable0;
wire wireWriteEnable1;
wire wireWriteEnable2;
wire wireWriteEnable3;

assign wireWriteEnable0 = writeEnable[0];
assign wireWriteEnable1 = writeEnable[1];
assign wireWriteEnable2 = writeEnable[2];
assign wireWriteEnable3 = writeEnable[3];


R0 u1(.Result0(Result), .clk(clk), .reset(reset), .Storedresult0(R0), .writeEnable0(wireWriteEnable0),.writeReg(writeReg));

R1 u2(.Result1(Result), .clk(clk), .reset(reset), .Storedresult1(R1), .writeEnable1(wireWriteEnable1),.writeReg(writeReg));

R2 u3(.Result2(Result), .clk(clk), .reset(reset), .Storedresult2(R2), .writeEnable2(wireWriteEnable2),.writeReg(writeReg));

R3 u4(.Result3(Result), .clk(clk), .reset(reset), .Storedresult3(R3), .writeEnable3(wireWriteEnable3),.writeReg(writeReg));

always @(*) begin
case(writeAddress)
2'b00: writeEnable = 4'b0001;
2'b01: writeEnable = 4'b0010;
2'b10: writeEnable = 4'b0100;
2'b11: writeEnable = 4'b1000;
endcase
end

always @(*) begin
case(ChooseOutputA)
2'b00: DataA = R0;
2'b01: DataA = R1;
2'b10: DataA = R2;
2'b11: DataA = R3;
endcase
end

always @(*) begin
case(ChooseOutputB)
2'b00: DataB = R0;
2'b01: DataB = R1;
2'b10: DataB = R2;
2'b11: DataB = R3;
endcase
end
endmodule

module R0(input [3:0]Result0,input writeEnable0,input writeReg,input clk,input reset, output reg [3:0]Storedresult0 );

wire writeEnableFinal0;
assign writeEnableFinal0 = writeReg & writeEnable0;



always @(posedge clk or posedge reset) begin
if(reset)
Storedresult0 <= 0;

else if(writeEnableFinal0)
Storedresult0 <= Result0;
end


endmodule

module R1(input [3:0]Result1,input writeEnable1,input writeReg,input clk,input reset,output reg [3:0]Storedresult1 );

wire writeEnableFinal1;
assign writeEnableFinal1 = writeReg & writeEnable1;


always @(posedge clk or posedge reset) begin
if(reset)
Storedresult1 <= 0;

else if(writeEnableFinal1)
Storedresult1 <= Result1;
end


endmodule

module R2(input [3:0]Result2,input writeEnable2,input writeReg,input clk,input reset,output reg [3:0]Storedresult2 );

wire writeEnableFinal2;
assign writeEnableFinal2 = writeReg & writeEnable2;

always @(posedge clk or posedge reset) begin
if(reset)
Storedresult2 <= 0;

else if(writeEnableFinal2)
Storedresult2 <= Result2;
end


endmodule


module R3(input [3:0]Result3,input writeEnable3,input writeReg,input clk,input reset,output reg [3:0]Storedresult3 );

wire writeEnableFinal3;
assign writeEnableFinal3 = writeReg & writeEnable3;


always @(posedge clk or posedge reset) begin
if(reset)
Storedresult3 <= 0;

else if(writeEnableFinal3)
Storedresult3 <= Result3;
end


endmodule



