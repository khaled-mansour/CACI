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
 

##e 6 ## Draw a histogram for years of service. Add a density line in red. (Hint: plot
proportions, not frequency.) 
