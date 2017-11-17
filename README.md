# Data_Imputation
Assignment 2: Data Imputation
Replacement of missing data with substitution is called data imputation. In R, there are 5 packages that provides us with the functionality of data imputation. 4 of those packages are:
1.	mice()- Multivariate Imputation via Chained Equations (MICE) is one of the most commonly used packages in R, for data imputations. The assumption made by MICE is that missing data are Missing at Random (MAR). This means that the probability that a value is missing depends on observed value and can be predicted using them.

2.	Mean Imputation- Mean imputation is the replacement of a missing observation with the mean of the non-missing observations for that variable. In R, this can be done by using the guess():
imputed_data <- guess(nonimputed_data,type = "mean")

3.	missForest()- This is a non-parametric imputation method applicable to various variable types. A non-parametric method is such that does not make explicit assumptions about functional form of any arbitrary function, f. It tries to estimate f such that it can be as close to the data points without seeming impractical. It builds a random forest model for each variable. Then it uses the model to predict missing values in the variable with the help of observed values.

4.	K-NN – knnImputation function fills in all missing values (NA values) using the k Nearest Neighbor of each case. By default, it uses the values of the neighbors and obtains a weighted average of their values to fill in the unknowns. The definition of the function is:
knnImputation(data, k = 10, scale = T. meth = “weighAvg”, distData = NULL)
where,
data: A data frame with the data set.
k: The number of nearest neighbors to use (default value is 10).
scale: Boolean setting if the data should be scaled before finding the nearest neighbors (default value = T)
meth: String indicating the method used to calculate the value to full in each NA. Available values are ‘median’ or ‘weighAvg’ (default).
distData: This is optional; one can provide a data frame containing data set that should be used to find the neighbors.
