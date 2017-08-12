
##################################################################################
#					REGRESSÃO LINEAR
##################################################################################

#CRIANDO OS DADOS UTILIZADOS
# Um pesquisador está preocupado em avaliar a disponibilidade de artrópodes na floresta
# em que ele realiza a sua pesquisa. Esse pesquisador tem a hipótese de que a proporção
# de cobertura florestal é determinante para a abundância de artrópodes.
# Para testar a sua hipótese, o pesquisador avaliou a proporção de cobertura florestal 
# e a densidade de artrópodes em 20 pontos amostrados aleatoriamente.
# Esse pesquisador então, optou por uma análise de regressão linear, para 
# 

#----------------------------------------------------------------------------------
#					CRIANDO OS DADDOS
#----------------------------------------------------------------------------------
#Dados de cobertura florestal

cober<-as.vector(cbind(5.3,
3.2,
14.5,
12.4,
17.3,
18.9,
20.1,
21.2,
21.4,
24.2,
24.2,
24,
24.9,
26.2,
27,
27.3,
28.2,
27.6,
29,
29.8))

#Dados de densidade de artropodes
dens<-as.vector(cbind(189,
159,
475,
302,
476,
581,
629,
639,
572,
714,
702,
684,
677,
858,
831,
741,
867,
930,
883,
874))

#armazenando os dados em um data frame
cobertura<-as.data.frame(cbind(cober,dens))

#----------------------------------------------------------------------------------
#					EXPLORANDO OS DADDOS
#----------------------------------------------------------------------------------
summary(cobertura)
plot(dens~cober)

#----------------------------------------------------------------------------------
#					REGRESSÃO LINEAR
#----------------------------------------------------------------------------------

reg<-lm(dens~cober)
anova(reg)
summary(reg)
#PRONTO! Terminamos a análise de regressão linear!

#----------------------------------------------------------------------------------
#					VAMOS TRABALHAR ISSO MELHOR?
#----------------------------------------------------------------------------------

#DENSIDADE ESPERADA
lm(dens~cober)


#Calculando os valores esperados na mão!

###	densidade.esperada=a+b*x
densidade.esperada<- 16.87+29.17*cober
lines(cober,16.87+29.17*cober,lwd=2,lty=2)

### Vamos deixar o R fazer o nosso trabalho agora!
predict(reg)
abline(reg,lwd=2,lty=3,col="red")

cobertura$predict<-predict(reg)


#QUANTO OS DADOS REAIS DIFEREM DO MODELO GERADO?
cobertura$diferença<-dens-cobertura$predict
cobertura


summary(cobertura$diferença)
#Esses valores lembram alguma coisa?


summary(reg)
#


#Adicionando alguma incerteza!
preds<-predict(reg,interval="confidence")
preds
abline(reg)
lines(cober, preds[ ,3], lty = 'dashed', col = 'red')
lines(cober, preds[ ,2], lty = 'dashed', col = 'red')

resultado<-as.data.frame(cbind(cobertura,preds))



#Calculando o valor de R-quadrado na mão

a<-cobertura$predict-(mean(cobertura$predict))
b<-cobertura$dens-(mean(cobertura$dens))


Rvalue=sum(a^2)/sum(b^2)


#Calculando o valor de F
anova(reg)

#obtendo o valor da soma dos quadrados (Sum Sq)
sum(a^2)+sum(b^2)/(sum(b^2)/20)

#obtendo o valor da soma dos quadrados residuais(Sum Sq)
#soma dos residuos ao quadrado dividido pelo tamanho amostral! 
sum(b^2)/20

#obtendo o valor da soma do F
c<-sum(a^2)+sum(b^2)/(sum(b^2)/20)
d<-sum(b^2)/20

Fvalor=c/(d/18)
Fvalor


#####################################################################################
#					OUTRO EXEMPLO
#####################################################################################

temperatura<- c(2,3,4,20,2) 
atividade<-c(3,2,1,40,4) 
regress<-lm(atividade~temperatura) 
summary(regress) 
sum(regress$residuals)
plot(temperatura,atividade)

#ativ.esti<-a+b*temperatura 
ativ.esti<- -3.23+2.135*temperatura 



points(temperatura,ativ.esti, pch=8,col="red")

lines(temperatura,-3.23+2.135*temperatura) 

abline(regress, col="blue",lwd=2, lty=2)

regress2<-lm(atividade[-4]~temperatura[-4])

plot(atividade[-4]~temperatura[-4])


