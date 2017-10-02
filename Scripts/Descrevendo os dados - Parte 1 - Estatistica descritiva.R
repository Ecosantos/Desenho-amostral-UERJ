#=============================================================================#
#     title: "Descrevendo os dados - Parte 1 - Estatistica descritiva"	      #
#                    author: "Gabriel Santos"                                 #	
#=============================================================================#

## Estatística descritiva	

### Introdução	

#### Vamos começar por uma definição mais formal:	
##### O que a Wikipedia tem a nos dizer sobre a Estatistica descritiva?	
#A estatística descritiva é um ramo da estatística que aplica várias técnicas para descrever e sumarizar um conjunto de dados. Diferencia-se da estatística inferencial, ou estatística indutiva, pelo objectivo: organizar, sumarizar dados ao invés de usar os dados em aprendizado sobre a população. Esse princípio faz da estatística descritiva independente.	

#Algumas medidas que são normalmente usadas para descrever um conjunto de dados são medidas de tendência central e medidas de variabilidade ou dispersão. Medidas de tendência central incluem média,mediana e moda. Medidas de variabilidade incluem desvio padrão,variância, o valor máximo e mínimo, obliquidade e curtose.	

#### OK, agora com outras palavras:	
#As vezes pode até parecer complicado, mas não precisa se preocupar, toda essa parte descritiva você pratica diariamente dividindo uma conta de bar, a conta da pizza com os amigos. Muitas vezes você faz isso intuitivamente, ao falar que uma espécie é maior que a outra, comparando a altura das pessoas em paises diferentes. A gente até vai dar uma complicada nisso, mas se você focar em comparar dois grupos distintos, como por exemplo, duas espécies, dois grupos de pacientes ou pessoas de outros paises vc vai conseguir visualizar tudo que vamos tentar fazer aqui.	



### Vamos colocar a mão na massa (de dados)	

####  Exemplo	

#Primeiro vamos criar um exemplo hipótético.	

#Nesse exemplo, vamos criar um objeto ``x`` que vai conter 20 números aleatórios	


x<-c(1,25,32,41,57,62,71,1,10,35,42,11,37,82,91,1)	
# Lembrando que:	
#  "x" é o objeto que vai armazenar todos esses números	
#  "c" é a função para agrupar várias informações	


x	


#A estatistica descritiva não tem nenhum segredo e vai ser bem parecida com o Excel nesse ponto. Basicamente você só precisa dizer o que você quer fazer e inserir qual o conjunto de dados alvo da ação.	



#### Media	

mean(x)	




#### Mediana	

median(x)	


####	Valor Maximo	

max(x)	


#### Minimo	

min(x)	


#### Variância	

var(x)	


#### Desvio padrão.	



sd(x)	



#Por definição estatística, o Desvio padrão é a raiz quadrada da variância. 	


#Horas, se sabendo que a variância pode ser calculada pela função ``var()`` e que a raiz quadrada pode ser calculada pela função ``sqrt()`` (abreviação para *square root*) então basta apenas criarmos uma função dentro da outra para chegar ao resultado que queremos. Vamos testar!	
  
  
  sqrt(var(x))	

#Agrupar uma ou mais funções dentro de um único comando é algo bem comum, mas quando estamos começando pode se tornar um pouco confuso mesmo, dessa forma, uma sugestão seria fazer o mesmo comando passo a passo.	


#Ou seja, primeiro avaliamos a variância e armazenamos o resultado dentro de um obeto e em seguida executamos a função da raiz quadrada no objeto que criamos.	


variancia<-var(x)	
# Armazenamos o valor da função "var" dentro do objeto chamado "variancia"	

sqrt(variancia)	


#Compare agora as 3 diferentes formas que utilizamos para calcular o desvio padrão	

sd(x)	
sqrt(var(x))	
sqrt(variancia)	



#### Moda e erro padrão	
#Curiosamente  o R não possui no seu pacote básico funções para avaliar essas medidas, mas podemos fazer tudo isso facilmente. Vamos começar pelo erro padrão.	

#### Erro padrão	

#Bom, sabemos que a formula para calcular o Erro padrão da média (ou *Stardard error*, em inglês) (![equation](https://latex.codecogs.com/gif.latex?$SE_{\bar{x}}$)) do nosso objeto ``x`` é o desvio padrão, obtido com a função ``sd()`` e representado pela letra sigma (![equation](https://latex.codecogs.com/gif.latex?\sigma)), dividido pela raiz quadrada do tamanho amostral ``n``, ou seja: (![equation](https://latex.codecogs.com/gif.latex?\frac{\sigma}{\sqrt{n}})). Logo, podemos juntar todas essas informações em uma única equação e teremos:	
  
#Nesse caso vamos utilizar o seguinte comando no R:	
  
  sd(x)/sqrt(length(x))	

#### MODA	
#Diferente das demais funções, a Moda não está disponível na função básica do R e apesar de podermos criá-la, será mais prática utilizarmos um uma extensão (*pacote*) do R de alguém que já criou isso. Vamos utilizar o pacote "modeest" e para instalá-lo vamos utilizar a função ``install.packages()``. Mais uma vez é só copiar e colar a função no seu R. 	

install.packages("modeest")	


