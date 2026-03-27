# Wine Quality Analysis 🍷

## 📊 Project Overview
This project analyzes wine quality using physicochemical properties and builds a machine learning model to classify wine into taste categories.

## ⚙️ Steps Performed
- Data cleaning using `janitor`
- Correlation analysis
- Feature engineering (taste classification)
- Data visualization
- Train-test split
- Random Forest classification model
- Model evaluation using confusion matrix and accuracy

## 🧠 Key Insights
- Alcohol has the strongest positive correlation with wine quality
- Sulphates show moderate influence
- The dataset is imbalanced, affecting model performance
- The model performs well for "bad" wines but struggles with "good" wines

## 🤖 Model Performance
- Algorithm: Random Forest
- Accuracy: ~68%
- Challenge: Class imbalance and feature overlap

## 📦 Libraries Used
- tidyverse
- janitor
- randomForest

## 🚀 Future Improvements
- Use binary classification
- Apply class balancing techniques
- Hyperparameter tuning
- Try other models (XGBoost, SVM)

