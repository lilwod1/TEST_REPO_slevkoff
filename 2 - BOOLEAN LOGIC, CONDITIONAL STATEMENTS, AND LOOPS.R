###############################
###PROGRAMMING FUNDAMENTALS:###
##BOOLEAN EXPRESSIONS & LOOPS##
###############################

#########################
###BOOLEAN EXPRESSIONS###
#########################

#BOOLEAN EXPRESSIONS ALLOW YOU TO CHECK LOGICAL STATEMENTS
#TO MAKE COMPARISONS BETWEEN VARIABLES.  THE OUTPUT OF A LOGICAL
#STATEMENT IS EITHER TRUE (1) OR FALSE (0).

#A BASIC IF-THEN STATEMENT
x <- 0
if (x>0){
  print("Positive Number!")
}

#A BASIC IF-THEN STATEMENT WITH ELSE CONDITION
x <- 2
if (x>0){
  print("Positive Number!")
} else {
  print("Not a Positive Number!")  
}

##AN EXAMPLE USING THE "AND" OPERATOR &&
x <- 4
if (x<=10 && x>=5){
  print("x is between 5 and 10 inclusive!")
} else {
  print("x is not between 5 and 10 inclusive!")  
}

##AN EXAMPLE USING THE "OR" OPERATOR ||
x <- 8
if (x>5 || x<2){
  print("x is either greater than 5 OR smaller than 2")
} else {
  print("x must be in between 2 and 5 incusive")  
}

########################################
##USING LOOPS TO AUTOMATE COMPUTATIONS##
########################################

###################
#####FOR LOOPS#####
###################

#"FOR" LOOPS ARE APPROPRIATE FOR REPETITIVE COMPUTATIONS
#WHEN THE NUMBER OF ITERATIONS (REPETITIONS) IS KNOWN


ITER <- 5 #SET NUMBER OF ITERATIONS
#PRINTS "HELLO WORLD!" 5 TIMES
for(LCV in 5:1) {
  print("HELLO WORLD!")
}

#READ THE ELEMENTS OF A VECTOR ELEMENT BY ELEMENT
MESSAGE <- c('Shhhh...','This','is','a','secret.')
for(LCV in MESSAGE) {
  print(LCV)
}

#AUTOMATE COMPUTATIONS

ITER <- 10 #SETS ITERATION COUNT
RUNSUM <- 0 #SETS RUNNING SUM TO ZERO
#COMPUTES A RUNNING SUM
for(LCV in 1:ITER) {
  RUNSUM <- RUNSUM +1
  print(RUNSUM)
}

#AN EXAMPLE WITH SUMMING ELEMENTS OF A VECTOR

RUNSUM <- 0 #SETS RUNNING SUM TO ZERO
VEC <- c(3, 7, 4, 6) #A VECTOR OF DATA

#COMPUTES A RUNNING SUM OF ELEMENTS OF A VECTOR
for(LCV in 1:length(VEC)) {
  RUNSUM <- RUNSUM + VEC[LCV]
  print(RUNSUM)
}

#ALTERNATIVELY
RUNSUM<-0 #SETS RUNNING SUM TO ZERO
for(LCV in VEC) {
  RUNSUM <- RUNSUM + LCV
  print(RUNSUM)
}

#AN EXAMPLE COMPUTING THE VARIANCE OF A VECTOR OF DATA

EXAMPLE_DATA <- c(10, 5, 1, -12, 30)
RUNSUM <-0 #SET RUNNING SUM TO ZERO

#COMPUTES THE SUM OF SQUARED DEVIATIONS IN THE LOOP AND STORES IT IN RUNSUM
for(LCV in 1:length(EXAMPLE_DATA)) {
  RUNSUM <- RUNSUM + (EXAMPLE_DATA[LCV]-mean(EXAMPLE_DATA))^2
}
RUNSUM
VAR <- RUNSUM/4 #DIVIDE BY N-1 FOR SMALL SAMPLE ADJUSTMENT

VAR #PRINT THE VARIANCE

var(EXAMPLE_DATA) #VERIFYING OUR RESULTS

####################################################
##AN EXAMPLE COUNTING NA VALUES IN COLUMNS OF DATA##
####################################################

df_raw<-read.table('https://raw.githubusercontent.com/slevkoff/CLASS_DATA/master/CLEANING.txt')
View(df_raw)
#CREATES AN EMPTY 1x4 VECTOR OF ZEROS FOR COUNTING
#NAs IN EACH COLUMN
NA_COUNT_LONG<-matrix(0,1,dim(df_raw)[2])
NA_COUNT_LONG #SEE THE CONTENTS OF THIS VARIABLE

#WE COULD DO IT THE LONG WAY
NA_COUNT_LONG[1]<-sum(is.na(df_raw[,1]))
NA_COUNT_LONG[2]<-sum(is.na(df_raw[,2]))
NA_COUNT_LONG[3]<-sum(is.na(df_raw[,3]))
NA_COUNT_LONG[4]<-sum(is.na(df_raw[,4]))

NA_COUNT_LONG #RETURN COUNT OF NAs IN EACH COLUMN

#############################################
#OR WE COULD AUTOMATE IT USING A (FOR) LOOP:#
#############################################

NA_COUNT_AUTO<-matrix(0,1,dim(df_raw)[2])
NA_COUNT_AUTO #SEE THE CONTENTS OF THIS VARIABLE