# Vai aparecer uma caixa com uma lista de paises (*Cran mirror*). Esses são os lugares onde você pode baixar o pacote do seu interesse. Pode escolher o Brasil, ou qualquer outro país. A escolha pode ser baseada no país que você tem mais vontade de viajar.	


library(modeest)	


#Existem diversas funções no pacote `modeest`, mas a única função que vai nos interessar no momento é a função `mfv()` (que não significa nada mais do que *Most frequently value*, viu que simples?). Vamos usá-la.	


mfv(x)	
#lembrando que x é o conjunto de valores que criamos	




#### Resumindo tudo	
#Algumas vezes precisamos de um conjunto de medidas descritivas de uma mesma variável, nesse caso a função ``summary()`` resolve o nosso problema. 	

#Essa função é bem genérica e pode tanto nos dar as medidas descritivas de uma variável de nosso interesse, quanto os resultados de uma análise complexa. Ainda vamos utilizar muito essa função, então você vai acabar decorando ela. 	

#A função ``summary()`` retorna automaticamente os valores mínimo, máximo, média e mediana, além dos valores de 2º e 3º Quartil, que são os valores utilizados para fazer gráficos do tipo boxplot. Em breve vamos entrar nesse assunto novamente.	


summary(x)	


### Exemplo 2	

#Vamos trabalhar um outro conjunto de dados agora.	

#Imaginemos que estamos trabalhando com duas classes do curso de ciências biológicas. Um curso diurno e ou curso noturno.	
#Os dados dos nossos alunos está no arquivo "Alunos Idades.txt", o arquivo está disponível no link:	
  
  - "https://github.com/Ecosantos/Desenho-amostral-UERJ/blob/master/Dados/Alunos%20idade.txt"	

#Temos 10 alunos em cada turma com as seguintes idades:	
  
  
  
  
  Idades<-read.table(file.choose(),header=T)	
#Irá abrir uma janela para você escolher o arquivo do seu interesse.	
#Escolha o arquivo "Alunos idade.txt"	


#Abra o objeto o objeto que contém o conjunto de dados que acabamos de importar	


Idades	

#Perceba que temos um conjunto de dados bem simples, com duas colunas *Diurno* e *Noturno* e uma série de idade dos alunos em cada turma.	

#Antes que possamos começar a trabalhar com os dados, é necessário informarmos ao R que todos os valores na coluna *Diurno* referem-se a idade dos alunos nessa turma e o mesmo para a coluna de idades da turma *Noturno*. O comando para isso é `attach()`	 

attach(Idades)	


#Agora vamos observar as mesmas métricas que já haviamos aprendido	

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



#Agora vamos elaborar os gráficos para poder visualizar melhor o padrão dos dados.Para isso, vamos salvar as médias e medianas em objetos distintos para utilizarmos como marcação.	



#DIURNO	

#Média 	
MediaDiurna<-mean(Idades$Diurno)	
#Mediana 	
MedianaDiurna<-median(Idades$Diurno)	

#NOTURNO	
#Média 	
MediaNoturna<-mean(Idades$Noturno)	
#Mediana 	
MedianaNoturna<-median(Idades$Noturno)	




hist(Idades$Diurno,col="yellow")	
#Agora adicionamos as marcações da média e da mediana	
abline(v=MediaDiurna, col="red")	
abline(v=MedianaDiurna, col="orange")	



hist(Idades$Noturno,col="green")	
#Agora adicionamos as marcações da média e da mediana	
abline(v=MediaNoturna, col="blue")	
abline(v=MedianaNoturna, col="pink")	


#Podemos juntar os gráficos para ficar mais fácil visualizar as informações.	
#Para isso iremos utilizar o comando `par(mfrow=c(número de gráficos na vertical, número de gráficos na horizontal))`	

par(mfrow=c(1,2))	
hist(Idades$Diurno,col="yellow")	
abline(v=MediaDiurna, col="red")	
abline(v=MedianaDiurna, col="orange")	
hist(Idades$Noturno,col="green")	
abline(v=MediaNoturna, col="blue")	
abline(v=MedianaNoturna, col="pink")	


#Outra forma de apresentarmos os dados é utilizando o boxplot	

boxplot(Idades,col="grey70")	





### Exemplo 3	

#Provavelmente o conselho de ética não aprovaria, mas vamos trabalhar com dados referentes aos passageiro do Titanic.	

#Os dados estão dosponíveis no link	
#https://github.com/Ecosantos/Desenho-amostral-UERJ/blob/master/Dados/Titanic.txt	

# Para esse conjunto de dados temos 5 colunas:	
 # Classe dos passageiros: 1ª, 2ª e 3ª Classe;	
# Sobrevivente: Passageiro conseguiu sobreviver? Sim=1 Não=0	
# Sexo do passageiro: Homem(H)/Mulher(M)	
# Idade do passageiro (em anos)	
# Nome dos passageiros	


#Porém para a essa aula vamos utilizar apenas a idade dos passageiros	

#Existem inúmeras formas de abrir uma planila no R e vamos trabalhar algumas dessas formas nas próximas aulas. Como agora esse não é o foco da aula, vamos buscar o arquivo direto da internet copiando e colando o comando:	
  
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
