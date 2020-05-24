module IM(instr, clk, pc);

output reg [31:0]instr;
input clk;

input [31:0] pc;
reg [7:0] ins_memory[0:43];
initial
begin
ins_memory[0]=8'h93;
ins_memory[1]=8'h02;
ins_memory[2]=8'h80;
ins_memory[3]=8'h00;

ins_memory[4]=8'h13;
ins_memory[5]=8'h03;
ins_memory[6]=8'hf0;
ins_memory[7]=8'h00;

ins_memory[8]=8'h23;
ins_memory[9]=8'ha0;
ins_memory[10]=8'h62;
ins_memory[11]=8'h00;

ins_memory[12]=8'hb3;
ins_memory[13]=8'h03;
ins_memory[14]=8'h53;
ins_memory[15]=8'h00;

ins_memory[16]=8'h33;
ins_memory[17]=8'h0e;
ins_memory[18]=8'h53;
ins_memory[19]=8'h40;

ins_memory[20]=8'hb3;
ins_memory[21]=8'h84;
ins_memory[22]=8'hc3;
ins_memory[23]=8'h03;

ins_memory[24]=8'h93;
ins_memory[25]=8'h82;
ins_memory[26]=8'h42;
ins_memory[27]=8'h00;

ins_memory[28]=8'h03;
ins_memory[29]=8'ha9;
ins_memory[30]=8'hc2;
ins_memory[31]=8'hff;

ins_memory[32]=8'h33;
ins_memory[33]=8'h89;
ins_memory[34]=8'h24;
ins_memory[35]=8'h41;

ins_memory[36]=8'h13;
ins_memory[37]=8'h19;
ins_memory[38]=8'h29;
ins_memory[39]=8'h00;

ins_memory[40]=8'h23;
ins_memory[41]=8'ha0;
ins_memory[42]=8'h22;
ins_memory[43]=8'h01;

end

always @(posedge clk)
begin
instr[7:0]=ins_memory[pc];
instr[15:8]=ins_memory[pc+1];
instr[23:16]=ins_memory[pc+2];
instr[31:24]=ins_memory[pc+3];
end
endmodule