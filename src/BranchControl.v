module BranchControl(funct3, zero, btype, alu_out, b_ctrl);

input [2:0]funct3;
input zero;
input [1:0]btype;
input [31:0]alu_out;
output reg [1:0]b_ctrl;

always @*
begin
if(btype==1)
begin //BEQ and BNE
case(funct3)
3'b000:b_ctrl = (zero==1&&btype==1)?1:2;
3'b001:b_ctrl = (zero!=1&&btype==1)?1:2;
default:b_ctrl = 1;
endcase
end

else if(btype==2)
begin
//J type
b_ctrl = 1;
end

else if(btype==3)
begin
//I type (JALR)
b_ctrl = 0;
end

else
begin
b_ctrl = 2;
end
end
endmodule










