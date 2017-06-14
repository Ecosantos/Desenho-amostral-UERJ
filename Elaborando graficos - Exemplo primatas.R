#####################################################################
#####                 Elaborando gráficos no R            ###########
#####################################################################

#Antes de começarmos a elaborar os gráficos no R
#precisamos possuir e informar ao R quais são os dados que 
#desejamos colocar nos gráficos!

#Informando os dados manualmente

#Criando vetores numéricos

arvores<-as.vector(cbind(20,19,17,17,19))

PrimatasAno1<-as.vector(cbind(17,18,17,18,16))

PrimatasAno2<-as.vector(cbind(22,22,22,23,21))

#armazenando esses vetores em uma única tabela

tabela1<-as.data.frame(cbind(arvores,PrimatasAno1,PrimatasAno2))


plot(arvores,PrimatasAno1,col="white",xlim=c(10,25),ylim=c(12,25))
points(arvores,PrimatasAno1,col="blue",pch=16)
points(arvores,PrimatasAno2,col="red",pch=16)


################################################################################
#			ELABORANDO O MESMO GRÁFICO DA MESMA FORMA
################################################################################


a<-read.table(file.choose(),header=T)

attach(a)

a

names(a)



a$Ano<-factor(a$Ano,
              levels=c("1991","1992"))

summary(a)



boxplot(a$Primatas~a$Ano, cex=1.5,border="black",ylab="Variável Y")

boxplot(a$Primatas~a$Ano, cex=1.5,border="white",ylab="Numero de primatas")

points(jitter(as.numeric(a$Ano),factor=1),a$Primatas,col="red",pch=20)
