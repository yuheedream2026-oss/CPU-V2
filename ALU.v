module Alu(input[3:0] A,input[3:0] B,input [1:0] OP,output reg [3:0] Result);
wire[3:0]WireAddout;
wire[3:0]WireSubout;
wire[3:0]WireAndout;
wire[3:0]WireOrout;
Adder u1(.A(A),.B(B),.Addout(WireAddout));
Subtractor u2(.A(A),.B(B),.Subout(WireSubout));
Andder u3(.A(A),.B(B),.Andout(WireAndout));
Order u4(.A(A),.B(B),.Orout(WireOrout));
always @(*) begin
case(OP)
2'b00: Result = WireAddout;
2'b01: Result = WireSubout;
2'b10: Result = WireAndout;
2'b11: Result = WireOrout;
default: Result = 4'b0000;

endcase
end


endmodule


module Adder(input[3:0]A,input[3:0]B, output[3:0]Addout);

assign Addout = A + B ;

endmodule 


module Subtractor(input[3:0]A,input[3:0]B,output[3:0]Subout);

assign Subout = A - B;

endmodule


module Andder(input[3:0]A,input[3:0]B,output[3:0]Andout);

assign Andout = A & B;

endmodule


module Order(input[3:0]A,input[3:0]B,output[3:0]Orout);

assign Orout = A | B;

endmodule

















