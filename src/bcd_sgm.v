`timescale 1 ns/100 ps

module bcd_sgm( input wire [3:0] bcd,
				output reg [6:0] sgm);
	always @ * begin
		case(bcd)
			4'b0000 : sgm <= 7'b1111110; //0
			4'b0001 : sgm <= 7'b0110000; //1
			4'b0010 : sgm <= 7'b1101101; //2
			4'b0011 : sgm <= 7'b1111001; //3
			4'b0100 : sgm <= 7'b0110011; //4
			4'b0101 : sgm <= 7'b1011011; //5
			4'b0110 : sgm <= 7'b1011111; //6
			4'b0111 : sgm <= 7'b1110000; //7
			4'b1000 : sgm <= 7'b1111111; //8
			4'b1001 : sgm <= 7'b1111011; //9
			default : sgm <= 'b0;
		endcase
	end
endmodule
