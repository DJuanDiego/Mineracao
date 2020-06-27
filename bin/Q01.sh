#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna o número de disciplinas ofertadas pela UFERSA no período entre 2009-2019.

# Envia o valor para uma variável.
N_Disc=$(wc -l src/Horarios.csv)

# Escreve a mensagem num arquivo de texto.
echo "A Universidade ofertou $N_Disc disciplinas entre 2009 e 2019" > output/Q1.txt
