# Demo-BRS-04

Machine Learning Demo using Baseball Related Statistics (BRS). 

The raw data used in this demo was collected via a paid subscription to: https://stathead.com/baseball/ 

The input data comes from: [BRS_2016_2021_Batting_input.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_Batting_input.csv)

( Its data profiling results come from: [BRS_2016_2021_Batting_profile.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_Batting_profile.csv) )

The input data represents 6 years (2016-2021) of Boston Red Sox Major League Baseball (MLB) regular season baseball game results, including a Game_Result response column, labeled either 0 or 1, where 0 = Loss and 1 = Win.

The previous demo (https://github.com/ocdqblog/Vertica/tree/main/Demo-BRS-03) used the same data, but without the full box score statistics, as a simple introduction to the need to one-hot-encode categorical data values in a predictor column, and to show how a Logistic Regression classification model can return a probability instead of a class.

This demo was used in my Baseball Data Analysis Challenge: https://www.ocdqblog.com/home/baseball-data-analysis-challenge

The SQL files above (named in order of execution) contain the queries and results that will walk you through the demo.

To Learn More about Vertica In-Database Machine Learning for Predictive Analytics, check out the Vertica documentation: https://www.vertica.com/docs/11.1.x/HTML/Content/Authoring/AnalyzingData/MachineLearning/MachineLearning.htm?tocpath=Analyzing%20Data%7CMachine%20Learning%20for%20Predictive%20Analytics 

Check out the Vertica GitHub for more awesome repositories: https://github.com/vertica

To Learn More about Vertica: https://www.vertica.com/ 
