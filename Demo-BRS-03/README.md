# Demo-BRS-02

Machine Learning Demo using Baseball Related Statistics (BRS). 

The raw data used in this demo was collected via a paid subscription to: https://stathead.com/baseball/ 

The input data comes from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_HR_input.csv 

(Its data profiling results come from: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2021_HR_profile.csv) 

The SQL files above (named in order of execution) contain the queries and results that will walk you through the demo. 

The previous demo (https://github.com/ocdqblog/Vertica/tree/main/Demo-BRS-01) used team batting box score totals for games played during the 2021 Major League Baseball (MLB) season to predict whether a team won or lost the game, using a Game_Result response column, labeled either 0 or 1, where 0 = Loss and 1 = Win.

In this demo, the same games are broken down to the individual player box score totals, and a Random Forest classification model is used to determine if the most exciting event in baseball -- a player hitting a home run -- can accurately predict whether the team will win the game.

This demo is intended to provide a simple introduction to machine learning models for classification using SQL.

To Learn More about the Vertica Machine Learning Classification Algorithms used in this demo, check out the Vertica documentation: https://www.vertica.com/docs/11.1.x/HTML/Content/Authoring/AnalyzingData/MachineLearning/ClassificationAlgorithms.htm?tocpath=Analyzing%20Data%7CMachine%20Learning%20for%20Predictive%20Analytics%7CClassification%20Algorithms

Check out the Vertica GitHub for more awesome repositories: https://github.com/vertica

To Learn More about Vertica: https://www.vertica.com/ 
