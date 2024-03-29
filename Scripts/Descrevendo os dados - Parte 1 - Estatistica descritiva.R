#=============================================================================#
#     title: "Descrevendo os dados - Parte 1 - Estatistica descritiva"	      #
#                    author: "Gabriel Santos"                                 #	
#=============================================================================#

## Estat�stica descritiva	

### Introdu��o	

#### Vamos come�ar por uma defini��o mais formal:	
##### O que a Wikipedia tem a nos dizer sobre a Estatistica descritiva?	
#A estat�stica descritiva � um ramo da estat�stica que aplica v�rias t�cnicas para descrever e sumarizar um conjunto de dados. Diferencia-se da estat�stica inferencial, ou estat�stica indutiva, pelo objectivo: organizar, sumarizar dados ao inv�s de usar os dados em aprendizado sobre a popula��o. Esse princ�pio faz da estat�stica descritiva independente.	

#Algumas medidas que s�o normalmente usadas para descrever um conjunto de dados s�o medidas de tend�ncia central e medidas de variabilidade ou dispers�o. Medidas de tend�ncia central incluem m�dia,mediana e moda. Medidas de variabilidade incluem desvio padr�o,vari�ncia, o valor m�ximo e m�nimo, obliquidade e curtose.	

#### OK, agora com outras palavras:	
#As vezes pode at� parecer complicado, mas n�o precisa se preocupar, toda essa parte descritiva voc� pratica diariamente dividindo uma conta de bar, a conta da pizza com os amigos. Muitas vezes voc� faz isso intuitivamente, ao falar que uma esp�cie � maior que a outra, comparando a altura das pessoas em paises diferentes. A gente at� vai dar uma complicada nisso, mas se voc� focar em comparar dois grupos distintos, como por exemplo, duas esp�cies, dois grupos de pacientes ou pessoas de outros paises vc vai conseguir visualizar tudo que vamos tentar fazer aqui.	



### Vamos colocar a m�o na massa (de dados)	

####  Exemplo	

#Primeiro vamos criar um exemplo hip�t�tico.	

#Nesse exemplo, vamos criar um objeto ``x`` que vai conter 20 n�meros aleat�rios	


x<-c(1,25,32,41,57,62,71,1,10,35,42,11,37,82,91,1)	
# Lembrando que:	
#  "x" � o objeto que vai armazenar todos esses n�meros	
#  "c" � a fun��o para agrupar v�rias informa��es	


x	


#A estatistica descritiva n�o tem nenhum segredo e vai ser bem parecida com o Excel nesse ponto. Basicamente voc� s� precisa dizer o que voc� quer fazer e inserir qual o conjunto de dados alvo da a��o.	



#### Media	

mean(x)	




#### Mediana	

median(x)	


####	Valor Maximo	

max(x)	


#### Minimo	

min(x)	


#### Vari�ncia	

var(x)	


#### Desvio padr�o.	



sd(x)	



#Por defini��o estat�stica, o Desvio padr�o � a raiz quadrada da vari�ncia. 	


#Horas, se sabendo que a vari�ncia pode ser calculada pela fun��o ``var()`` e que a raiz quadrada pode ser calculada pela fun��o ``sqrt()`` (abrevia��o para *square root*) ent�o basta apenas criarmos uma fun��o dentro da outra para chegar ao resultado que queremos. Vamos testar!	
  
  
  sqrt(var(x))	

#Agrupar uma ou mais fun��es dentro de um �nico comando � algo bem comum, mas quando estamos come�ando pode se tornar um pouco confuso mesmo, dessa forma, uma sugest�o seria fazer o mesmo comando passo a passo.	


#Ou seja, primeiro avaliamos a vari�ncia e armazenamos o resultado dentro de um obeto e em seguida executamos a fun��o da raiz quadrada no objeto que criamos.	


variancia<-var(x)	
# Armazenamos o valor da fun��o "var" dentro do objeto chamado "variancia"	

sqrt(variancia)	


#Compare agora as 3 diferentes formas que utilizamos para calcular o desvio padr�o	

