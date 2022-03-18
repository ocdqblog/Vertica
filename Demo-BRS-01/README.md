# Demo-BRS-01

Machine Learning Demo using Baseball Related Data (BRS). 

The input data comes from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_input.csv 

(Its data profiling results come from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_profile.csv)

Containing baseball statistics from team batting boxscore totals for games played during the 2021 Major League Baseball (MLB) season, 
and a Game_Result response column for training machine learning models, labeled either 0 or 1, where 0 = Loss and 1 = Win.

The SQL files above (named in order of execution) contain the queries and results that will walk you through the demo. 

A Random Forest classification model is used to predict if the team won or lost the game based on using all non-response input columns as predictors. A Support Vector Machine classification is used to allow the demo audience to play around with seeing if a single non-response input column can be an accurate predictor. 

This demo is intended to provide a simple introduction to machine learning models for classification.

To Learn More about Machine Learning Classification Algorithms: https://www.vertica.com/docs/11.1.x/HTML/Content/Authoring/AnalyzingData/MachineLearning/ClassificationAlgorithms.htm?tocpath=Analyzing%20Data%7CMachine%20Learning%20for%20Predictive%20Analytics%7CClassification%20Algorithms%7C_____0
