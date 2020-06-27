#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna os horários com mais disciplinas ofertadas pela UFERSA no período entre 2009-2019.

# Existem várias disciplinas sem horários. Algumas EAD, outras não.

# Disciplinas EAD.
sed 's/","/"\t"/g' < src/Horarios.csv |
    grep EAD |
    grep '"-"' > output/Q3_EAD.csv

# Disciplinas Não EAD sem horários.
sed 's/","/"\t"/g' < src/Horarios.csv |
    grep -v EAD |
    grep '"-"' > output/Q3_Nao_EAD.csv

# Horários mais utilizados
sed 's/","/\t/g' < src/Horarios.csv | 
    egrep -v '\t-\t' | 
    cut -f 7 |  
    grep [A-Z] | 
    sed 's/(.*)$//g' | 
    sort | 
    uniq -c | 
    sort --numeric-sort | 
    sed 's/^[^0-9]*//g' > output/Q3_Hor_Disc.csv
