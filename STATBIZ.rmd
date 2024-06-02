# Data-analysis
### LOW DIMENSIONAL MODEL ANALYSIS
This analysis aims to investigate the impact of "International Plan" and "Total Day Minutes" on customer churn using logistic regression models. The models are trained on different datasets (normal, undersampled, and oversampled) to address class imbalance and compare the results.
#### Logistic Regression Model with International Plan and Total Day Minutes

1. Firstly, we look at the logistic regression model in relation with Normal Data:
   - The goal is to build a logistic regression model using the test data, examining the interaction between "Total Day Minutes" and "International Plan."
   - Steps: The model is trained, and a summary is generated to view the coefficients and their significance. Predictive probabilities are computed and plotted to visualize the relationship between the predictors and the probability of churn.
   ```r
   summary(model_international_minutes)
   ```
   - **Output:** A plot showing the probability of churn as a function of "Total Day Minutes," separated by "International Plan" status, using the unbalanced training set.
  ```r
   ggplot(Data, aes(x = Total.day.minutes, y = predicted_probabilities, color = International.plan)) + 
     geom_line(size = 1.2) + 
     labs(title = "Probability of Churn by Total Day Minutes and International Plan (Unbalanced training set)", 
          y = "Probability of Churn", x = "Total Day Minutes") +
     scale_color_manual(values = c("red", "blue")) +
     theme_minimal() +
     theme(
       plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  
       axis.title.x = element_text(size = 14, face = "bold"),  
       axis.title.y = element_text(size = 14, face = "bold"),  
       axis.text.x = element_text(size = 12, color = "black"),  
       axis.text.y = element_text(size = 12, color = "black"),  
       panel.grid.major = element_line(color = "gray", linewidth = 0.5),  
       panel.grid.minor = element_line(color = "lightgray", linewidth = 0.25),  
       panel.background = element_rect(fill = "white") 
     )
   ```
2. Then we trained a logistic regression model using undersampled data, which balances the classes by reducing the number of non-churn observations.
   ```r
   model_international_minutes_undersample = glm(Churn ~ Total.day.minutes * International.plan, 
                     family = binomial(link = "logit"), 
                     data = train_data_undersample)
   ```
   - The model is trained on the undersampled data, and the same steps as with the normal data are followed: generating a summary, computing predictive probabilities, and plotting the results.
   - A plot showing the probability of churn by "Total Day Minutes" and "International Plan" using the balanced training set 1 (undersampled).
   ```r
   ggplot(Data, aes(x = Total.day.minutes, y = predicted_probabilities, color = International.plan)) + 
     geom_line(size = 1.2) + 
     labs(title = "Probability of Churn by Total Day Minutes and International Plan (Balanced training set 1)", 
          y = "Probability of Churn", x = "Total Day Minutes") +
     scale_color_manual(values = c("red", "blue")) + 
     theme_minimal() +
     theme(
       plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  
       axis.title.x = element_text(size = 14, face = "bold"),  
       axis.title.y = element_text(size = 14, face = "bold"),  
       axis.text.x = element_text(size = 12, color = "black"),  
       axis.text.y = element_text(size = 12, color = "black"),  
       panel.grid.major = element_line(color = "gray", size = 0.5),  
       panel.grid.minor = element_line(color = "lightgray", size = 0.25),  
       panel.background = element_rect(fill = "white") 
   ```

3. In training a logistic regression model using oversampled data, which balances the classes by increasing the number of churn observations, we follow a similar path to the previous models, this model is trained on the oversampled data, and the results are summarized, predictive probabilities computed, and plotted.
 ```r
   model_international_minutes_oversample = glm(Churn ~ Total.day.minutes * International.plan, 
                                               family = binomial(link = "logit"), 
                                               data = train_data_oversample)
 ```
   - the output is a plot showing the probability of churn by "Total Day Minutes" and "International Plan" using the balanced training set 2 (oversampled).
