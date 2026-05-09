module Control_Unit(Op,Funct,RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUOp,Jump,ALUControl);
input [5:0] Op,Funct;
output reg RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,Jump;
output reg [1:0] ALUOp;
output reg [2:0] ALUControl;
//Main Decoder
always @(*) begin
    casex (Op)
        6'b000000: begin    //R-type
            RegWrite = 1'b1;
            RegDst = 1'b1;
            ALUSrc = 1'b0;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 2'b10;
            Jump = 1'b0;
        end
        6'b100011: begin    //lw
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b1;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end
        6'b101011: begin    //sw
            RegWrite = 1'b0;
            RegDst = 1'bx;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemWrite = 1'b1;
            MemtoReg = 1'bx;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end
        6'b000100: begin    //beq
            RegWrite = 1'b0;
            RegDst = 1'bx;
            ALUSrc = 1'b0;
            Branch = 1'b1;
            MemWrite = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'b01;
            Jump = 1'b0;
        end
        6'b001000: begin    //addi
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end
        6'b000010: begin    //jump
            RegWrite = 1'b0;
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            Branch = 1'bx;
            MemWrite = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'bxx;
            Jump = 1'b1;
        end
        default: begin
            RegWrite = 1'b0;
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end 
    endcase
end
//ALU Decoder
always @(*) begin
    casex (ALUOp)
        2'b00:ALUControl = 3'b010;          //add
        2'bx1:ALUControl = 3'b110;          //sub
        2'b1x:case(Funct)
            6'b100000: ALUControl = 3'b010; //add
            6'b100010: ALUControl = 3'b110; //sub
            6'b100100: ALUControl = 3'b000; //and
            6'b100101: ALUControl = 3'b001; //or
            6'b101010: ALUControl = 3'b111; //slt
            default:   ALUControl = 3'b010; //default to add
        endcase
        default: ALUControl = 3'b010;       //default to add
    endcase
end
endmodule