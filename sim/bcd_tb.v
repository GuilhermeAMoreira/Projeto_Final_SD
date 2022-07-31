`timescale 10 ns/1 ns
`include "sim/src/bcd_counter_3digits.v"

module bcd_tb();
//clock generation
	reg ck, inicio, Vint_z;
	wire enb_3, ld;
	wire enb_0, rst_s, ch_zr, ch_ref, ch_vm;
	wire [6:0] sgm0;
	wire [6:0] sgm1;
	wire [6:0] sgm2;

	bcd_counter_3digits counter(.ck(ck), .rst_s(1'b0), .ld(1'b1), .enb(1'b1),
								.sgm0(sgm0), .sgm1(sgm1), .sgm2(sgm2),
								.cnt_9(enb_3));

	always
		#1 ck = ~ck;
	initial begin
		$dumpfile("sim/vcd/bcd.vcd");
		$dumpvars(0, bcd_tb);
		ck = 0;
		inicio = 1;
		Vint_z = 0;
		#5 inicio = 0;
		#3000 Vint_z = 1;
		#20 Vint_z = 0;

		#5 inicio = 1;
		#5 inicio = 0;
		#3000 Vint_z = 1;
		#10 Vint_z = 0;
		$finish();
	end

endmodule
