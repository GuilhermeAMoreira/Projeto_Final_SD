`timescale 1 ns/100 ps
`include "src/counter_block.v"

module bcd_counter_3digits( input ck,
							input enb,
							input rst_s,
							input ld,
							output [6:0] sgm0,
							output [6:0] sgm1,
							output [6:0] sgm2,
							output cnt_9);
	wire enb_1, enb_2;
	counter_block bloco1 (.ck(ck), .enb(enb), .rst_s(rst_s), .ld(ld),
						  .sgm(sgm0), .cnt_9(enb_1));

	counter_block bloco2 (.ck(ck), .enb(enb_1), .rst_s(rst_s), .ld(ld),
						  .sgm(sgm1), .cnt_9(enb_2));

	wire aux_1, aux_2;
	and(aux_1, enb_1, enb_2);
	counter_block bloco3 (.ck(ck), .enb(aux_1), .rst_s(rst_s), .ld(ld),
						  .sgm(sgm2), .cnt_9(aux_2));
	and(cnt_9, enb_2, aux_2);
endmodule
