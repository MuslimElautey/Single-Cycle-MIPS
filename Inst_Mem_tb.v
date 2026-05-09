module Inst_mem_tb();
reg clk,rst;
reg [31:0]A;
wire [31:0]RD;
Instruction_mem dut(.clk(clk),.rst(rst),.A(A),.RD(RD));
initial begin
    clk=0;
    forever begin
        #1 clk=~clk;
    end
end
initial begin
    rst=1;
    A=32'b0;
    @(negedge clk);
    rst=0;                  A=10'b0000000000;
        @(negedge clk)      A=10'b0000000001;
        @(negedge clk)      A=10'b0000000010;
        @(negedge clk)      A=10'b0000000100;
        @(negedge clk)      A=10'b0000001000;  
        @(negedge clk)      A=10'b0000001100;
        @(negedge clk)      A=10'b0000010000;  
        @(negedge clk)      A=10'b0000010100;
        @(negedge clk)      A=10'b0000011000;
        @(negedge clk)      A=10'b0000011100;
        @(negedge clk)      A=10'b1000000000;
        @(negedge clk)      A=10'b1111001100;
        @(negedge clk)      A=10'b1111111111;
        @(negedge clk);
    $stop;
end
endmodule