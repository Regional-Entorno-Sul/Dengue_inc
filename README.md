# Dengue_inc 
Dengue_inc procura por inconsistências em arquivos de Dengue exportados do SINAN Online.  
Assim, casos confirmados de Dengue pelo critério laboratorial  

![x](/criterio.jpg)  

mas com resultados negativos ou em branco nos campos de exames como o IgM, NS1, isolamento viral e o RT-PCR

![x](/exames.jpg)  

são detectados e totalizados em um arquivo para que, posteriormente, os casos sejam classificados corretamente.

Sintaxe do executável:

~~~
dengue_inc.exe [blank] [soro] [ns1] [iso] [rtpcr]

blank: procura por casos confirmados de Dengue pelo critério laboratorial mas com os campos com resultados de exames em branco.
soro: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de sorologia IgM negativo e os demais campos com resultados de exames não positivos ou em branco.
ns1: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de exame NS1 negativo e os demais campos com resultados de exames não positivos ou em branco.
iso: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de isolamento negativo e os demais campos com resultados de exames não positivos ou em branco.
rtpcr: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de exame RT-PCR negativo e os demais campos com resultados de exames não positivos ou em branco.

~~~
![x](/dengue_inc.jpg)  

