# Barrier Options Project 
# Group 3
# Kyle Nunn, Omoyeni Ogundipe, Taofeekat Adeniyi


# Import necessary libraries   
library(derivmkts)
library(ggplot2)

s= 111.41
k = 120
tt = 0.55
v = 0.6156
d = 0
H = 100
r = 0.12

#Ordinary call value
call<-binomopt(s, k, v, r, tt, d,nstep=8, american = FALSE,putopt = FALSE)
call

#Ordinary put value
put<-binomopt(s, k, v, r, tt, d,nstep=8,american = FALSE,putopt = TRUE)
put



# Call and Put Knock-Out and Knock-in Up and Down Options
callupin(s, k, v, r, tt, d, H)
callupout(s, k, v, r, tt, d, H)
putupin(s, k, v, r, tt, d, H)
putupout(s, k, v, r, tt, d, H)
calldownin(s, k, v, r, tt, d, H)
calldownout(s, k, v, r, tt, d, H)
putdownin(s, k, v, r, tt, d, H)
putdownout(s, k, v, r, tt, d, H)



#Barrier options value for different a set of different strike prices but same time to maturity
stock_prices<-c(111.41,111.41,111.41,111.41,111.41,111.41,111.41)
stock_prices

k<- c(90,95,100,105,110,115,120)
k

v<- c(0.6156,0.5978,0.5811,0.5684,0.5543,0.5428,0.5321)
v

r<- c(0.12,0.12,0.12,0.12,0.12,0.12,0.12,0.12,0.12,0.12)
r

tt<- c(0.55,0.55,0.55,0.55,0.55,0.55,0.55)
tt

d<- c(0,0,0,0,0,0,0)
d

H<- c(120,120,120,120,120,120,120)
H


#ORDINARY CALL AND PUT OPTION VALUE
call <- numeric(7)
for (i in 1:7) {
  call[i] <-binomopt (stock_prices[i], k[i], v[i], r[i], tt[i], d[i], nstep=8, american = FALSE, putopt = FALSE)
}
call

put <- numeric(7)
for (i in 1:7) {
  put[i] <-binomopt (stock_prices[i], k[i], v[i], r[i], tt[i], d[i], nstep=8, american = FALSE, putopt = TRUE)
}
put

# CALL KNOCK-IN OPTION
#Call up and in 
call_up_and_in <- numeric(7)
for (i in 1:7) {
  call_up_and_in[i] <- callupin(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
call_up_and_in

# Call down and in
call_down_and_in <- numeric(7)
for (i in 1:7) {
  call_down_and_in[i] <- calldownin(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
call_down_and_in

# CALL KNOCK-OUT OPTION
# Call up and out
call_up_and_out <- numeric(7)
for (i in 1:7) {
  call_up_and_out[i] <- callupout(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
call_up_and_out


#Call down and out
call_down_and_out <- numeric(7)
for (i in 1:7) {
  call_down_and_out[i] <- calldownout(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
call_down_and_out



#PUT KNOCK-IN OPTION
#Put up and in 
put_up_and_in <- numeric(7)
for (i in 1:7) {
  put_up_and_in[i] <- putupin(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
put_up_and_in


#Put down and in 
put_down_and_in <- numeric(7)
for (i in 1:7) {
  put_down_and_in[i] <- putdownin(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
put_down_and_in

#PUT KNOCK-OUT OPTION
#Put up and out 
put_up_and_out <- numeric(7)
for (i in 1:7) {
  put_up_and_out[i] <- putupout(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
put_up_and_out



#Put down and out 
put_down_and_out <- numeric(7)
for (i in 1:7) {
  put_down_and_out[i] <- putdownout(stock_prices[i], k[i], v[i], r[i], tt[i], d[i], H[i])
}
put_down_and_out


#combine the results to a table
table<-data.frame(cbind(stock_prices,k,call, put, call_up_and_in, call_down_and_in,call_up_and_out, 
                        call_down_and_out,put_up_and_in, put_down_and_in,
                        put_up_and_out, put_down_and_out))
table

      
  
#download the table as a csv file
write.csv(table, file = "barrier_output.csv")
