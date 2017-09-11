##################################################
####                                          ####  
####  Introdução R, Módulo 1  - PARTE 2       ####
####                                          #### 
##################################################

#############################
####  FUNÇÕES E PACOTES  ####
#############################

#O R é uma linguagem de programação e não um programa estatistico.
#O que permite que ele faça as análises que queremos é que essas análises foram implementadas por outras pessoas (programadores) anteriormente 
#Existem mais de 300 pacotes disponíveis no R cada um para uma análise ou forma de análise diferente
#É isso que torna o R tão especial e versátil!


####  Para finalizar esse primeiro momento vamos instalar, abrir e rodar nosso primeiro pacote####

# para instalar um pacote precisamos utilizar a função "install.packages()"
#No caso vamos instalar o pacote "fun"

install.packages("fun")

#O pacote após instalado fica "adormecido" do computador e para ativá-lo utilizamos a função "library()"


library(fun)


#O pacote "fun" tem, dentre suas funções a função "mine_sweeper()"

#podemos utilizar a configuração padrão da função, que nesse caso pode ser apenas

mine_sweeper()
#Agora clique em algum dos quadradinhos com o botão direito e depois esquerdo do mouse!


#mas também podemos especificar como queremos que a função seja executada
mine_sweeper(width = 5, height = 5, mines = 10, text.cex = 5, cheat = FALSE, seed = NULL)

#Jogue um pouco e vá mudando um pouco a configuração para ir textando o que acontece!
#Bom proveito!

mine_sweeper(width = 5, height = 5, mines = 24, text.cex = 2, cheat = FALSE, seed = NULL)

#Tentem colocar mais bombas do que o limite tolerado e o R terá ainda uma resposta de R bem-humorada para você!
#Segue um exemplo!

mine_sweeper(width = 5, height = 5, mines = 26, text.cex = 2, cheat = FALSE, seed = NULL)

#Mas se quiser trapacear ele pode te sacanear!
mine_sweeper(width = 5, height = 5, mines = 1, text.cex = 2, cheat = TRUE, seed = NULL)

#####CONSIDERAÇÕES FINAIS! ################

#Você jamais imaginou jogar campo minado por aqui né? 
#Pois é, há coisas que só o R faz por vc, então pra que o medo?
# Ele é lindo é quer voce como amigo!
# O R surge numa tendência que tem ganhado cada vez mais força que é a ideia do open-source
#A ideia é que todos tenham acesso à programação, sejam livres para criar seus próprios comandos e modificar a vontade os comandos já existentes
#Viva a pirataria, cultura e conhecimento com livre e irrestrito acesso a todas as pessoas!!!


