library(missForest)
library(mice)
library(Amelia)
library(mi)
library(hydroGOF)
library(Metrics)
library(imputeR)
library(Hmisc)
library(DMwR)
#Entering missing value based on percentage
demoIris <- prodNA(iris, 0.25) #Set percentage 0.25 = 25%

#removing the column Species as it contains letters
demoIris <- subset(demoIris, select = -c(Species))

#creating backup of iris dataset
iris1 <- iris[,-5]
##########################################################################################################

#Imputing with knnImputation
imputed_data_knn <- knnImputation(demoIris, 4)

knnrmse<- Rmse(imputed_data_knn,demoIris,iris1,norm=T)
knnrmse

imputed_data_knn

#########################################################################################################

#missForest

imputed_data_Forest <- missForest(demoIris)
t <- imputed_data_Forest$ximp

#RMSE
t1<- Rmse(t,demoIris,iris1,norm=T)
t1


#########################################################################################################

#Mean imputation
imputed_data_mean <- guess(demoIris,type = "mean")

#RMSE
idm_val <- Rmse(imputed_data_mean,demoIris,iris1,norm=T)
idm_val

#########################################################################################################

modelMF <- kNN(Species ~., train = iris, test = t, norm = T)
modelMean <- kNN(Species ~., train = iris, test = imputed_data_mean, norm = T)
modelKNN <- kNN(Species ~., train = iris, test = imputed_data_knn, norm = T)

table(iris$Species,modelKNN)
table(iris$Species,modelMF)
table(iris$Species,modelMean)
