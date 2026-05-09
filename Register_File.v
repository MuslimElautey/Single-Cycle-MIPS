module Register_File(clk,rst,A1,A2,A3,WD3,WE3,RD1,RD2);
    input clk,rst,WE3;
    input [4:0]A1,A2,A3;
    input [31:0]WD3;
    output reg [31:0]RD1,RD2;
    reg [31:0]regfile[0:31];
    always@(posedge clk) begin
            if(WE3)
            regfile[A3]<=WD3;
        end
    always @(*) begin
        if(rst)
        begin
            RD1=32'b0;
            RD2=32'b0;
        end    
        else
        begin
            RD1=regfile[A1];
            RD2=regfile[A2];
            end
    end
endmodule