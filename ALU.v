module ALU(SrcA,SrcB,ALUControl,ALUResult,Zero);
input [31:0]SrcA,SrcB;
input [2:0]ALUControl;
output reg [31:0]ALUResult;
output reg Zero;
always @(*) begin
    case (ALUControl)
        3'b000: ALUResult = SrcA & SrcB;
        3'b001: ALUResult = SrcA | SrcB;
        3'b010: ALUResult = SrcA + SrcB;
      //3'b011: not used
        3'b100: ALUResult = SrcA &~SrcB;
        3'b101: ALUResult = SrcA |~SrcB;
        3'b110: ALUResult = SrcA - SrcB;
        3'b111: ALUResult = (SrcA < SrcB) ? 32'h1 : 32'h0; //slt (set less than)
        default: ALUResult = 32'h0;
    endcase
    if(ALUResult == 32'h0)
        Zero = 1'b1;
    else
        Zero = 1'b0;
end
endmodule