module mux(i0,i1,s,out);
parameter Width =32 ;
input [Width-1:0]i0,i1;
input s;
output reg [Width-1:0]out;
always@(*) begin
    if(s)
    out=i1;
    else
    out=i0;
end
endmodule