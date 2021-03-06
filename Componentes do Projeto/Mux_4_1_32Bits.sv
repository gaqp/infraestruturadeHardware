module Mux_4_1_32Bits(input [31:0] zero, input [31:0] um, input [31:0] dois, input [31:0] tres, input [1:0]seletor, output [31:0] saida);
// Multiplexador de 4 entradas de 32 bits
always@*
begin
	case(seletor)
	2'b00:
	begin
		saida = zero;
	end
	2'b01:
	begin
		saida = um;
	end
	2'b10:
	begin
		saida = dois;
	end
	2'b11:
	begin
		saida = tres;
	end
	endcase
end
endmodule