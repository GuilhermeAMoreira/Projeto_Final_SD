`timescale 1 ns/100 ps

module bcd_counter( input ck,
					input enb,
					input rst_s,
					output reg [3:0] q,
					output reg cnt_9);
	initial begin
		q = 0;
		cnt_9 = 0;
	end
	always @(posedge ck) begin
		if (rst_s) begin
			q = 0;
			cnt_9 = 1'b0;
		end else if (enb) begin
			// Count from 0 to 9
			if (q == 9) begin
				q = 0;
			end else begin
				q++;
			end
		cnt_9 = (q == 9)? 1'b1 : 1'b0;
		end
	end
endmodule
