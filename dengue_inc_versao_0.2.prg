Function main()
cls
set color to g+/

cMode := alltrim( HB_Argv( 1 ) )

if empty( cMode ) = .T.
set color to r+/
? "Erro! Argumento na linha de comando e obrigatorio."
? "Fim do programa."
set color to g+/
quit
endif

if cMode = "blank"
? "blank"

use "c:\hb30\bin\dengon_ent_sul.dbf"
do while .not. eof()
if empty(resul_soro) = .T. .and. empty(resul_ns1) = .T. .and. empty(resul_vi_n) = .T. .and. empty(resul_pcr_) = .T.
replace tp_not with "X"
endif
skip
enddo
close

endif






if cMode = "soro"
? "soro"

use "c:\hb30\bin\dengon_ent_sul.dbf"
do while .not. eof()
if resul_soro = "2" .and. resul_ns1 <> "1" .and. resul_vi_n <> "1" .and. resul_pcr_ <> "1"
replace tp_not with "X"
endif
skip
enddo
close

endif







*use "c:\hb30\bin\dengon_ent_sul.dbf"
*do while .not. eof()
*if resul_soro = "2" .and. resul_ns1 = "2" .and. resul_vi_n = "2" .and. resul_pcr_ = "2"
*replace tp_not with "X"
*endif
*skip
*enddo
*close

use "c:\hb30\bin\dengon_ent_sul.dbf"
do while .not. eof()
@ 1,1 say nu_notific
if criterio = "1"
replace nu_ano with "X"
endif
skip
enddo
close

use "c:\hb30\bin\dengon_ent_sul.dbf"
do while .not. eof()
@ 1,1 say nu_notific
if classi_fin = "10" .or. classi_fin = "11" .or. classi_fin = "12"
replace id_agravo with "X"
endif
skip
enddo
close

use "c:\hb30\bin\dengon_ent_sul.dbf"
do while .not. eof()
if tp_not = "X" .and. id_agravo = "X" .and. nu_ano = "X"
replace sg_uf_not with "X"
endif
skip
enddo
close

use "c:\hb30\bin\dengon_ent_sul.dbf"
delete for sg_uf_not <> "X"
pack
close

return nil