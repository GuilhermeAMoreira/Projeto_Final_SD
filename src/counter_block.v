`timescale 1 ns/100 ps
`include "src/bcd_sgm.v"
`include "src/reg_4bit.v"
`include "src/bcd_counter.v"

module counter_block( input ck,
						input rst_s,
						input enb,
						input ld,
						output [6:0] sgm,
						output cnt_9);
	wire [3:0] qx;
	wire [3:0] qs;
	bcd_counter counter (.ck(ck), .rst_s(rst_s), .enb(enb), .q(qx), .cnt_9(cnt_9));
	reg_4bit register (.ck(ck), .ld(ld), .d(qx), .q(qs));
	bcd_sgm converter (.bcd(qs), .sgm(sgm));
endmodule