sd(x)	
sqrt(var(x))	
sqrt(variancia)	



#### Moda e erro padr�o	
#Curiosamente  o R n�o possui no seu pacote b�sico fun��es para avaliar essas medidas, mas podemos fazer tudo isso facilmente. Vamos come�ar pelo erro padr�o.	

#### Erro padr�o	

#Bom, sabemos que a formula para calcular o Erro padr�o da m�dia (ou *Stardard error*, em ingl�s) (![equation](https://latex.codecogs.com/gif.latex?$SE_{\bar{x}}$)) do nosso objeto ``x`` � o desvio padr�o, obtido com a fun��o ``sd()`` e representado pela letra sigma (![equation](https://latex.codecogs.com/gif.latex?\sigma)), dividido pela raiz quadrada do tamanho amostral ``n``, ou seja: (![equation](https://latex.codecogs.com/gif.latex?\frac{\sigma}{\sqrt{n}})). Logo, podemos juntar todas essas informa��es em uma �nica equa��o e teremos:	
  
#Nesse caso vamos utilizar o seguinte comando no R:	
  
  sd(x)/sqrt(length(x))	

#### MODA	
#Diferente das demais fun��es, a Moda n�o est� dispon�vel na fun��o b�sica do R e apesar de podermos cri�-la, ser� mais pr�tica utilizarmos um uma extens�o (*pacote*) do R de algu�m que j� criou isso. Vamos utilizar o pacote "modeest" e para instal�-lo vamos utilizar a fun��o ``install.packages()``. Mais uma vez � s� copiar e colar a fun��o no seu R. 	

install.packages("modeest")	


# Vai aparecer uma caixa com uma lista de paises (*Cran mirror*). Esses s�o os lugares onde voc� pode baixar o pacote do seu interesse. Pode escolher o Brasil, ou qualquer outro pa�s. A escolha pode ser baseada no pa�s que voc� tem mais vontade de viajar.	


library(modeest)	


#Existem diversas fun��es no pacote `modeest`, mas a �nica fun��o que vai nos interessar no momento � a fun��o `mfv()` (que n�o significa nada mais do que *Most frequently value*, viu que simples?). Vamos us�-la.	


mfv(x)	
#lembrando que x � o conjunto de valores que criamos	




#### Resumindo tudo	
#Algumas vezes precisamos de um conjunto de medidas descritivas de uma mesma vari�vel, nesse caso a fun��o ``summary()`` resolve o nosso problema. 	

#Essa fun��o � bem gen�rica e pode tanto nos dar as medidas descritivas de uma vari�vel de nosso interesse, quanto os resultados de uma an�lise complexa. Ainda vamos utilizar muito essa fun��o, ent�o voc� vai acabar decorando ela. 	

#A fun��o ``summary()`` retorna automaticamente os valores m�nimo, m�ximo, m�dia e mediana, al�m dos valores de 2� e 3� Quartil, que s�o os valores utilizados para fazer gr�ficos do tipo boxplot. Em breve vamos entrar nesse assunto novamente.	


summary(x)	


### Exemplo 2	

#Vamos trabalhar um outro conjunto de dados agora.	

#Imaginemos que estamos trabalhando com duas classes do curso de ci�ncias biol�gicas. Um curso diurno e ou curso noturno.	
#Os dados dos nossos alunos est� no arquivo "Alunos Idades.txt", o arquivo est� dispon�vel no link:	
  
  - "https://github.com/Ecosantos/Desenho-amostral-UERJ/blob/master/Dados/Alunos%20idade.txt"	

#Temos 10 alunos em cada turma com as seguintes idades:	
  
  
  
  
  Idades<-read.table(file.choose(),header=T)	
#Ir� abrir uma janela para voc� escolher o arquivo do seu interesse.	
#Escolha o arquivo "Alunos idade.txt"	


#Abra o objeto o objeto que cont�m o conjunto de dados que acabamos de importar	


Idades	

