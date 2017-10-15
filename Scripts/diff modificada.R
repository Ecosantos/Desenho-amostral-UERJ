#--------------------------------------------------------------------------------
#		FUNÇÃO DIFF MODIFICADA
#--------------------------------------------------------------------------------
#FUNÇÃO ORIGINALMENTE MODIFICADA POR Victor Lemes Landeiro e José Julio de Toledo
# Retirada da apostila de exercícios para o curso de Estatística do INPA
# Disciplina ministrada pelo professor William Magnussum


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