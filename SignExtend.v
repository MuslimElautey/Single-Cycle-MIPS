module SignExtend(Inst,SignImm);
input [15:0]Inst;
output [31:0]SignImm;
assign SignImm={{16{Inst[15]}},Inst};
endmodule