#Perceba que temos um conjunto de dados bem simples, com duas colunas *Diurno* e *Noturno* e uma s�rie de idade dos alunos em cada turma.	

#Antes que possamos come�ar a trabalhar com os dados, � necess�rio informarmos ao R que todos os valores na coluna *Diurno* referem-se a idade dos alunos nessa turma e o mesmo para a coluna de idades da turma *Noturno*. O comando para isso � `attach()`	 

attach(Idades)	


#Agora vamos observar as mesmas m�tricas que j� haviamos aprendido	

mean(Idades$Diurno)	
mean(Idades$Noturno)	

median(Idades$Diurno)	
median(Idades$Noturno)	

max(Idades$Diurno)	
max(Idades$Noturno)	

min(Idades$Diurno)	
min(Idades$Noturno)	

var(Idades$Diurno)	
var(Idades$Noturno)	

sd(Idades$Diurno)	
sd(Idades$Noturno)	



#Agora vamos elaborar os gr�ficos para poder visualizar melhor o padr�o dos dados.Para isso, vamos salvar as m�dias e medianas em objetos distintos para utilizarmos como marca��o.	



#DIURNO	

#M�dia 	
MediaDiurna<-mean(Idades$Diurno)	
#Mediana 	
MedianaDiurna<-median(Idades$Diurno)	

#NOTURNO	
#M�dia 	
MediaNoturna<-mean(Idades$Noturno)	
#Mediana 	
MedianaNoturna<-median(Idades$Noturno)	




hist(Idades$Diurno,col="yellow")	
#Agora adicionamos as marca��es da m�dia e da mediana	
abline(v=MediaDiurna, col="red")	
abline(v=MedianaDiurna, col="orange")	



hist(Idades$Noturno,col="green")	
#Agora adicionamos as marca��es da m�dia e da mediana	
abline(v=MediaNoturna, col="blue")	
abline(v=MedianaNoturna, col="pink")	


#Podemos juntar os gr�ficos para ficar mais f�cil visualizar as informa��es.	
#Para isso iremos utilizar o comando `par(mfrow=c(n�mero de gr�ficos na vertical, n�mero de gr�ficos na horizontal))`	

par(mfrow=c(1,2))	
hist(Idades$Diurno,col="yellow")	
abline(v=MediaDiurna, col="red")	
abline(v=MedianaDiurna, col="orange")	
hist(Idades$Noturno,col="green")	
abline(v=MediaNoturna, col="blue")	
abline(v=MedianaNoturna, col="pink")	


#Outra forma de apresentarmos os dados � utilizando o boxplot	

boxplot(Idades,col="grey70")	





### Exemplo 3	

#Provavelmente o conselho de �tica n�o aprovaria, mas vamos trabalhar com dados referentes aos passageiro do Titanic.	

#Os dados est�o dospon�veis no link	
#https://github.com/Ecosantos/Desenho-amostral-UERJ/blob/master/Dados/Titanic.txt	

# Para esse conjunto de dados temos 5 colunas:	
 # Classe dos passageiros: 1�, 2� e 3� Classe;	
# Sobrevivente: Passageiro conseguiu sobreviver? Sim=1 N�o=0	
# Sexo do passageiro: Homem(H)/Mulher(M)	
# Idade do passageiro (em anos)	
# Nome dos passageiros	


#Por�m para a essa aula vamos utilizar apenas a idade dos passageiros	

#Existem in�meras formas de abrir uma planila no R e vamos trabalhar algumas dessas formas nas pr�ximas aulas. Como agora esse n�o � o foco da aula, vamos buscar o arquivo direto da internet copiando e colando o comando:	
  
  require(RCurl);Titanic1<-read.table(text=getURL(	
    "https://raw.githubusercontent.com/Ecosantos/Desenho-amostral-UERJ/master/Dados/Titanic.txt"),header=T)	

Titanic<-Titanic1$Idade	





mean(Titanic)	
median(Titanic)	
max(Titanic)	
min(Titanic)	
summary(Titanic)	


#Experimente visualizar os dados completto	

Titanic1	
