table<-read.csv("RussianMedals.csv", header= T)

m<-table[,2]
k<-table[,3]

freqN<-m+(m/k)-1
lfreqconf<-m/(0.975^(1/k))
hfreqconf<-m/(0.025^(1/k))

bayesN<-(m-1)*((k-1)/(k-2))
bayesSD<-sqrt(((k-1)*(m-1)*(m-k+1))/((k-3)*((k-2)^2)))
lbayesconf<-bayesN-(1.96*bayesSD)
hbayesconf<-bayesN+(1.96*bayesSD)


tableResults<-cbind(lfreqconf,freqN,hfreqconf,lbayesconf,bayesN,hbayesconf)
tableResults<-round(tableResults)
tableResults<-cbind(table,tableResults)
names(tableResults)<-c("Medal", "Highest observed number", "No. of observations","95% low frequentist estimate","Frequentist mean estimate","95% high frequentist estimate","95% low bayesian estimate","Bayesian mean estimate","95% high bayesian estimate")
write.csv(tableResults, file = "RusianMedalsProblemResults.csv")

