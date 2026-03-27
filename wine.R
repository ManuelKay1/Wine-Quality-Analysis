install.packages('tidyverse')
install.packages('janitor')
install.packages('randomForest')
library(tidyverse)
library(janitor)
library(randomForest)

# 1.load dataset
wine <- read_csv("C:\\Users\\user\\Desktop\\WineQT.csv")

# 2.View dataset
View(wine)

# 3. Data Cleaning
wine <- clean_names(wine)

# Check structure
str(wine)

# Check missing values
wine %>% map(~sum(is.na(.)))

# 4. Correlation Analysis
correlation <- wine %>% 
  select(fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
         chlorides, free_sulfur_dioxide, total_sulfur_dioxide,
         density, p_h, sulphates, alcohol, quality) %>% 
  cor(use = "pairwise.complete.obs", method = "pearson")

print(correlation)

# 5. Distribution of Quality
barplot(table(wine$quality),
        main = "Wine Quality Distribution",
        col = "skyblue")

# 6. Feature Engineering (Create Taste Categories)
wine$taste <- ifelse(wine$quality < 6, "bad",
                     ifelse(wine$quality == 6, "normal", "good"))

wine$taste <- as.factor(wine$taste)

# Check class distribution
table(wine$taste)

# Visualize taste categories
barplot(table(wine$taste),
        main = "Wine Taste Categories",
        col = c("red", "yellow", "green"))

# 7. Train-Test Split
set.seed(123)

samp <- sample(nrow(wine), 0.6 * nrow(wine))

train <- wine[samp, ]
test  <- wine[-samp, ]

# 8. Build Random Forest Model
model <- randomForest(taste ~ . -quality -id, data = train)

# View model
print(model)

# 9. Predictions
pred <- predict(model, newdata = test)

# 10. Confusion Matrix
conf_matrix <- table(Predicted = pred, Actual = test$taste)
print(conf_matrix)

# 11. Accuracy
accuracy <- mean(pred == test$taste)
print(paste("Model Accuracy:", round(accuracy * 100, 2), "%"))

# 12. Feature Importance
varImpPlot(model)

# ================================
# END OF ANALYSIS
# ================================

