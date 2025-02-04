# Dengue_inc 
Dengue_inc procura por inconsistências em arquivos de Dengue exportados do SINAN Online.  
Assim, casos confirmados de Dengue pelo critério laboratorial mas com resultados negativos ou em branco nos campos de exames como o IgM, NS1, isolamento viral e o RT-PCR são detectados e totalizados em um arquivo para que, posteriormente, os casos sejam classificados corretamente.

Sintaxe do executável:

~~~
dengue_inc.exe blank soro ns1 iso

blank: procura por campos com resultados de exames em branco.
soro: sorologia IgM negativo.
ns1: exame NS1 negativo.
iso: isolamento negativo.

~~~
