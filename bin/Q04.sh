#!/bin/bash
#
# Criado por Juan Diego em 27/06/2020
#
# Retorna as disciplinas que não obedecem a resolução dos horários estabelecidos pelo CONSEPE em 2007.

# Vezes em que foram cadastradas disciplinas que não seguem a convenção de horários.
# Disciplinas cadastradas nos sábados e domingos.
#sed 's/","/"\t"/g' < src/Horarios.csv | 
#    egrep '7(M|T|N)|1(M|T|N)' |
#    egrep -v '([^0-9])$'
#    sort # > output/Q4.csv

# Disciplinas de 30 horas que não seguem a convenção
sed 's/","/\t/g' < src/Horarios.csv | 
    cut -f 5-7 | 
    sed 's/(.*)$//g' | 
    egrep '30' | 
    egrep -v '(2|4)(M|N|T)12|2(M|T|N)34|5(M|T|N)12|(3|6)(M|T|N)12|3(M|N|T)34|5(M|N|T)12|(4|6)(M|N|T)34|([^0-9])$' > output/Q4_Disc.csv

# Disciplinas de 45 horas que não seguem a convenção
sed 's/","/\t/g' < src/Horarios.csv | 
    cut -f 5-7 | 
    sed 's/(.*)$//g' | 
    egrep '\s45\s' | 
    egrep -v '(2|3)((M|T)345|N234)|([^0-9])$' >> output/Q4_Disc.csv

# Disciplinas de 60 horas que não seguem a convenção
sed 's/","/\t/g' < src/Horarios.csv | 
    cut -f 5-7 | 
    sed 's/(.*)$//g' | 
    egrep '\s60\s' | 
    egrep -v '24(M|N|T)12|2(M|T|N)34 5(M|T|N)12|36(M|T|N)12|3(M|N|T)34 5(M|N|T)12|46(M|N|T)34|([^0-9])$' >> output/Q4_Disc.csv

# Disciplinas de 75 horas que não seguem a convenção
sed 's/","/\t/g' < src/Horarios.csv | 
    cut -f 5-7 | 
    sed 's/(.*)$//g' | 
    egrep '\s75\s' | 
    egrep -v '(2|3)((M|T)345|N234) [2-6]{1}((M|T)[1-4]{2}|N[1-4]{2})|([^0-9])$' >> output/Q4_Disc.csv
    
# Não há clareza quanto as disciplinas de 90h na convenção
# sed 's/","/\t/g' < src/Horarios.csv | cut -f 5-7 | sed 's/(.*)$//g' | 
# egrep '\s90\s' | grep -v '\t-\t' | egrep '23(M|T)345|N234)' |

# Disciplinas com mais de 90h ou menos de 30h
sed 's/","/\t/g' < src/Horarios.csv | 
    cut -f 5-7 | 
    sed 's/(.*)$//g' | 
    egrep -v '\s(30|45|60|75|90)\s|([^0-9])$' >> output/Q4_Disc.csv


# As disciplinas que mais desrespeitaram a convenção
sort < output/Q4_Disc.csv | 
    uniq -c |
    sort --numeric-sort > output/Q4_Disc_Fora.csv

# Os professores dessas disciplinas

