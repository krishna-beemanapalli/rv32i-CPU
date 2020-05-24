module PC(clk, halt, pcin, pcout);

input clk;
input halt;
input [31:0]pcin;
output reg [31:0]pcout;

always @(posedge clk)
begin
if(halt)
pcout<=32'h00000000;
else
pcout<=pcin;
end
endmodule