module MIPS_tb();
reg clk,rst;
Single_Cycle_MIPS s1(.clk(clk),.rst(rst));
initial begin
    clk=0;
    forever begin
        #1 clk=~clk;
    end
end
initial begin
    $readmemh("Register_File.mem",s1.rf.regfile);
    $readmemh("Data_Mem.mem",s1.dm.datmem);
    rst=1;
    @(negedge clk);
    rst=0;
    repeat(50)@(negedge clk);
    $stop;
end
endmodule