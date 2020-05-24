module alu(in1, in2, alu_ctrl, aluout, zero);

input [31:0] in1;
input [31:0] in2;
input [3:0] alu_ctrl;
output reg [31:0] aluout;
output zero;

assign zero = in1==in2?1:0;

always @*
case (alu_ctrl)
4'b0000: aluout = in1 & in2;
4'b0001: aluout = in1 | in2;
4'b0010: aluout = in1 + in2;
4'b0100: aluout = in1 * in2;
4'b0110: aluout = in1 - in2;
4'b1110: aluout = in1 << in2[4:0];
default: aluout<=0;
endcase

endmodule