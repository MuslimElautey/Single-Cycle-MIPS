module Data_Mem_tb();
reg clk,rst,WE;
reg [31:0]A,WD;
wire [31:0]RD;
Data_Mem dut(.clk(clk),.rst(rst),.WE(WE),.A(A),.WD(WD),.RD(RD));
initial begin
    clk=0;
    forever #1 clk=~clk;
end
initial begin
    $readmemh("Data_Mem.mem",dut.datmem);
    rst=1;WE=0;A=0;WD=0;
    @(negedge clk);
    rst=0;
    repeat(50) begin
        @(negedge clk);
        A=$random%256;
        WD=$random;
        WE=$random;
    end
    $stop;
end
endmodule