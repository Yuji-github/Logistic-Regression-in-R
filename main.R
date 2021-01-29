# Logistic Regression 
library(caTools) # for splitting data set

# import data set
dataset = read.csv('Social_Network_Ads.csv')

# transform Gender to numerical 
dataset$Gender = factor(dataset$Gender, 
                        levels = c('Male', 'Female'), 
                        labels = c(1,2)) 

# typeof(train$EstimatedSalary)
# typeof(train$Gender)

dataset$Gender = as.double(dataset$Gender) # others are double


# removed ID column which unnecessary 
dataset = dataset[, 2:5]

# splitting data set 
seed(1234)
split = sample.split(datasett$Purchased, SplitRatio = 0.75)
train = subset(dataset, split = TRUE)
test = subset(dataset, split = FALSE)

# feature scaling for better results
# must be same numerical type like all double types
# train[, 1:3] = scale(train[, 1:3]) 
# test[, 1:3] = scale(test[, 1:3])

# fit/train data set 
# glm is build in R 
classifiler = glm(formula = Purchased ~ ., family = binomial, data = train)

# prediction the results
prob_pred = predict(classifiler, type = 'response', newdata = test[-4])
y_pred = ifelse(prob_pred > 0.5, 1, 0)

y_spec = predict(classifiler, type = 'response', data.frame(Gender=0, Age=30, EstimatedSalary=80000))
y_spec_pred = ifelse(y_spec > 0.5, 1, 0)

# making confusion matrix
mc = table(test[, 4], y_pred)
print(mc)

