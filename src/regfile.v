module regfile(clk, rd1, rd2, rs1, rs2, reg_write, write_reg, write_data);

input clk;
output [31:0] rd1; 
output [31:0] rd2;
input [4:0] rs1; 
input [4:0] rs2; 
input [4:0] write_reg;
input [31:0] write_data;
input reg_write;

reg [31:0]registers[31:0];

initial begin
registers[0]=32'b0;
registers[1]=32'b0;
end

always @(posedge clk)
begin
if (reg_write)
registers[write_reg] <= write_data;
end

assign rd1 = rs1 == 0? 32'b0 : registers[rs1];
assign rd2 = rs2 == 0? 32'b0 : registers[rs2];

endmodule