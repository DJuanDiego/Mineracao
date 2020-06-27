#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna as disciplinas que não obedecem a resolução dos horários estabelecidos pelo CONSEPE em 2007.

# Vezes em que foram cadastradas disciplinas que não seguem a convenção de horários.
sed 's/","/"\t"/g' < src/Horarios.csv | 
    egrep '7(M|T|N)|1(M|T|N)' |    
    sort > output/Q4.csv

# As disciplinas que mais desrespeitaram a convenção
cut -f 5,7 < output/Q4.csv | 
    sort | 
    uniq -c | 
    sort --numeric-sort

# Os professores dessas disciplinas

