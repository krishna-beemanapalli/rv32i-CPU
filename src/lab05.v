module lab05(reset, clk, clk1);

input clk;
output clk1;
input reset;

wire instr_read;
wire [31:0]instr_addr;
wire [31:0]instr_out;
wire data_read;
wire data_write;
wire [31:0]data_addr;
wire [31:0]data_in;
wire [31:0]data_out;

pll pll1(clk, clk1);

CPU cpu(clk1, reset, instr_read, instr_addr, instr_out, data_read, data_write, data_addr, data_in, data_out);

IM im(instr_out, clk1, instr_addr);

data_mem data(data_addr, ~clk1, data_in, data_write, data_out);

endmodule 
