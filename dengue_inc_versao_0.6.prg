Function main()
cls
set color to g+/

@ 1,0 say "**************************************************************"
@ 2,0 say "* Dengue_inc versao 0.6 06/02/2025                           *"
@ 3,0 say "* Diretoria Macrorregional Nordeste                          *"
@ 4,0 say "* Regional Entorno Sul                                       *"
@ 5,0 say "* https://github.com/Regional-Entorno-Sul/Dengue_inc         *"
@ 6,0 say "* Procura por inconsistencia na base de dados de Dengue.     *"
@ 7,0 say "* Argumentos aceitos:                                        *"
@ 8,0 say "* blank, soro, ns1, iso, rtpcr                               *"
@ 9,0 say "**************************************************************"

set color to gr+/

if HB_DirExists("c:\dengue_inc") = .F.
set color to r+/
? "Erro 005!"
? "Diretorio principal (c:\dengue_inc) nao encontrado."
? "Fim do programa."
set color to gr+/
quit
endif

if HB_DirExists("c:\dengue_inc\zip") = .F.
set color to r+/
? "Erro 006!"
? "Subdiretorio 'zip' (c:\dengue_inc\zip) nao encontrado."
? "Fim do programa."
set color to gr+/
quit
endif

if HB_DirExists("c:\dengue_inc\run") = .F.
set color to r+/
? "Erro 007!"
? "Subdiretorio 'run' (c:\dengue_inc\run) nao encontrado."
? "Fim do programa."
set color to gr+/
quit
endif

cMode := alltrim( HB_Argv( 1 ) )

if empty( cMode ) = .T.
set color to r+/
? "Erro 001! Argumento na linha de comando e obrigatorio."
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
? "Erro 002! Argumento usado na linha de comando nao existe."
? "Fim do programa."
set color to gr+/
quit
endif

nTotal := ADir ( "c:\dengue_inc\zip\*.zip" )

if nTotal > 1
set color to r+/
? "Erro 003!"
? "Somente podera haver um arquivo no formato zip no diretorio 'zip'."
? "Fim do programa."
set color to gr+/
quit
endif

if nTotal = 0
set color to r+/
? "Erro 004!"
? "Nenhum arquivo no formato zip no diretorio 'zip' foi encontrado."
? "Fim do programa."
set color to gr+/
quit
endif

cFiles := "c:\dengue_inc\zip\*.dbf"
aList := Directory( cFiles )
nSize := len( aList )

if nSize >=1
__run( "echo off & del /F /Q c:\dengue_inc\zip\*.dbf" )
endif

cFiles2 := "c:\dengue_inc\run\*.dbf"
aList2 := Directory( cFiles2 )
nSize2 := len( aList2 )

if nSize2 >=1
__run( "echo off & del /F /Q c:\dengue_inc\run\*.dbf" )
endif

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
@ 13,0 say "Argumento usado:blank" color "g+/"

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
@ 13,0 say "Argumento usado:soro" color "g+/"

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
@ 13,0 say "Argumento usado:ns1" color "g+/"

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
@ 13,0 say "Argumento usado:iso" color "g+/"

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
@ 13,0 say "Argumento usado:rtpcr" color "g+/"

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

@ 14,0 say "Procurando inconsistencia (fase 1/3) --------------- " + alltrim( str( nPercent ) ) + "%"
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

@ 15,0 say "Procurando inconsistencia (fase 2/3) --------------- " + alltrim( str( nPercent ) ) + "%"
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

@ 16,0 say "Procurando inconsistencia (fase 3/3) --------------- " + alltrim( str( nPercent ) ) + "%"
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