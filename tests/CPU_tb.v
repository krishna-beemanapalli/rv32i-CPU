`timescale 10ns/1ns
module CPU_tb;

reg clk;
reg reset;
reg [31:0]instr_out;
reg [31:0]data_out;
wire instr_read, data_read, data_write;
wire [31:0]data_addr;
wire [31:0]data_in;

CPU test(clk, reset, instr_read, instr_addr, instr_out, data_read, data_write, data_addr, data_in, data_out);
initial
begin
$display("clk instr data_in");
$monitor("%b %d %d", clk, instr_out, data_in);

clk=0;
#10
instr_out=32'h00600513;
#10
instr_out=32'h00100293;
#10
instr_out=32'h00100593;
#10
instr_out=32'h02b282b3;
#10
instr_out=32'h00158593;
#10
instr_out=32'hfea59ce3;
#10
instr_out=32'h02b282b3;

#500 $finish; 
end

always #5 clk = ~clk;

endmodule

