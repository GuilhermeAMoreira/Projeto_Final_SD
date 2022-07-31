# Gera arquivos otimizados dos arquivos fonte do trabalho
bcd_optimize:
	yosys sim/scripts/bcd.ys

adc_optimize:
	yosys sim/scripts/adc.ys

# Gera simulacao
bcd-gen-simulation: bcd_optimize
	iverilog -o sim/bcd.simul sim/bcd_tb.v

adc-gen-simulation: adc_optimize bcd_optimize
	iverilog -o sim/adc.simul sim/adc_tb.v

# Executa simulacao
bcd-simulate: bcd-gen-simulation
	@./sim/bcd.simul
	@gtkwave sim/vcd/bcd.vcd

adc-simulate: adc-gen-simulation
	@./sim/adc.simul
	@gtkwave sim/vcd/adc.vcd

bcd-rtl:
	yosys rtl/bcd_rtl_gen.ys

adc-rtl:
	yosys rtl/adc_rtl_gen.ys

clean:
	rm -f sim/*.simul
	rm -f sim/vcd/*.vcd
	rm -f sim/src/*.v
