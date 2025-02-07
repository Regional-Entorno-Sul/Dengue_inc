# Dengue_inc 
Dengue_inc é um utilitário de código abero que procura por inconsistências em arquivos de Dengue exportados do SINAN Online.  
Assim, casos confirmados de Dengue pelo critério laboratorial  

![x](/criterio.jpg)  

mas com resultados negativos ou em branco nos campos de exames como o IgM, NS1, isolamento viral e o RT-PCR

![x](/exames.jpg)  

são detectados e totalizados em um arquivo para que, posteriormente, os casos sejam classificados corretamente.

Sintaxe do executável:

~~~
dengue_inc.exe --mun [codigo IBGE do municipio de residencia] [blank] [soro] [ns1] [iso] [rtpcr]

--mun [codigo IBGE do municipio de residencia]: procura por dados específicos do município de residência, este deve ser especificado com o código do IBGE com seis dígitos. Se este argumento não for usado, o programa procura por inconsistência em toda a base de dados, seja qual for o município de residência.
Exemplo: dengue_inc.exe --mun 521250 blank
blank: procura por casos confirmados de Dengue pelo critério laboratorial mas com os campos com resultados de exames em branco.
soro: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de sorologia IgM negativo e os demais campos com resultados de exames não positivos ou em branco.
ns1: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de exame NS1 negativo e os demais campos com resultados de exames não positivos ou em branco.
iso: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de isolamento negativo e os demais campos com resultados de exames não positivos ou em branco.
rtpcr: procura por casos confirmados de Dengue pelo critério laboratorial mas com resultado de exame RT-PCR negativo e os demais campos com resultados de exames não positivos ou em branco.
Exemplo: dengue_inc.exe rtpcr

~~~

## Possiveis erros durante a execução  

**Erro 001**  
O usuário não usou nenhum argumento na linha de comando para rodar o executável.  
Solução: usar na linha de comando algum dos argumentos obrigatórios para rodar o programa. Os argumentos válidos estão descritos em 'sintaxe do executável' no README deste repositório.

**Erro 002**  
O usuário usou um argumento inválido na linha de comando ao rodar o executável.  
Solução: consultar no README deste repositório, a 'sintaxe do executável' e verificar os argumentos válidos para executar o progrma.

**Erro 003**  
No subdiretório "zip", é onde o usuário deve deixar o arquivo exportado do SINAN Online para o programa processar. É permitido apenas um arquivo no formato zip dentro desse subdiretório. Se for encontrado mais de um, ocorre um erro.  
Solução: excluir os arquivos que estão em excesso, deixando preferencialmente o que estiver mais atualizados com os dados exportados do SINAN Online.

**Erro 004**  
Esse erro ocorre quando no subdiretório "zip", não é encontrado nenhum arquivo exportado do SINAN Online no formato zip.  
Soluçao: o programa precisa de dados para funcionar. Esses dados vêm em um arquivo de exportação do SINAN Online. Basta gerar o arquivo de exportação nesta aplicação web (http://sinan.saude.gov.br/sinan/login/login.jsf), fazer o download do arquivo e copiá-lo para o subdiretório 'zip' que fica dentro da estrutura de pastas e subpastas do 'Dengue_inc'. Não é necessário descompactar o arquivo, o programa já faz isso automaticamante.

**Erro 005**  
Esse erro ocorre quando não é encontrado no disco local C ou unidade local C, o diretório principal do programa (c:\dengue_inc).  
Solução: Fazer o download do último release do programa e seguir as instruções de como usá-lo no PC.

**Erro 006**  
Esse erro ocorre quando o subdiretório "zip" não é encontrado na estrutura de pastas e subpastas do programa (c:\dengue_inc\zip).  
Solução: Fazer o download do último release do programa e seguir as instruções de como usá-lo no PC.

**Erro 007**  
Esse erro ocorre quando o subdiretório "run" não é encontrado na estrutura de pastas e subpastas do programa (c:\dengue_inc\run).  
Solução: Fazer o download do último release do programa e seguir as instruções de como usá-lo no PC.

**Erro 008**  
Esse erro ocorre quando o subdiretório "mod" não é encontrado na estrutura de pastas e subpastas do programa (c:\dengue_inc\mod).  
Solução: Fazer o download do último release do programa e seguir as instruções de como usá-lo no PC.

**Erro 009**  
Esse erro ocorre quando o subdiretório "out" não é encontrado na estrutura de pastas e subpastas do programa (c:\dengue_inc\out).  
Solução: Fazer o download do último release do programa e seguir as instruções de como usá-lo no PC.

**Erro 010**  
O arquivo "deng_model.dbf" necessário ao bom funcionamento do programa não foi encontrado no subdiretório 'mod'.  
Solução: Fazer o download do último release do programa e seguir as instruções de como usá-lo no PC.

**Erro 011**  
Argumento --mun sem o código do município.  
Solução: Quando o usuário opta por usar o argumento --mun na linha de comando, o código IBGE do município se torna obrigatório.

**Erro 012**






![x](/erro_7.jpg)  
  
![x](/dengue_inc.jpg)  

