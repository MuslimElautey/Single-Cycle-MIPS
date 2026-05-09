module Instruction_mem(clk,rst,A,RD);
input clk,rst;
input [31:0]A;
output reg [31:0]RD;
reg [31:0]insmem[0:255];
initial begin
    $readmemh("Instruction_Mem.mem",insmem);
end
always@(*) begin
    if(rst)
    RD=32'b0;
    else
    RD=insmem[A[9:2]];
end
endmodule