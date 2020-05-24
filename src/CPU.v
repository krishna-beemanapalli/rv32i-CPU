module CPU(clk, reset, instr_read, instr_addr, instr_out, data_read, data_write, data_addr, data_in, data_out);

input clk;
input reset;
output instr_read;
output [31:0]instr_addr;
input [31:0]instr_out;
output data_read;
output data_write;
output [31:0]data_addr;
output [31:0]data_in;
input [31:0]data_out;

wire [31:0]four = 32'h00000004;

//basic
wire [4:0]rs1;
wire [4:0]rs2;
wire [4:0]rd;
wire [6:0]op;
wire [2:0]funct3;
wire [6:0]funct7;

//pc
wire [31:0]pcin;
wire [31:0]pcout;

//decoder
wire RegWrite;
wire [2:0]ALUop;
wire ALUsrc;
wire[1:0]branchCtrl;
wire PCtoRegSrc;
wire RDsrc;
wire MRead;
wire MWrite;
wire MemToReg;
wire [2:0]ImmType;
wire halt;

//Immediate
wire [31:0]imm;

//ALU ctrl
wire [3:0]alu_ctrl;

//Reg File
wire [31:0]rs1_data;
wire [31:0]rs2_data;
wire [31:0]rd_data;

//ALU
wire [31:0] alu_in1;
wire [31:0] alu_in2;
wire [31:0] alu_out;
wire zero;

//mux
wire [31:0] pc_to_reg;
wire [31:0] add1_out;
wire [31:0] add2_out;
wire [31:0] add3_out;
wire [31:0] pc_or_alu_out;

//branch ctrl
wire [1:0] BranchCTRL;

//shift
wire [31:0] new_rs2;
wire [31:0] new_imm;


PC pc(clk, reset, pcin, pcout);

control_unit CU(op, RegWrite, ALUop, ALUsrc, branchCtrl, PCtoRegSrc, RDsrc, MWrite, MRead, MemToReg, ImmType, halt);

Immgen ImmGen(ImmType, instr_out, imm);

aluctr ALUctr(funct7, funct3, ALUop, alu_ctrl);

alu ALU(alu_in1, alu_in2, alu_ctrl, alu_out, zero);

shiftCheck Shift(clk, rs2_data, imm, ALUsrc, op, funct3, new_rs2, new_imm);

mux2to1 mux1(add1_out, add2_out, PCtoRegSrc, pc_to_reg);

mux2to1 mux2(new_rs2, new_imm, ALUsrc, alu_in2);

mux2to1 mux3(pc_to_reg, alu_out, RDsrc, pc_or_alu_out);

mux2to1 mux4(pc_or_alu_out, data_out, MemToReg, rd_data);

adder add1(pcout, imm, add1_out);

adder add2(pcout, four, add2_out);

adder add3(four, pcout, add3_out);

BranchControl bctrl(funct3, zero, branchCtrl, alu_out, BranchCTRL);

mux3to1 mux5(alu_out, add1_out, add3_out, BranchCTRL, pcin);

regfile RFile(clk, rs1_data, rs2_data, rs1, rs2, RegWrite, rd, rd_data);

assign rs1 = instr_out[19:15];
assign rs2 = instr_out[24:20];
assign rd = instr_out[11:7];
assign op = instr_out[6:0];
assign funct3 = instr_out[14:12];
assign funct7 = instr_out[31:25];
assign alu_in1 = rs1_data;
assign instr_addr = pcout;
assign data_read = MRead;
assign data_write = MWrite;
assign data_addr = alu_out;
assign data_in = rs2_data;

assign instr_read = 1;

endmodule





























