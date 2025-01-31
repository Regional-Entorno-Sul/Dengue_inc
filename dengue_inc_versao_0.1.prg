Function main()
cls
set color to g+/

use "c:\hb30\bin\dengon_ent_sul.dbf"
do while .not. eof()
if resul_soro = "2" .and. resul_ns1 = "2" .and. resul_vi_n = "2" .and. resul_pcr_ = "2"
replace tp_not with "X"
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
if tp_not = "X" .and. id_agravo = "X"
replace sg_uf_not with "X"
endif
skip
enddo
close

use "c:\hb30\bin\dengon_ent_sul.dbf"
delete for sg_uf_not <> "X"
pack
close

use "c:\hb30\bin\dengon_ent_sul.dbf"
delete for criterio <> "1"
pack
close

return nil