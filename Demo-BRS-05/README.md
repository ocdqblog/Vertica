# Demo-BRS-05

Machine Learning Demo using Baseball Related Statistics (BRS).

This demo was used in my Baseball Data Analysis Challenge: https://www.ocdqblog.com/home/baseball-data-analysis-challenge

The raw data used in this demo was collected via a paid subscription to: https://stathead.com/baseball/ 

The input data comes from: [BRS_2016_2021_Batting_input.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_Batting_input.csv)

( Input data profiling results come from: [BRS_2016_2021_Batting_profile.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_Batting_profile.csv) )

The input data represents 6 years (2016-2021) of Boston Red Sox Major League Baseball (MLB) regular season game results, including a Game_Result response column, labeled either 0 or 1, where 0 = Loss and 1 = Win.

The most insightful Pearson Correlation Matrix values for the input data can also be viewed in: [BRS_2016_2021_Batting_corr_matrix.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_Batting_corr_matrix.csv)

The prepared data can also be viewed in: [BRS_2016_2021_WP_input.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_WP_input.csv)

( Prepared data profiling results can also be viewed in: [BRS_2016_2021_WP_profile.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_WP_profile.csv) )

The SQL files above (named in order of execution) contain the queries and results that will walk you through the demo.

The demo uses logistic regression classification models to calculate win probabilities for the Red Sox across nine (9) game metrics: opponent, opponent’s division, month of year, day of week, runs scored, hits, extra base hits, home runs, and walks versus strikeouts. It also uses the input data to train a Naïve Bayes classification model to predict wins and losses with an associated probability based on the runs scored, hits, extra base hits, home runs, and walks versus strikeouts metrics (all of which are binned ranges of input data values). The 2022 baseball season will be used as the test data to see if the model can correctly predict the results of games it was not trained on.

The win probabilities calculated by this demo can also be viewed in: [BRS_2016_2021_win_probability.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_win_probability.csv)

The game probabilities calculated by this demo can also be viewed in: [BRS_2016_2021_game_probability.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_game_probability.csv)

( Expanded view of the game probabilities, including row counts for the training data: [BRS_2016_2021_training_probability.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_training_probability.csv) )

The game predictions made by this demo can also be viewed in: [BRS_2016_2021_WP_predictions.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_WP_predictions.csv)

The game prediction errors made by this demo can also be viewed in: [BRS_2016_2021_WP_prediction_errors.csv](https://github.com/ocdqblog/Vertica/blob/main/csv/BRS_2016_2021_WP_prediction_errors.csv)

The results of this demo (as of April 5) can also be viewed in this Microsoft Excel file: [Baseball Data Analysis Challenge 2022-04-05.xlsx](https://docs.google.com/spreadsheets/d/1AnWONcuCjqZ1bYkSGf9awVEeQQ-4m8W0/edit?ouid=106495683628010512160&rtpof=true&sd=true&usp=sharing)

To Learn More about Vertica In-Database Machine Learning for Predictive Analytics, check out the Vertica documentation: https://www.vertica.com/docs/11.1.x/HTML/Content/Authoring/AnalyzingData/MachineLearning/MachineLearning.htm?tocpath=Analyzing%20Data%7CMachine%20Learning%20for%20Predictive%20Analytics 

Check out the Vertica GitHub for more awesome repositories: https://github.com/vertica

To Learn More about Vertica: https://www.vertica.com/ 
