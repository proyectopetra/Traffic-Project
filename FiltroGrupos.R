DataAmpliado <- read.csv("~/DATA/Trafic-Raising/DataSets/raw_ampliado.csv",header=TRUE,stringsAsFactors=TRUE)

startTime <- min(DataAmpliado$tinicio)

getDay <- function(time,ventana){
  return (floor((time-startTime)/(3600000*ventana)))
}
DataAmpliado$dia <- getDay(DataAmpliado$tinicio,2)

DataAmpliado$tinicio <- as.POSIXct(DataAmpliado$tinicio/1000, origin="1970-01-01" )
DataAmpliado$tfin <- as.POSIXct(DataAmpliado$tfin/1000, origin="1970-01-01" )

DataAmpliado$idNodo <- as.factor(DataAmpliado$idNodo)
DataAmpliado$idDispositivo <- as.factor(DataAmpliado$idDispositivo)
DataAmpliado <- DataAmpliado[,c(-8,-9,-10)]

DataAmpliado <- DataAmpliado[order(DataAmpliado[,"latitud"]), ]

DataNodos <-  DataAmpliado[1,c(5,6,7)]
DataNodos <- DataNodos[-1,]
for (i in levels(DataAmpliado$idNodo))
{
  DataNodos[i,] <- colMeans(DataAmpliado[DataAmpliado$idNodo == i,c(5,6,7)])
}


DataAmpliado <- DataAmpliado[order(DataAmpliado[,"idDispositivo"]), ]

DataDispositivo <- data.frame(id = character(), Apariciones=integer(),  
                 stringsAsFactors=TRUE) 
currentid = 0
count = 0


summary(DataAmpliado$longitud)
plot(DataNodos$latitud,DataNodos$tdiferencia)


tabla <- table(DataAmpliado$idDispositivo,DataAmpliado$dia)
head(tabla)

head(referencia)
referencia <- apply(tabla[,], 1, max)
referencia <- data.frame(referencia)
referencia$nombres <- row.names(referencia)
referencia <- referencia[referencia$referencia > 1,]
DataReducido <- DataAmpliado[DataAmpliado$idDispositivo  %in% rownames(referencia) ,]

candidatos <- vector()
for (i in 1:dim(tabla)[2]){
  col <- ( DataAmpliado[
  (DataAmpliado$dia==i) &
  (DataAmpliado$idDispositivo  %in% rownames(tabla[tabla[,i]>1,]))  
,])
  print(paste(i," -> ",nrow(col)))
  candidatos[i] <- nrow(col)
}

plot(candidatos)


testing <- DataAmpliado[
  (DataAmpliado$dia==33) &
    (DataAmpliado$idDispositivo  %in% rownames(tabla[tabla[,33]>1,]))  &
    (DataAmpliado$tdiferencia > 100)
  ,]
testing <- testing[order(testing[,"idNodo"]), ]


compactador <- function(x){
  actual <- min(c(as.numeric(x["tinicio"]),as.numeric(x["tinicio"])))
   minimo <- min(testing[(testing$idNodo == x["idNodo"]) &(testing$idDispositivo == x["idDispositivo"] ),"tinicio"])  
  print(x)
  print(actual)
   print(paste(as.numeric(x["tinicio"]),"--min-->",as.numeric(minimo)))
  if (as.numeric(minimo) ==  as.numeric(actual))
  {
    print(paste(actual,"--min-->",minimo))
    x["tfin"] <- max(testing[(testing$idNodo == x["idNodo"])&(testing$idDispositivo == x["idDispositivo"] ),"tfin"])
    return(x)      
  }
}
compact <- apply(testing,1,compactador)
as.numeric(testing$tinicio[3])

compact <- data.frame(t(compact))

quitarRepetidos <- function(x){
  
}


head(testing,20)



head(col)


head(referencia)

for (j in 1:nrow(tabla)){
  viable = FALSE
  if (max())
}


tabla <- data.frame(tabla)

getDay(DataAmpliado$tinicio[5])
for (i in 1:100){
  print(paste(i," -> ",nrow(tabla[tabla$Freq == i,])))
}


DataAmpliado$tinicio[5]-startTime


