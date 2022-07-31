# Projeto_Final_SD

Esse repositório contem os arquivos do contador BCD e controlador do ADC de rampa dupla.

## Programas necessários
- `iverilog`: gera os arquivos de simulação .simul
- `yosys`: optimiza o código em verilog e gera os circuitos RTL
- `gtkwave`: visualiza as simulações
- `gv`: necessário para gera os circuitos RTL

## Estrutura de Pastas
- `src/`: arquivos verilog dos circuitos
- `sim/`: arquivos usados para a simulação
- `rtl/`: arquivos usados para a geração dos circuitos RTL

## Como usar

Para visualizar a simulação do contador BCD execute o comando abaixo:

	$ make bcd-simulate

E para gerar os arquivos RTL execute este comando:

	$ make bcd-rtl


Para visualizar a simulação do controlador ADC execute o comando abaixo:

	$ make adc-simulate

E para gerar os arquivos RTL execute este comando:

	$ make adc-rtl
