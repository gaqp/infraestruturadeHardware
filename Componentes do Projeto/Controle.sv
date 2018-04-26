module Controle(input clk,input reset,input [5:0] Opcode,input [5:0] Funct,output PCWriteCond,output PCWrite,
				output IorD,output MemRead,output MemWrite,output MemRW,output MemtoReg,output IRWrite,output PCSource,
				output [2:0] ULAOp,output ULASrcA,output [1:0] ULASrcB,output RegWrite,output RegDst);
typedef enum logic [4:0] {RST,Busca,Decodifica,Jump} Estados;
Estados estadoAtual;
initial
begin
estadoAtual = RST;
end
always_ff@(posedge clk) 
begin
	if(reset)
		begin
		estadoAtual = RST;
		end
	else 
		begin
		case(estadoAtual) 
			RST:
			begin
			estadoAtual = Busca;
			end
			Busca:
			begin
			IorD = 1'b0;
			IRWrite = 1'b0;
			MemRW = 1'b0;
			ULASrcA = 1'b0;
			ULASrcB = 1'b1;
			ULAOp = 1'b1;
			PCWrite = 1'b1;
			PCSource = 1'b0;
			estadoAtual = Decodifica;
			end
			Decodifica:
			begin
			PCWrite = 1'b0;
			IRWrite = 1'b1;
			estadoAtual = Busca;
			end
			Jump:
			begin
			PCSource = 1'b0;
			PCWrite = 1'b1;
			end
		endcase
		end
end
endmodule