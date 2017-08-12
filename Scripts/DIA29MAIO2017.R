amostras=as.vector(cbind(1	,
1	,
1	,
1	,
1	,
2	,
2	,
2	,
2	,
2	,
3	,
3	,
3	,
3	,
3	,
4	,
4	,
4	,
4	,
4	,
5	,
5	,
5	,
5	,
5	,
6	,
6	,
6	,
6	,
6	,
7	,
7	,
7	,
7	,
7	,
8	,
8	,
8	,
8	,
8	,
9	,
9	,
9	,
9	,
9	,
10	,
10	,
10	,
10	,
10	,
11	,
11	,
11	,
11	,
11	,
12	,
12	,
12	,
12	,
12	,
13	,
13	,
13	,
13	,
13	,
14	,
14	,
14	,
14	,
14	,
15	,
15	,
15	,
15	,
15	,
16	,
16	,
16	,
16	,
16	,
17	,
17	,
17	,
17	,
17	,
18	,
18	,
18	,
18	,
18	,
19	,
19	,
19	,
19	,
19	,
20	,
20	,
20	,
20	,
20	,
21	,
21	,
21	,
21	,
21	,
22	,
22	,
22	,
22	,
22	,
23	,
23	,
23	,
23	,
23	,
24	,
24	,
24	,
24	,
24	,
25	,
25	,
25	,
25	,
25	,
26	,
26	,
26	,
26	,
26	,
27	,
27	,
27	,
27	,
27	,
28	,
28	,
28	,
28	,
28	,
29	,
29	,
29	,
29	,
29	,
30	,
30	,
30	,
30	,
30))


tamanho=as.vector(cbind(75	,
80	,
70	,
75	,
70	,
48	,
72	,
56	,
60	,
56	,
71	,
46	,
46	,
54	,
70	,
52	,
68	,
46	,
56	,
76	,
77	,
71	,
56	,
54	,
55	,
57	,
55	,
41	,
40	,
41	,
60	,
55	,
53	,
42	,
60	,
59	,
41	,
44	,
36	,
49	,
47	,
36	,
49	,
65	,
59	,
41	,
39	,
50	,
51	,
53	,
44	,
56	,
75	,
66	,
55	,
43	,
32	,
43	,
34	,
34	,
34	,
27	,
53	,
31	,
36	,
33	,
30	,
37	,
29	,
35	,
26	,
32	,
37	,
28	,
27	,
19	,
29	,
29	,
28	,
32	,
33	,
31	,
31	,
23	,
35	,
34	,
31	,
21	,
30	,
31	,
43	,
32	,
25	,
31	,
37	,
29	,
32	,
28	,
31	,
27	,
30	,
32	,
34	,
36	,
30	,
35	,
29	,
28	,
36	,
31	,
26	,
27	,
33	,
31	,
35	,
26	,
31	,
28	,
27	,
21	,
65	,
36	,
35	,
36	,
50	,
40	,
44	,
35	,
73	,
51	,
52	,
33	,
40	,
58	,
58	,
55	,
49	,
60	,
49	,
35	,
63	,
57	,
41	,
44	,
35	,
49	,
25	,
61	,
61	,
49))



amostra

tamanho

medias=tapply(tamanho,amostra,mean)

erro.padrao=sd(medias)


desvio.padrao=tapply(tamanho,amostra,sd)

erros.magico=desvio.padrao/sqrt(5)

sort(erros.magico) 

which(erros.magico<erro.padrao)

desvio<-tapply(tamanho,amostra,sd)

desvio.absoluto<-sum(abs(desvio))/150

desv.geral<-sd(tamanho)

erro.150<-desv.geral/sqrt(150)

aleatorio<-sample(1:150)

tam.aleat<-order(aleatorio,"tamanho")




folhas<-as.data.frame(cbind(amostra,tamanho))


folhas<-edit(folhas)

head(folhas)

attach(folhas)


medias=tapply(folhas$B,folhas$A,mean)

erro.padrao=sd(medias)

tam.aleat<-folhas[order(aleatorio),"B"]

desvio.padrao=tapply(folhas$B,folhas$A,sd)

erros.magico=desvio.padrao/sqrt(5)

edit(sort)

sort(erros.magico) 



which(erros.magico<erro.padrao)

erros.magico

desvio<-tapply(folhas$B,folhas$A,sd)

desvio.absoluto<-sum(abs(desvio))/150

desv.geral<-sd(folhas$B)

erro.150<-desv.geral/sqrt(150)

aleatorio<-sample(1:150)

tam.aleat<-order(aleatorio,"tamanho")






folhas.novo<-cbind(folhas,tam.aleat)

head(folhas.novo)

rnorm(150,mean=medias,sd=desvio.padrao)

tamanhoNOVO<-rnorm(150,mean(folhas$B),sd(folhas$B))

folhas3<-cbind(folhas,tamanhoNOVO)



#################################################

Tamanho<-read.table(file.choose(),header=T)
attach(Tamanho)


tamanho<-as.data.frame(tamanho)
attach(tamanho)

medSex<-tapply(Tamanho$alturas,Tamanho$sexo,mean)

difOBS<-medSex["H"]-medSex["M"]

sample(Tamanho$alturas)

medias<-tapply(sample(Tamanho$alturas),Tamanho$sexo,mean)

medias["H"]-medias["M"]

diff(medias)
diff(medSex)


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

dif(medias)
diff(medias)


dif(tapply(sample(Tamanho$alturas), Tamanho$sexo,mean))

difPERMU<- replicate(100, dif(tapply(sample(Tamanho$alturas),
Tamanho$sexo,mean)))

args(replicate)

difPERMU

length(which(difPERMU>=difOBS))


length(which(abs(difPERMU)>abs(difOBS)))


hist(difPERMU) 