```r
   ggplot(Data, aes(x = Total.day.minutes, y = predicted_probabilities, color = International.plan)) + 
     geom_line(size = 1.2) + 
     labs(title = "Probability of Churn by Total Day Minutes and International Plan (Balanced training set 2)", 
          y = "Probability of Churn", x = "Total Day Minutes") +
     scale_color_manual(values = c("red", "blue")) +
     theme_minimal() +
     theme(
       plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  
       axis.title.x = element_text(size = 14, face = "bold"),  
       axis.title.y = element_text(size = 14, face = "bold"),  
       axis.text.x = element_text(size = 12, color = "black"),  
       axis.text.y = element_text(size = 12, color = "black"),  
       panel.grid.major = element_line(color = "gray", size = 0.5),  
       panel.grid.minor = element_line(color = "lightgray", size = 0.25),  
       panel.background = element_rect(fill = "white") 
     )
   ```
This detailed analysis of the logistic regression models trained with "International Plan" and "Total Day Minutes" demonstrates the significance of these variables in predicting customer churn. By comparing models trained on normal, undersampled, and oversampled datasets, the analysis evaluates the impact of data balancing techniques on model performance. The visualizations provide clear insights into how the probability of churn varies with "Total Day Minutes" for customers with and without an international plan.



### Logistic Regression Model with Customer Service Calls
Goal of the Analysis: This analysis aims to evaluate the impact of "Customer Service Calls" on customer churn using logistic regression models. The models are trained on different datasets (normal, undersampled, and oversampled) to address class imbalance and compare the results.

1. As before, we built a logistic regression model using the test data, examining the impact of "Customer Service Calls" on churn.
   - The model is trained, and a summary is generated to view the coefficients and their significance. Predictive probabilities are computed and plotted to visualize the relationship between "Customer Service Calls" and the probability of churn.
   ```r
   model_customer_service_calls = glm(Churn ~ Customer.service.calls, 
                                      family = binomial(link = "logit"), 
                                      data = test_data)
   ```
   - The result is plot showing the probability of churn as a function of "Customer Service Calls," using the unbalanced training set.
   ```r
   ggplot(Data, aes(x = Customer.service.calls, y = predicted_probabilities)) + 
     geom_line(size = 1.2, color = "blue") + 
     labs(title = "Probability of Churn by Customer Service Calls (Unbalanced training set)", 
          y = "Probability of Churn", x = "Customer Service Calls") +
     theme_minimal() +
     theme(
       plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  
       axis.title.x = element_text(size = 14, face = "bold"),  
       axis.title.y = element_text(size = 14, face = "bold"),  
       axis.text.x = element_text(size = 12, color = "black"),  
       axis.text.y = element_text(size = 12, color = "black"),  
       panel.grid.major = element_line(color = "gray", size = 0.5),  
       panel.grid.minor = element_line(color = "lightgray", size = 0.25),  
       panel.background = element_rect(fill = "white") 
     ) +
     scale_y_continuous(breaks = seq(0, 1, by = 0.1))
   ```

2. To train a logistic regression model using undersampled data, which balances the classes by reducing the number of non-churn observations, we followed the same steps as with the normal data: generating a summary, computing predictive probabilities, and plotting the results.
    ```r
   summary(model_customer_service_calls_undersample)
   ```
   - In the end we get a plot showing the probability of churn by "Customer Service Calls" using the balanced training set 1 (undersampled).
    ```r
       ggplot(Data, aes(x = Customer.service.calls, y = predicted_probabilities)) + 
         geom_line(size = 1.2, color = "blue") + 
         labs(title = "Probability of Churn by Customer Service Calls (Balanced training set 1)", 
              y = "Probability of Churn", x = "Customer Service Calls") +
         theme_minimal() +
         ylim(0,1) +
         theme(
           plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  
           axis.title.x = element_text(size = 14, face = "bold"),  
           axis.title.y = element_text(size = 14, face = "bold"),  
           axis.text.x = element_text(size = 12, color = "black"),  
           axis.text.y = element_text(size = 12, color = "black"),  
           panel.grid.major = element_line(color = "gray", size = 0.5),  
           panel.grid.minor = element_line(color = "lightgray", size = 0.25),  
           panel.background = element_rect(fill = "white") 
         ) +
         scale_y_continuous(breaks = seq(0, 1, by = 0.1))
       ```
4. Training a logistic regression model using oversampled data balances the classes by increasing the number of churn observations. This model is trained on the oversampled data, and the results are summarized, predictive probabilities computed, and plotted.
   - A plot showing the probability of churn by "Customer Service Calls" using the balanced training set 2 (oversampled).
