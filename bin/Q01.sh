#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna o número de disciplinas ofertadas pela UFERSA no período entre 2009-2019.

# Envia o valor para uma variável.
N_Disc=$(wc -l src/Horarios.csv)

# Escreve a mensagem num arquivo de texto.
echo "A Universidade ofertou $N_Disc disciplinas entre 2007 e 2019" > output/Q1.txt

# Total de disciplinas por período
cut -d, -f 3 < src/Horarios.csv | 
    sed -e 's/"//g' | 
    sort --numeric-sort | 
    uniq -c | 
    sed 's/^[^0-9]*//g' | 
    awk '{print $2,$1}' | 
    sort --numeric-sort | 
    sed 's/ /,/g' > output/Q1_Periodo.csv

# Total de disciplinas por ano
cut -d, -f 3 < src/Horarios.csv | 
    tr . \\t | 
    sed -e 's/"//g' | 
    cut -f 1 | 
    sort --numeric-sort | 
    uniq -c | 
    sed 's/^[^0-9]*//g' | 
    awk '{print $2,$1}' | 
    sort --numeric-sort |
    tr ' ' ',' > output/Q1_Ano.csv
