##################################################
####                                          ####  
####  Introdução R, Módulo 1  - PARTE 1       ####
####                                          #### 
##################################################

#############################
####  COMO O R FUNCIONA  ####
#############################

##################################################

#1-O R funciona a partir da criação e manipulação de objetos
#Por isso o R também é chamado de programa "orientado ao objeto" 
#(Object oriented program)

###############################
####Mas o que é um objeto?#####
###############################

#Vamos a um exemplo

#Vamos criar um objeto. 
a=1 #Esse objeto será representado pela letra "a" e será igual ao número "1"

#Se nenhuma mensagem de erro apareceu, entÃO criamos com sucesso nosso primeiro objeto

a #ao escrever o nome do objeto todo o conteúdo dele aparecerá na tela!


#Exemplo 2

A="batata" # Agora criamos um objeto não numérico

A #Agora vamos chamar nosso segundo objeto


#percebam que apesar de ambos os objetos serem a letra "a/A"
#Agora eles representam coisas diferentes

a

A


#percebam que os objetos "a" e "A" são diferentes!
#Pois o R faz distinção entre letras maiusculas e minúsculas
#Será bom lembrarmos isso, pois é comum escrevermos errado o nome dos objetos
#Inclusive, em 90% dos casos o erro estará no nome inadequado do objeto
#Não se preocupe, teremos bastante tempo (e chances) para ver isso lá na frente!!



######     Tipos de objeto      ##########

#Existem seis diferentes tipos de objetos

#vetor
#Fatores
#Matriz
#Data frame
#funções
#lista

#Geralmente trabalhamos com Data Frames
#Apesar disso, análises mais complexas podem pedir tipos de objetos diferentes
#Por hora vamos apenas apresentar cada tipo de objeto de forma simplificada


######     VETORES!!!

###3 tipos!

##Vetores numéricos

a

##Vetores de caracteres

A

##Vetores lógicos 

#Equivalente a perguntas para o R
#São representados por TRUE, FALSE ou NA

#Exemplo

#Vamos perguntar ao R se os objetos "a" e "A" são vetores numéricos
is.numeric(a)
is.numeric(A)

#Agora vamos perguntar ao R se os objetos "a" e "A" são vetores de caracteres
is.character(a)
is.character(A)

###    MULTIPLOS VALORES/MULTIPLAS INFORMAÇÕES
#Até agora atribuimos uma única informação a um objeto
# No entanto, na maioria dos casos precisamos de inserir muitas informações em um mesmo objeto
#Esse objeto pode ser por exemplo numero de espécies registradas em áreas diferentes:


vector<-1
vector<-1,2	#Mas assim ele não funciona, então precisaremos usar a função "c"
vector<-c(1,2)

#E agora podemos colocar quanta informação quisermos
vector<-c(1,2,3,4,5,6,7,8,9)

###    FATORES
f=factor(c("baixo","médio" ,"alto","mais alto"))
f

###    MATRIZES

#Como exemplo, vamos criar uma matriz onde:
#teremos 3 linhas e duas colunas e que conteram números de 1 a 6

m1=matrix(c(1,2,3,4,5,6),3,2) # cria uma matriz

m1

m2=matrix(c(1:6),3,2) #outra possibilidade para criar a matriz

m2 #vamos chamar o objeto

m3=matrix(1:12,nrow=3) #outra possibilidade para criar a matriz

m3 #vamos chamar o objeto

#Perceba que existem várias formas de criar uma tabela
#No R é comum haver mais de uma forma para criar uma tabela, matriz ou análise
#Existem vantagens e desvantagens nesse método
#Algumas da vantagens são: 
#Vantagem 1: Quando voce não consegue fazer de uma forma pode acabar conseguindo fazer de outra forma;
#Vantagem 2: Ao se habituar com o uso do R torna-se mais fácil fazer adaptações pois é possivel combinar caracteristicas de funções diferentes


#Desvantagens: 
# a única desvantagem que eu acho é que as vezes você pode acabar se confundido pois não consegue lembrar de todas
# Mas não se preocupe, para isso existem os scripts! Vamos falar depois mas isso que vc está lendo é um script e ele é auto-executável! =)






###    DATA FRAME

#Semelhante a uma matriz, porém permite que diferentes tipos de dados 
#(numéricos e caracteres, contínuos e categóricos), fiquem juntos

df1=data.frame(coluna1=c(1,2,3),coluna2=c(4,5,6))        # cria um data frame, nesse caso só temos dados numéricos
df1

df2=data.frame(coluna1=c(1,2,3),coluna2=c(4,5,6),coluna3=factor(c("batatinha","quando","nasce"))) 
#Pronto, agora temos numeros e texto que serão tratados como categorias pelo R em um mesmo data frame!
#incusive a coluna 3 é agora uma variável categórica, então perceba que um objeto do tipo data frame pode conter linhas que são objetos de diferentes tipos.

df2

is.factor(df2$coluna3)
is.numeric(df2$coluna2)
is.vector(df2$coluna1)



###    LISTA
l <- list(Curso="Desenho Amostral", Local="UERJ", Alunos=10,Idade=c(19,23,21,22,18,21,20,20,20,25))

l

data.frame(l)
#se quisermos obter apenas uma parcela das informações podemos utilizar o simbolo ($)
#exemplo
l$Curso
l$Local
l$Alunos
l$Idade

###    FUNÇÕES
#"O vocabulário da linguagem R são as funções e comandos"
# Até o momento já utilizamos diversas funções! Todas bem lógicas e escritas em inglês
#Usamos funções para:
#criar data frames (data.frame)
#criar matrizes (matrix)
#perguntar qual o tipo de vetor estamos trabalhando (is.factor/is.numeric/is.vector)


###    FUNÇÕES
#"O vocabulário da linguagem R são as funções e comandos"
# Até o momento já utilizamos diversas funções! Todas bem lógicas e escritas em inglês
#Usamos funções para:
#criar data frames (data.frame)
#criar matrizes (matrix)
#perguntar qual o tipo de vetor estamos trabalhando (is.factor/is.numeric/is.vector)



### Exemplo de funções

#vamos criar duas funções de multipla escolha simples:
# A nossa escolha tem que primeiro ser adicionada em um vector
# então escolha o seu vetor

x<-"Sim"
x<-"Não"


#Nossa primeira pergunta é: "gosta de cachorros?"

gosta_de_gato<-function(x){					#Cria e especifica a função
if(x  ==  "Sim"){							#Se "x" for igual a "Sim"	
print("Você é uma boa pessoa!")				#Retorne essa informação
} else {								#Caso contrário
print("Não é possivel, todos gostam de gatos!")		#retorne essa informação
}
}


gosta_de_gato(x)

#Essa pessoa pode gostar de gatos, mas preferi cachorros por exemplo

x<-"cachorro"
x<-"gato"

gato_ou_cachorro<-function(x){
if(x  ==  "gato"){
print("Sério? cahorros são muito mais companheiros")
} else if (x=="cachorro"){						
print("Sério? gatos são muito mais independentes")		
} else {
print("responda a pergunta com 'cachorro' ou 'gato'")
}
}

gato_ou_cachorro(x)

.
