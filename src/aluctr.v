module aluctr(funct7, funct3, aluop, alucontrol);

input [6:0]funct7;
input [2:0]funct3;
input [1:0]aluop;
output reg [3:0]alucontrol;

always @*
begin
if(aluop==3'b000)
begin
//R
if(funct3==3'b000)
begin
if(funct7==7'b0000001)
alucontrol = 4'b0100;
else
alucontrol = funct7[5]==1?4'b0110:4'b0010;
end
else if(funct3[2:0]==3'b001)
alucontrol = 4'b1110;
else if(funct3[2:0]==3'b110)
alucontrol = 4'b0001;
else if(funct3[2:0]==3'b111)
alucontrol = 4'b0000;
end

else if(aluop==3'b001)
begin
alucontrol = 4'b0010; //add lw
end
//I
else if(aluop==3'b110)
begin
if(funct3[2:0]==3'b000)
alucontrol = 4'b0010;
else if(funct3[2:0]==3'b001)
alucontrol = 4'b1110;
end

else if(aluop==3'b111)
begin
//JALR
alucontrol = 4'b0010;
end

else if(aluop==3'b010)
begin
//S
alucontrol = 4'b0010;
end

else if(aluop==3'b011)
begin
if(funct3[2:1]==2'b00)
// beq, bnq
alucontrol = 4'b0110;
end

else if(aluop==3'b101)
begin
//J
alucontrol = 4'b0000; // don't care
end
end
endmodule