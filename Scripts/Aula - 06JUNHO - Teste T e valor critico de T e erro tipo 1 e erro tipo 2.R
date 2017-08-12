#=========================================================================
#			AULA 1 - Distribuições e valores críticos
#=========================================================================

#AINDA UTILIZANDOS OS DADOS REFERENTE ÀS ALTURAS AMOSTRADAS
tamanho<-read.table(file.choose(),header=T)
attach(tamanho)


tamanho<-as.data.frame(tamanho)
attach(tamanho)

medSex<-tapply(tamanho$alturas,tamanho$sexo,mean)

difOBS<-medSex["H"]-medSex["M"]

sample(tamanho$alturas)

difOBS<-medSex["H"]-medSex["M"]

sample(tamanho$alturas)

mediasaleat<-tapply(sample(tamanho$alturas),tamanho$sexo,mean)

mediasaleat["H"]-mediasaleat["M"]

diff(mediasaleat)
diff(medSex)


########	MODIFICAÇÃO DA FUNÇÃO DIFF (para inversão de sinal)	##########

edit(diff.default)

dif<-function (x, lag = 1, differences = 1, ...) {
    ismat <- is.matrix(x)
    xlen <- if (ismat) 
        dim(x)[1]
    else length(x)
    if (length(lag) > 1 || length(differences) > 1 || lag < 
        1 || differences < 1) 
        stop("Putz! Errei na primeira parte!!!")
    if (lag * differences >= xlen) 
        return(x[0])
    r <- unclass(x)
    i1 <- -1:-lag
    if (ismat) 
        for (i in 1:differences) r <-  
            r[-nrow(r):-(nrow(r) - lag + 1L), , drop = FALSE] - r[i1, , drop = FALSE]
    else for (i in 1:differences) r <- r[-length(r):-(length(r) - lag + 1)] - r[i1]
    class(r) <- oldClass(x)
    r
}

################			TERMINO DA FUNÇÃO				############


dif(mediasaleat)
diff(mediasaleat)


dif(tapply(sample(tamanho$alturas), tamanho$sexo,mean))

difPERMU<- replicate(100, dif(tapply(sample(tamanho$alturas),
tamanho$sexo,mean)))

difPERMU

length(which(difPERMU>=difOBS))

sort(difPERMU)

length(which(abs(difPERMU)>abs(difOBS)))




#=========================================================================
#			AULA 2/PARTE1- TESTE T 
#=========================================================================


#comparando os gráficos gerados nas ultimas aulas com a diferenças existentes

#distribuição de diferenças geradas por aleatorização 
hist(difPERMU,col="green",xlim=c(-15,20)) 
abline(v=mean(difPERMU),col="blue",lty=2,ltw=2,lwd=2)


#PARES DE ALTURAS FORAM COMPARADAS ALEATORIAMENTE, PORÉM SEMPRE ENTRE HOMENS E MULHERES!
difpair<-cbind(-5,
9,
7,
19,
13)


#distribuição das diferenças comparadas entre pares aleatórios (porém sempre entre homens e mulheres)
hist(difpair,add=T,col="yellow")
abline(v=difOBS,col="red",lty=2,lwd=2)

#Quantidade de valores de difPERMU acima de difOBS
length(which(abs(difPERMU)>abs(difOBS)))


######################################################################
######################		teste T	############################
######################################################################

#realizando a análise de Teste-T na mão
round((difOBS-0)/((5.03 + 4.76)/sqrt(length(tamanho$alturas))),3)


#utilizando a função t.test, disponível no default do R

p.obs<-t.test(tamanho$alturas~ tamanho$sexo)

p.obs$p.value
p.obs$estimate
p.obs$null.value

p.obs

#=========================================================================================
#			AULA 2/PARTE2 - ERROS TIPO 1 E ERROS TIPO 2
#=========================================================================================

#Podemos também simular valores de T e compará-los com as diferenças obtidas
#a partir de diversas aleatorizações.

#simulando valores de T
tsPERMU = replicate(100,t.test(sample(tamanho$alturas)~ tamanho$sexo)$statistic)

#plotando valores de T
hist(tsPERMU,col="grey90",xlim=c(-5,5))

#perceba que, assim como a difPERMU, os valores de teste.t também giram
# em torno de 0

#guardando apenas o valor de T do teste T da nossa amostragem
tsOBS<-t.test(tamanho$alturas~ tamanho$sexo,alternative="greater")$statistic


abline(v=tsOBS,lty=2,col="red",lwd=1)

length(which(tsPERMU>=tsOBS))

#E se o ponto de corte fosse alfa=0.1
a<-abs(qt(0.01, 10))

#E se o ponto de corte fosse alfa=0.1
b<-abs(qt(0.001, 10))


#E se o ponto de corte fosse alfa=0.1
d<-abs(qt(0.20, 10))

#E se o ponto de corte fosse alfa=0.1
e<-abs(qt(0.50, 10))


abline(v=c(a,b,c,d,e),col="lightpink",lwd=2)


help(col)

#Calcula o valor crítico de diferença na distribuição para (alfa e N)
qt(.95, df = c(1:10,20,50,100,1000))
qt(.975, df = c(1:10,20,50,100,1000))
qt(.999, df = c(1:10,20,50,100,1000))




#=========================================================================================
#			OUTROS PONTOS DE INTERESSE
#=========================================================================================
tvalue<-t.test(tamanho$alturas~ tamanho$sexo)$statistic

p.obs<-t.test(tamanho$alturas~tamanho$sexo)

t.test(tamanho$alturas~tamanho$sexo,alternative="greater")
t.test(tamanho$alturas~tamanho$sexo,alternative="less")



help(t.test)

replicate(100,t.test(sample(tamanho$alturas)~ tamanho$sexo))

p.aleat<-replicate(100,t.test(sample(tamanho$alturas)~ tamanho$sexo)[[3]])

hist(p.aleat) 
 length(which(p.aleat<0.05))
 
 length(which(p.aleat<0.1)) 

 length(which(p.aleat<0.2)) 


boxplot(tamanho$altura~as.factor(tamanho$sexo), ylab="Altura (cm)", xlab="Sexo")
points(tamanho$altura~as.factor(tamanho$sexo), ylab="Altura (cm)", xlab="Sexo",pch=5,cex=2)



