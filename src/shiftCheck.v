module shiftCheck(clk, rd2, imm, alu_src, op, funct3, new_rd2, new_imm);

input clk;
input [31:0]rd2;
input [31:0]imm;
input alu_src;
input [6:0]op;
input [2:0]funct3;
output reg [31:0]new_rd2;
output reg [31:0]new_imm;

always @*
begin
if(op==7'b0010011)
begin //I
if(funct3==3'b001)
begin
new_rd2 = rd2;
new_imm = {27'b0,imm[4:0]};
end
else
begin
new_rd2 = rd2;
new_imm = imm;
end
end

else if(op==7'b1100111)
begin
new_rd2 = rd2;
new_imm = imm;
end
else
begin
new_rd2 = rd2;
new_imm = imm;
end
end
endmodule
