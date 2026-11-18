
# Activity 4

rm(list = ls())

install.packages("randomForest")
library(randomForest)

data(iris)

set.seed(123)
sample_indices <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[sample_indices, ]
test_data <- iris[-sample_indices, ]

View(iris)
View(train_data)
View(test_data)


dim(train_data)
dim(test_data)


# Activity 5


rf_model <- randomForest(Species ~ ., data = train_data, ntree = 500)


print(rf_model)


# Activity 6


predictions <- predict(rf_model, test_data)


conf_matrix <- table(predictions, test_data$Species)


print(conf_matrix)

accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
precision <- diag(conf_matrix) / rowSums(conf_matrix)
recall <- diag(conf_matrix) / colSums(conf_matrix)
f_score <- 2 * (precision * recall) / (precision + recall)


cat("Accuracy:", accuracy, "\n")
cat("Precision (per class):", paste(precision, collapse = ", "), "\n")
cat("Recall (per class):", paste(recall, collapse = ", "), "\n")
cat("F-score (per class):", paste(f_score, collapse = ", "), "\n")



























