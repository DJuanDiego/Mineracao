#/BIN/BASH
#
# Limpeza de dados da BBC.

# Escrito por Juan Diego - Lajes/RN -> 25/07/2019

# Script criado para a realização de limpeza de dados fornecidos  
# pelo professor com o intuito de aprender e aplicar técnicas como
# remoção, substituição e inserção de dados em um determinado 
# conjunto de dados sem comprometê-lo ou enviesar os resultados.
# Exercício da turma de mineração de dados 2019.1 - UFERSA/Angicos.


# Certifique-se de que o arquivo possui o mesmo nome utilizado no 
# comando e que o script e o arquivo estão no mesmo diretório.

echo -e 'Timestamp,How many hours did you sleep last night?,Recognition Score,Temporal Memory Score' > BBC_Results.csv

# Revela as linhas que possuem entradas não numéricas e a sua 
# quantidade.
cat BBC\ Results\ -\ Lesson\ 1.csv \
| egrep [[:alpha:]] \
| nl

# Por representarem menos de 0,066% (6/9156) de todos os dados do 
# conjunto esses dados foram descartados. Com o comando abaixo:

cat BBC\ Results\ -\ Lesson\ 1.csv \
| egrep -v [[:alpha:]] >> BBC_Results.csv

# Os valores das duas últimas colunas variam entre 0 e 100, logo os
# todas as entradas acima de 100 são substituídas pelo valor máximo.

# Linhas com valores acima de 100
cat BBC_Results.csv \
| egrep 1'[0-9][1-9]' \
| egrep -v '100'

# Substituição dos valores:
sed -i -E 's/(1[0-9][0-9])/100/g' BBC_Results.csv

# Linhas com caracteres desnecessários ou inválidos.
cat BBC_Results.csv \
| egrep '\%|\&'

# Remoção
sed -i -E 's/%|&//g' BBC_Results.csv

# Linhas com duas entradas vazias contabilizam 59 ao todo.
cat BBC_Results.csv \
| egrep ',,'

# Todas serão preenchidas com valor 0 como convenção pois não se sabe
# os verdadeiros valores que deveriam preencher os campos.
sed -i -E 's/,,/,0,0/g' BBC_Results.csv

# Linhas que ainda possuem o último campo vazio:
cat BBC_Results.csv \
| egrep ,$

# Por representarem aproximadamente apenas 0,24% dos valores totais
# as linhas serão removidas.
sed -i -E '/,$/d' BBC_Results.csv

