# Demo-BRS-01

Machine Learning Demo using Baseball Related Statistics (BRS). 

The input data comes from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_input.csv 

(Its data profiling results come from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_profile.csv)

Containing baseball statistics from team batting box score totals for games played during the 2021 Major League Baseball (MLB) season, 
and a Game_Result response column for training machine learning models, labeled either 0 or 1, where 0 = Loss and 1 = Win.

The SQL files above (named in order of execution) contain the queries and results that will walk you through the demo. 

A Random Forest classification model is used to predict if the team won or lost the game based on using all non-response input columns as predictors. A Support Vector Machine classification model is used to allow the demo audience to play around with seeing if a single non-response input column can be an accurate predictor (the demo shows the use of Runs_Scored). 

This demo is intended to provide a simple introduction to machine learning models for classification using SQL.

In the next demo (https://github.com/ocdqblog/Vertica/tree/main/Demo-BRS-02), the same games are broken down to the individual player box score totals, and a Random Forest classification model is used to determine if the most exciting event in baseball -- a player hitting a home run -- can accurately predict whether the team will win the game.

To Learn More about the Vertica Machine Learning Classification Algorithms used in this demo, check out the Vertica documentation: https://www.vertica.com/docs/11.1.x/HTML/Content/Authoring/AnalyzingData/MachineLearning/ClassificationAlgorithms.htm?tocpath=Analyzing%20Data%7CMachine%20Learning%20for%20Predictive%20Analytics%7CClassification%20Algorithms

Check out the Vertica GitHub for more awesome repositories: https://github.com/vertica

To Learn More about Vertica: https://www.vertica.com/ 
