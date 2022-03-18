# Demo-BRS-01

Machine Learning Demo using Baseball Related Data (BRS). 

The input data comes from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_input.csv 

(Its data profiling results come from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_profile.csv)

Containing baseball statistics from team batting boxscore totals for games played during the 2021 Major League Baseball (MLB) season, 
and a Game_Result column for training machine learning models, labeled either 0 or 1, where 0 = Loss and 1 = Win.

The SQL files above (numbered to list in order of execution) contain the queries and results that will walk you through the demo. 

A Random Forest classification model is used to predict if the team won or lost the game based on all non-response input columns as predictors. A Support Vector Machine classification used to allow the demo audience to play around with picking a single non-response input columns as the predictor.  