### Computing Predictive Probabilities: ###
   ```r
   Data$predicted_probabilities = predict(model_customer_service_calls_oversample, newdata = Data, type="response")
   ```
### Plotting the Probabilities: ###
   ```r
   ggplot(Data, aes(x = Customer.service.calls, y = predicted_probabilities)) + 
     geom_line(size = 1.2, color = "blue") + 
     labs(title = "Probability of Churn by Customer Service Calls (Balanced training set 2)", 
          y = "Probability of Churn", x = "Customer Service Calls") +
     theme_minimal() +
     theme(
       plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  
       axis.title.x = element_text(size = 14, face = "bold"),  
       axis.title.y = element_text(size = 14, face = "bold"),  
       axis.text.x = element_text(size = 12, color = "black"),  
       axis.text.y = element_text(size = 12, color = "black"),  
       panel.grid.major = element_line(color = "gray", size = 0.5),  
       panel.grid.minor = element_line(color = "lightgray", size = 0.25),  
       panel.background = element_rect(fill = "white") 
     ) +
     scale_y_continuous(breaks = seq(0, 1, by = 0.1))
   ```

This detailed analysis of the logistic regression models trained with "Customer Service Calls" demonstrates the significance of this variable in predicting customer churn. By comparing models trained on normal, undersampled, and oversampled datasets, the analysis evaluates the impact of data balancing techniques on model performance. The visualizations provide clear insights into how the probability of churn varies with the number of customer service calls.



### Classification Tree 
Goal of the Analysis: This analysis aims to evaluate the impact of "Total Day Minutes," "International Plan," and "Customer Service Calls" on customer churn using classification tree models. The models are trained on different datasets (normal, undersampled, and oversampled) to address class imbalance and compare the results.

### Classification Tree with Normal Data
- The aim is to build a classification tree using the normal training dataset to predict customer churn based on "Total Day Minutes," "International Plan," and "Customer Service Calls." The tree structure is visualized to show decision rules, and a complexity parameter table is printed to assess model pruning. Variable importance is calculated to identify key predictors, and a confusion matrix is generated to evaluate model performance.
   ```r
   predictions_tree = predict(simple_tree, train_data, type = "class")
   confusion_matrix_tree = table(predictions_tree, train_data$Churn)
   print(confusion_matrix_tree)
   ```

#### Classification Tree with Undersampled Data
- the objective is to build a classification tree using undersampled data, which balances the classes by reducing the number of non-churn observations.
- The output is similar to the normal data model, the tree structure is visualized, complexity parameter table printed, variable importance calculated, and confusion matrix generated for model evaluation using the undersampled dataset.
**Plotting the Tree:**
   ```r
   rpart.plot(simple_tree_undersample, main = "Classification Tree - Undersample Data")
   ```
 **Confusion Matrix:**
   ```r
   predictions_tree_undersample = predict(simple_tree_undersample, train_data_undersample, type = "class")
   confusion_matrix_tree_undersample = table(predictions_tree_undersample, train_data_undersample$Churn)
   print(confusion_matrix_tree_undersample)
   ```


#### Classification Tree with Oversampled Data
- The goal is to build a classification tree using oversampled data, which balances the classes by increasing the number of churn observations.
- The tree structure is visualized for the oversampled dataset, complexity parameter table printed, variable importance calculated, and confusion matrix generated to evaluate model performance.
 **Complexity Parameter Table:**
   ```r
   printcp(simple_tree_oversample)
   ```
 **Variable Importance:**
   ```r
   importance_oversample = varImp(simple_tree_oversample, scale = FALSE)
   print(importance_oversample)
   ```
 **Confusion Matrix:**
   ```r
   predictions_tree_oversample = predict(simple_tree_oversample, train_data_oversample, type = "class")
   confusion_matrix_tree_oversample = table(predictions_tree_oversample, train_data_oversample$Churn)
   print(confusion_matrix_tree_oversample)
   ```

This detailed analysis of classification tree models trained with "Total Day Minutes," "International Plan," and "Customer Service Calls" demonstrates the significance of these variables in predicting customer churn. By comparing models trained on normal, undersampled, and oversampled datasets, the analysis evaluates the impact of data balancing techniques on model performance. The visualizations and evaluation metrics provide clear insights into how the classification tree models handle different data balancing approaches.


