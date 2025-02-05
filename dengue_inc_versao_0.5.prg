Function main()
cls
set color to g+/

@ 1,0 say "**************************************************************"
@ 2,0 say "* Dengue_inc versao 0.5 05/02/2025                           *"
@ 3,0 say "* Diretoria Macrorregional Nordeste                          *"
@ 4,0 say "* Regional Entorno Sul                                       *"
@ 5,0 say "* https://github.com/Regional-Entorno-Sul/Inconsist          *"
@ 6,0 say "* Procura por inconsistencia na base de dados de Dengue.     *"
@ 7,0 say "* Argumentos aceitos:                                        *"
@ 8,0 say "* blank, soro, ns1, iso, rtpcr                               *"
@ 9,0 say "**************************************************************"

set color to gr+/

cMode := alltrim( HB_Argv( 1 ) )

if empty( cMode ) = .T.
set color to r+/
? "Erro! Argumento na linha de comando e obrigatorio."
? "Fim do programa."
set color to gr+/
quit
endif

nMode := 0
if cMode = "blank"
nMode ++
endif
if cMode = "soro"
nMode ++
endif
if cMode = "ns1"
nMode ++
endif
if cMode = "iso"
nMode ++
endif
if cMode = "rtpcr"
nMode ++
endif
if nMode = 0
set color to r+/
? "Erro! Argumento usado na linha de comando nao existe."
? "Fim do programa."
set color to gr+/
quit
endif

nTotal := ADir ( "c:\dengue_inc\zip\*.zip" )

if nTotal <> 1
set color to r+/
? "Erro!"
? "Somente podera haver um arquivo no formato zip no diretorio 'DBF'."
? "Fim do programa."
set color to gr+/
quit
endif

__run( "echo off & del /F /Q c:\dengue_inc\zip\*.dbf" )
__run( "echo off & del /F /Q c:\dengue_inc\run\*.dbf" )

@ 10,0 say "Extraindo o arquivo dbf do arquivo zip..."
nArraySize := ADir( "c:\dengue_inc\zip\" )
aName := Array( nArraySize )
ADir( ( "c:\dengue_inc\zip\" ),aName )
for f = 1 to nArraySize
hb_UnzipFile( "c:\dengue_inc\zip\" + aName[f] )
next
@ 11,0 say "Arquivo zip:" color "rb+/"
@ 11,13 say ( "c:\dengue_inc\zip\" + aName[1] ) color "gr+/"

nArraySize2 := ADir( "c:\dengue_inc\zip\*.dbf" )
aName2 := Array( nArraySize2 )
ADir( ( "c:\dengue_inc\zip\*.dbf" ),aName2 )

@ 12,0 say "Arquivo dbf:" color "rb+/"
@ 12,13 say ( "c:\dengue_inc\zip\" + aName2[1] ) color "gr+/"

rename ( "c:\dengue_inc\zip\" + aName2[1] ) to ("c:\dengue_inc\zip\dengon.dbf")
copy file "c:\dengue_inc\zip\dengon.dbf" to "c:\dengue_inc\run\dengon.dbf"

if cMode = "blank"
@ 13,0 say "Argumento usado:blank"

use "c:\dengue_inc\run\dengon.dbf"
do while .not. eof()
if empty(resul_soro) = .T. .and. empty(resul_ns1) = .T. .and. empty(resul_vi_n) = .T. .and. empty(resul_pcr_) = .T.
replace tp_not with "X"
endif
skip
enddo
close

endif

if cMode = "soro"
@ 13,0 say "Argumento usado:soro"

use "c:\dengue_inc\run\dengon.dbf"
do while .not. eof()
if resul_soro = "2" .and. resul_ns1 <> "1" .and. resul_vi_n <> "1" .and. resul_pcr_ <> "1"
replace tp_not with "X"
endif
skip
enddo
close

endif

if cMode = "ns1"
@ 13,0 say "Argumento usado:ns1"

use "c:\dengue_inc\run\dengon.dbf"
do while .not. eof()
if resul_soro <> "1" .and. resul_ns1 = "2" .and. resul_vi_n <> "1" .and. resul_pcr_ <> "1"
replace tp_not with "X"
endif
skip
enddo
close

endif

if cMode = "iso"
@ 13,0 say "Argumento usado:iso"

use "c:\dengue_inc\run\dengon.dbf"
do while .not. eof()
if resul_soro <> "1" .and. resul_ns1 <> "1" .and. resul_vi_n = "2" .and. resul_pcr_ <> "1"
replace tp_not with "X"
endif
skip
enddo
close

endif

if cMode = "rtpcr"
@ 13,0 say "Argumento usado:rtpcr"

use "c:\dengue_inc\run\dengon.dbf"
do while .not. eof()
if resul_soro <> "1" .and. resul_ns1 <> "1" .and. resul_vi_n <> "1" .and. resul_pcr_ = "2"
replace tp_not with "X"
endif
skip
enddo
close

endif

use "c:\dengue_inc\run\dengon.dbf"
nTotalRecs := reccount()
nNotif := 1

do while .not. eof()

nPercent := ( nNotif * 100 ) / nTotalRecs

@ 14,0 say "Procurando inconsistencia (fase 1) --------------- " + alltrim( str( nPercent ) ) + "%"
if criterio = "1"
replace nu_ano with "X"
endif
skip
nNotif ++
enddo
close

use "c:\dengue_inc\run\dengon.dbf"
nTotalRecs := reccount()
nNotif := 1

do while .not. eof()

nPercent := ( nNotif * 100 ) / nTotalRecs

@ 15,0 say "Procurando inconsistencia (fase 2) --------------- " + alltrim( str( nPercent ) ) + "%"
if classi_fin = "10" .or. classi_fin = "11" .or. classi_fin = "12"
replace id_agravo with "X"
endif
skip
nNotif ++
enddo
close

use "c:\dengue_inc\run\dengon.dbf"
nTotalRecs := reccount()
nNotif := 1

do while .not. eof()

nPercent := ( nNotif * 100 ) / nTotalRecs

@ 16,0 say "Procurando inconsistencia (fase 3) --------------- " + alltrim( str( nPercent ) ) + "%"
if tp_not = "X" .and. id_agravo = "X" .and. nu_ano = "X"
replace sg_uf_not with "X"
endif
skip
nNotif ++
enddo
close

@ 17,0 say "Aguarde..."

use "c:\dengue_inc\run\dengon.dbf"
delete for sg_uf_not <> "X"
pack
close

@ 18,0 say "Fim do programa."
wait

return nil