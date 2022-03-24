# Demo-BRS-03

Machine Learning Demo using Baseball Related Statistics (BRS). 

The raw data used in this demo was collected via a paid subscription to: https://stathead.com/baseball/ 

The input data comes from: [BRS_2016_2021_input.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_input.csv)

(Its data profiling results come from: [BRS_2016_2021_profile.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_profile.csv))

The input data represents 6 years (2016-2021) of Boston Red Sox Major League Baseball (MLB) regular season baseball game results, including a Game_Result response column, labeled either 0 or 1, where 0 = Loss and 1 = Win. The goal of the demo is to use a Logistic Regression classification machine learning model to predict if the Boston Red Sox will win a game based on what team they are playing.

The SQL files above (named in order of execution) contain the queries and results that will walk you through the demo.

This demo is intended to provide a simple introduction to the following machine learning key concepts:

1. The need to one-hot-encode categorical data values in a predictor column. 

2. Logistic Regression classification can return a probability instead of a class.

3. Depending on what you are trying to achieve, you do not need to use machine learning. 

The one-hot-encoded data: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_encoded.csv  

The output data: https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_output.csv

To Learn More about Vertica In-Database Machine Learning for Predictive Analytics, check out the Vertica documentation: https://www.vertica.com/docs/11.1.x/HTML/Content/Authoring/AnalyzingData/MachineLearning/MachineLearning.htm?tocpath=Analyzing%20Data%7CMachine%20Learning%20for%20Predictive%20Analytics 

Check out the Vertica GitHub for more awesome repositories: https://github.com/vertica

To Learn More about Vertica: https://www.vertica.com/ 