for (i in 1:dim(df_raw)[2]) {
  NA_COUNT_AUTO[i]<-sum(is.na(df_raw[,i]))
}

NA_COUNT_AUTO #RETURN COUNT OF NAs IN EACH COLUMN

#GENERATING SOME FAST PLOTS#

#LOOK AT DISTRIBUTIONS THE "LONG WAY"
hist(df_raw$V1)
hist(df_raw$V2)
hist(df_raw$V3)
hist(df_raw$V4)

#############################################
#OR WE COULD AUTOMATE IT USING A (FOR) LOOP:#
#############################################

for (i in 1:dim(df_raw)[2]) {
  hist(df_raw[,i]) #DISPLAYS HISTOGRAM FOR COLUMN i
}

########################################
####WE CAN ALSO USE NESTED FOR LOOPS####
###TO LOOP THROUGH MULTIPLE VARIABLES###
########################################

A <- matrix(1:6, 2, 3)
A #VIEW MATRIX OBJECT
#SUPPOSE WE WANTED TO ADD UP ALL OF THE ELEMENTS OF THE MATRIX

RUNSUM<-0
for (i in 1:nrow(A)){
  for (j in 1:ncol(A)){
    RUNSUM <- RUNSUM + A[i,j]
  }
}
RUNSUM #REPORT SUMMED ELEMENTS

#######################################
##WHILE LOOPS AND BOOLEAN EXPRESSIONS##
#######################################

#WHILE LOOPS ARE USEFUL WHEN YOU NEED TO REPEAT A COMPUTATION
#BUT THE NUMBER OF ITERATIONS (REPETITIONS) IS NOT KNOWN
#HOWEVER, YOU DO KNOW A LOGICAL CONDITION (BOOLEAN EXPRESSION)
#THAT MUST BE APPLICABLE IN ORDER TO REPEAT THE CALCULATION.

x<-0
#KEEPS PRINTING THE VALUE OF x AS LONG AS x<5
while (x<5) {
  print(x)
  x <- x +1
}

#############################################
#A MORE GENERAL EXAMPLE W/ ITERATION COUNTER#
#############################################

x <- 0
INC <- 1 #INCREMENT BY WHICH TO INCREASE x AT ANY ITERATION
ITER <- 0 #ITERATION COUNTER
LIMIT <- 100 #SETS LIMIT FOR x VALUE

#KEEPS PRINTING THE VALUE OF x AS LONG AS x<LIMIT IS TRUE
while (x<LIMIT) {
  ITER <- ITER+1
  writeLines(paste("Iteration:", ITER)) #ALLOWS YOU TO PRINT WITH LOOP
  writeLines(paste("x:", x)) #ALLOWS YOU TO PRINT WITH LOOP
  x <- x + INC #INCREASE x BY INC EACH ITERATION
}

##################################
#WHAT DO YOU THINK THIS ONE DOES?#
##################################

x <- 0
while (x<10) {
  if (x<=5){
    print(x)
    print("x is less than or equal to 5")
    x <- x + 1
  } else {
    print(x)
    print("x is greater than 5")
    x <- x + 1
  }
} 

###############################
##AN EXAMPLE WITH USER INPUT:##
###############################

#THE != SIGN IS THE BOOLEAN OPERATOR FOR NOT EQUAL TO
#THE DOUBLE EQUALS SIGN == IS THE BOOLEAN OPERATOR FOR EQUALITY

CORRECT <- FALSE
while (CORRECT==FALSE) {   
  print("What is 2+2?")
  #NEXT LINE TAKES INPUT FROM USER IN THE CONSOLE WINDOW
  RESPONSE<- readline(prompt="Please, enter your ANSWER: ")
  if (RESPONSE!=4){
    print("Sorry, your answer is incorrect.  Try again:")  
  } else {
    print("Good job!  You got it right!")
    CORRECT <- TRUE
  }
}

#####################
###SIMPLE RPS GAME###
#####################

#PRINT INSTRUCTIONS
print("Welcome to Rock-Paper-Scissors!  You'll be playing against a computer.")

#INITIALIZE USER STRATEGY
user_strat<-0

#LOOP TO CHECK VALID INPUT
while(user_strat!="R" && user_strat!="P" && user_strat!="S") {
  user_strat <- readline(paste("Please enter a valid response for your choice of strategy (R/P/S):"))
}

#PRINT USER STRATEGY
paste("You chose", user_strat)

#GENERATE UNIFORM RANDOM NUMBER ON [0,3]
rand_var<-3*runif(1) 

#CONDITIONALS TO ASSIGN COMPUTERS RANDOM STRATEGY
if (rand_var<=1){
  comp_strat<-"R"
} else if (rand_var>1 && rand_var <=2){
  comp_strat<-"P"
} else {
  comp_strat<-"S"
}

##PRINT COMPUTER CHOICE (NOT NECESSARY)
paste("Computer chooses:", comp_strat)


##DETERMINING WINNER AND PRINTING OUTCOME
if (user_strat==comp_strat){
  print("Tie!")
} else if ((user_strat=="R" && comp_strat=="P") || (user_strat=="P" && comp_strat=="S")||(user_strat=="S" && comp_strat=="R")) {
  paste("You lose! ", comp_strat, "beats", user_strat)
} else {
  paste("You win! ", user_strat, "beats", comp_strat)
}



