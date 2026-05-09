module Program_Counter(clk,rst,pci,pco);
    input clk,rst;
    input [31:0]pci;
    output reg [31:0]pco;
    always @(posedge clk) begin
        if(rst)
        pco<=32'b0;
        else
        pco<=pci;
    end
endmodule