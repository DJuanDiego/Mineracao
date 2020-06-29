#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna as disciplinas mais ofertadas pela UFERSA no período entre 2009-2019.

# Envia o número de vezes que cada disciplina foi ofertada, em ordem crescente, para um arquivo.
sed 's/","/"\t"/g' < src/Horarios.csv |
    cut -f 5 | 
    sort | 
    uniq -c | 
    sed 's/^[^0-9]*//g' | 
    sort -r --numeric-sort | 
    tr ' ' ',' > output/Q2.csv
