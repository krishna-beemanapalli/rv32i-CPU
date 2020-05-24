module control_unit(op, RegWrite, ALUop, ALUsrc, branchCtrl, PCtoRegSrc, RDsrc, MemRead, MemWrite, MemtoReg, ImmType, halt);

input [6:0]op;
output reg RegWrite;
output reg [2:0]ALUop;
output reg ALUsrc;
output reg [1:0]branchCtrl;
output reg PCtoRegSrc;
output reg RDsrc;
output reg MemWrite;
output reg MemRead;
output reg MemtoReg;
output reg [2:0]ImmType;
output reg halt;

always @(op)
begin
if(op==7'b0110011)
begin //R type
halt = 0;
RegWrite = 1;
ALUop = 3'b000;
ALUsrc = 0;
branchCtrl = 0; //dont care
PCtoRegSrc = 1; //dont care
RDsrc = 1;
MemRead = 0;
MemWrite = 0;
MemtoReg = 0;
ImmType = 3'b111;
end

else if(op==7'b0100011)
begin //S type
halt = 0;
RegWrite = 1;
ALUop = 3'b010;
ALUsrc = 1;
branchCtrl = 0; //dont care
PCtoRegSrc = 1; //dont care
RDsrc = 1; //dont care
MemRead = 0;
MemWrite = 1;
MemtoReg = 0; //dont care
ImmType = 3'b010;
end

else if(op==7'b1100011)
begin //B type
halt = 0;
RegWrite = 0;
ALUop = 3'b011;
ALUsrc = 0;
branchCtrl = 1; 
PCtoRegSrc = 0; 
RDsrc = 0; 
MemRead = 0;
MemWrite = 0;
MemtoReg = 0; //dont care
ImmType = 3'b011;
end

else if(op==7'b1101111)
begin //J type
halt = 0;
RegWrite = 1;
ALUop = 3'b101;
ALUsrc = 1;
branchCtrl = 2; 
PCtoRegSrc = 1; 
RDsrc = 0; 
MemRead = 0;
MemWrite = 0;
MemtoReg = 0; //dont care
ImmType = 3'b100;
end

else if(op==7'b1111111)
begin
halt = 1;
RegWrite = 0;
ALUop = 3'b000;
ALUsrc = 0;
branchCtrl = 0; //dont care
PCtoRegSrc = 0; //dont care
RDsrc = 0; //dont care
MemRead = 0;
MemWrite = 0;
MemtoReg = 0; //dont care
ImmType = 3'b000;
end

else
begin //I type
if(op==7'b0000011)
begin
halt = 0;
RegWrite = 1;
ALUop = 3'b001;
ALUsrc = 1;
branchCtrl = 0; //dont care
PCtoRegSrc = 0; //dont care
RDsrc = 1; 
MemRead = 1;
MemWrite = 0;
MemtoReg = 1; //dont care
ImmType = 3'b001;
end

else if(op==7'b0010011) 
begin
halt = 0;
RegWrite = 1;
ALUop = 3'b110;
ALUsrc = 1;
branchCtrl = 0; //dont care
PCtoRegSrc = 0; //dont care
RDsrc = 1; 
MemRead = 0;
MemWrite = 0;
MemtoReg = 0; 
ImmType = 3'b001;
end

else
begin
halt = 0;
RegWrite = 1;
ALUop = 3'b111;
ALUsrc = 1;
branchCtrl = 3; 
PCtoRegSrc = 1; 
RDsrc = 0; 
MemRead = 0;
MemWrite = 0;
MemtoReg = 0; 
ImmType = 3'b001;
end
end
end
endmodule












