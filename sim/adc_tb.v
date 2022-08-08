`timescale 10 ns/1 ns
`include "sim/src/state_machine.v"
`include "sim/src/bcd_counter_3digits.v"

module adc_tb();
//clock generation
reg ck, inicio, Vint_z;
wire enb_3, ld;
wire enb_0, rst_s, ch_zr, ch_ref, ch_vm;
wire [6:0] sgm0;
wire [6:0] sgm1;
wire [6:0] sgm2;
// Modules to control adc

state_machine control(.ck(ck), .inicio(inicio), .Vint_z(Vint_z), .enb_3(enb_3),
					  .enb_0(enb_0), .rst_s(rst_s), .ch_vm(ch_vm), .ch_ref(ch_ref),
					  .ch_zr(ch_zr), .ld(ld));

bcd_counter_3digits counter(.ck(ck), .rst_s(rst_s), .ld(ld), .enb(enb_0),
							.sgm0(sgm0), .sgm1(sgm1), .sgm2(sgm2),
							.cnt_9(enb_3));

always
     #1 ck = ~ck;
initial begin
    $dumpfile("sim/vcd/adc.vcd");
    $dumpvars(0, adc_tb);
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
