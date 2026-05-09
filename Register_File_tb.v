module Register_File_tb();
reg clk,rst,WE3;
reg [4:0]A1,A2,A3;
reg [31:0]WD3;
wire [31:0]RD1,RD2;
Register_File RF(.clk(clk),.rst(rst),.A1(A1),.A2(A2),.A3(A3),
.WD3(WD3),.WE3(WE3),.RD1(RD1),.RD2(RD2));
initial begin
    clk=0;
    forever #1 clk=~clk;
end
initial begin
    $readmemh("Register_File.mem",RF.regfile);
    rst=1;WE3=0;A1=0;A2=0;A3=0;WD3=0;
    @(negedge clk);
    rst=0;
    repeat(50) begin
        @(negedge clk);
        A1=$random%32;
        A2=$random%32;
        A3=$random%32;
        WD3=$random;
        WE3=$random%2;
    end
    $stop;
end
endmodule