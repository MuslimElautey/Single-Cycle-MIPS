module Data_Mem(clk,rst,WE,A,WD,RD);
input clk,rst,WE;
input [31:0]A,WD;
output reg [31:0]RD;
reg [31:0]datmem[0:255];
always@(posedge clk) begin
    if(WE)
    datmem[A[7:0]]<=WD;
end
always@(*) begin
    if(rst)
    RD=32'b0;
    else
    RD=datmem[A[7:0]];
end
endmodule