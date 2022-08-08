`timescale 1 ns/100 ps

module reg_4bit( input ck,
				 input ld,
				 input [3:0] d,
				 output reg [3:0] q);
	initial begin
		q = 0;
	end

	always @ (posedge ck) begin
		if(ld) begin
			q = d;
		end
		else begin end
	end
endmodule
