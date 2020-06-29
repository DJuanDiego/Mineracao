#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna os horários com mais disciplinas ofertadas pela UFERSA no período entre 2009-2019.

# Existem várias disciplinas sem horários. Algumas EAD, outras não.
# Disciplinas EAD.
sed 's/","/"\t"/g' < src/Horarios.csv |
    grep EAD |
    grep '"-"' | 
    tr \\t , > output/Q3_EAD.csv

# Número de vezes que cada Disciplina EAD foi ofertada
sort < output/Q3_EAD.csv | 
    cut -f 5 | 
    sort |  
    uniq -c | 
    sort --numeric-sort


# Disciplinas Não EAD sem horários.
sed 's/","/"\t"/g' < src/Horarios.csv |
    egrep -v '"EAD[0-9]{2,}"' |
    grep '"-"' | 
    tr \\t , > output/Q3_Nao_EAD.csv

# Número de vezes que cada Disciplina Não EAD e sem horário foi ofertada.
sort < output/Q3_Nao_EAD.csv | 
    cut -f 5 | 
    sort |  
    uniq -c | 
    sort --numeric-sort

# Disciplinas com Horário
sed 's/","/"\t"/g' < src/Horarios.csv |
    egrep -v '"EAD[0-9]{2,}"|"-"' | 
    tr \\t ',' > output/Q3_Disc_C_Hor.csv

# Horários mais utilizados
sed 's/","/\t/g' < src/Horarios.csv | 
    egrep -v '\t-\t' | 
    cut -f 7 |  
    grep [A-Z] | 
    sed 's/(.*)$//g' | 
    sort | 
    uniq -c | 
    sort -r --numeric-sort | 
    sed 's/^[^0-9]*//g' | 
    sed 's/ /,/' > output/Q3_Hor_Disc.csv
