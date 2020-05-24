module mux3to1(in1, in2, in3, select, out);

input [31:0]in1, in2, in3;
input [1:0]select;
output wire [31:0]out;

assign out = select==0?in1:(select==1?in2:in3);
endmodule