# EXPLICAÇÃO PARTE 3 DO TRABALHO

Cada dígito do contador é controlado por um módulo chamado `counter_block`, nele é feito a **contagem em bcd até 9**, 
**o registro do valor atual** e a **transformada do número em bcd para 7 segmentos** *a cada subida do clock* (0 para 1). 

A contagem é feita pelo módulo `bcd_counter`, que enquanto não houver um reset, ele fica *somando 1 no primeiro dígito*, 
e quando bate 9, ele é zerado e é adicionado 1 no cnt_9, que se refere a quantas vezes esse dígito alcançou o 9, 
que é somado ao próximo dígito, se existir, e assim continuando o somatório.

Ao mesmo tempo, o módulo `reg_4bit` coloca o valor que está sendo obtido pelo somatório na saída para que ele seja exibido, tendo como valor incial: 0.

Então, esse número, em bcd, é **transformado para 7 segmentos**, pelo módulo `bcd_sgm` e é representado na saída.
