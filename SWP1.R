data <- read.csv("~/salaries.csv")
View(data)
summary(data)
        rank     discipline yrs.since.phd    yrs.service        sex     
 AssocProf: 64   A:181      Min.   : 1.00   Min.   : 0.00   Female: 39  
 AsstProf : 67   B:216      1st Qu.:12.00   1st Qu.: 7.00   Male  :358  
 Prof     :266              Median :21.00   Median :16.00               
                            Mean   :22.31   Mean   :17.61               
                            3rd Qu.:32.00   3rd Qu.:27.00               
                            Max.   :56.00   Max.   :60.00               
     salary      
 Min.   : 57800  
 1st Qu.: 91000  
 Median :107300  
 Mean   :113706  
 3rd Qu.:134185  
 Max.   :231545  
 
 ## 1 ## How many variables and observations are there in the data set? ==> 397 observations and 6 variables 
 ## 2 ## How many professors have more than 40 years of service? (hint: you can sum() a
logical vector) ==> 21

sum((data$yrs.service > 40) == TRUE)
 21
summary(data$yrs.service>40)
   Mode   FALSE    TRUE 
logical     376      21 

## 3 ## How many have salary larger than $150000? => 54
sum((data$salary > 150000) == TRUE)
[1] 54
summary((data$salary > 150000))
   Mode   FALSE    TRUE 
logical     343      54 

##☼ 4 ## how do you find out more about the data ?
summary(data)
        rank     discipline yrs.since.phd    yrs.service        sex     
 AssocProf: 64   A:181      Min.   : 1.00   Min.   : 0.00   Female: 39  
 AsstProf : 67   B:216      1st Qu.:12.00   1st Qu.: 7.00   Male  :358  
 Prof     :266              Median :21.00   Median :16.00               
                            Mean   :22.31   Mean   :17.61               
                            3rd Qu.:32.00   3rd Qu.:27.00               
                            Max.   :56.00   Max.   :60.00               
     salary      
 Min.   : 57800  
 1st Qu.: 91000  
 Median :107300  
 Mean   :113706  
 3rd Qu.:134185  
 Max.   :231545  
 
 ## 5 ## What are the counts of men and women by rank? The proportions? 
 
data2 <- subset(data, select = c("rank","sex"))
View(data2)
summary(subset(data2, sex == "Male"))
        rank    Prop         sex     
 AssocProf: 54  0.150838     Female:  0  
 AsstProf : 56  0.1564246    Male  :358  
 Prof     :248  0.6927374  
 
 summary(subset(data2, sex == "Female"))
        rank    Prop           sex    
 AssocProf:10    0.2564103     Female:39  
 AsstProf :11    0.2820513     Male  : 0  
 Prof     :18    0.4615385
 

## 6 ## Draw a histogram for years of service. Add a density line in red. (Hint: plot
proportions, not frequency.) 

 hist(data$yrs.service, 
     main="Histogram for years of service", 
     xlab="years of service", 
     border="blue", 
     col="green", 
     las=1, 
     breaks=5, 
     prob = TRUE)
lines(density(data$yrs.service))

## 7 ##Draw a box plot for salary

bp <- boxplot(data$salary, main = "Salary Box Plot")
str(bp)
bp$stats

## 8 ##Draw a box plot for salary by rank. Make it horizontal
==> the aim is to compare salary Vs rank
boxplot(data$salary ~ data$rank , main = "Salary Box Plot by rank" , horizontal = TRUE)

## not horizental but fancy##
library(ggplot2)
qplot(data = data, x = rank, y = salary, geom = "boxplot", fill= rank , main = "Salary Box Plot by rank")

## 9 ##Plot salary vs years since PhD 

plot(data$yrs.since.phd, data$salary, 
           main = "Does experience matter?" ,
          xlab = "years since phd",
          ylab = "Salary",
          col = "blue",
          col.main = "red",
          cex.axis = 1.2)
## 10## What is the correlation for salary vs. years since PhD and salary vs. years of service?
##statistically significant ?
cor(data$salary , data$yrs.since.phd)
[1] 0.4192311
cor(data$salary , data$yrs.service)
[1] 0.3347447

> # Check which variables in data frame are numeric
> lapply(data, class)
$rank
[1] "factor"

$discipline
[1] "factor"

$yrs.since.phd
[1] "integer"

$yrs.service
[1] "integer"

$sex
[1] "factor"

$salary
[1] "integer"

> data_numeric<-sapply(data,is.numeric)
> 
> # Correlation of them
> data_correlation<-cor(data[,data_numeric])
> print(data_correlation)
              yrs.since.phd yrs.service    salary
yrs.since.phd     1.0000000   0.9096491 0.4192311
yrs.service       0.9096491   1.0000000 0.3347447
salary            0.4192311   0.3347447 1.0000000

 # Visualize with package "corrplot"
 library("corrplot")
 corrplot(data_correlation)


## singificant ? ==> Pearson correlation test !
cor.test(data$salary , data$yrs.since.phd)

	#earson's product-moment correlation

data:  data$salary and data$yrs.since.phd
t = 9.1775, df = 395, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.3346160 0.4971402
sample estimates:
      cor 
0.4192311 

cor.test(data$salary , data$yrs.service)

	#earson's product-moment correlation

data:  data$salary and data$yrs.service
t = 7.0602, df = 395, p-value = 7.529e-12
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.2443740 0.4193506
sample estimates:
      cor 
0.3347447 

#Draw a visualization of all bivariate relationships (anyone knows this ? )
