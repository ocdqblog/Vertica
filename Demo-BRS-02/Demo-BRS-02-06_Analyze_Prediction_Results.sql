-------------------------------------------------
--       Analyze the Prediction Results 
-------------------------------------------------
--            A Random Forest (RF) 
--    Classification Machine Learning Model 
-------------------------------------------------
--    Was used to try to predict the impact on
--     a baseball player hitting a home run  
--   on whether or not their team won the game
-------------------------------------------------
--     Game_Result = 0 = Team Lost the Game
--     Game_Result = 1 = Team Won the Game
-------------------------------------------------

-------------------------------------------------
--    Breakdown of how the ML model performed  
-------------------------------------------------
--       Alternate way of displaying the
--            Confusion Matrix 
--       Shown in the previous SQL file 
-------------------------------------------------

SELECT 
true_positives.ML_Correctly_Predicted_Win,
true_negatives.ML_Correctly_Predicted_Loss,
false_positives.ML_Incorrectly_Predicted_Win,
false_negatives.ML_Incorrectly_Predicted_Loss

FROM
(SELECT COUNT(*) AS ML_Correctly_Predicted_Win FROM BRS_2021_HR_prediction_RF WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS true_positives,
(SELECT COUNT(*) AS ML_Correctly_Predicted_Loss FROM BRS_2021_HR_prediction_RF WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS true_negatives,
(SELECT COUNT(*) AS ML_Incorrectly_Predicted_Win FROM BRS_2021_HR_prediction_RF WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS false_positives,
(SELECT COUNT(*) AS ML_Incorrectly_Predicted_Loss FROM BRS_2021_HR_prediction_RF WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS false_negatives;


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss
----------------------------+-----------------------------+------------------------------+-------------------------------
                        323 |                         200 |                          108 |                           189

(1 row)

-------------------------------------------------
-- Generally, how predictive are Home Runs?  
-------------------------------------------------

SELECT Game_Result, Home_Runs, COUNT(*)  
FROM BRS_2021_HR_prediction_RF 
GROUP BY Game_Result, Home_Runs
ORDER BY Game_Result;


 Game_Result | Home_Runs | COUNT
-------------+-----------+-------
           0 |         0 |   288  -- Majority of actual losses occured without hitting a home run
           0 |         1 |    20  -- Exactly 1 home run was hit in only 20 actual losses
           1 |         0 |   434  -- Majority of actual wins occured without hitting a home run
           1 |         1 |    74  -- Exactly 1 home run was hit in only 74 actual wins
           1 |         2 |     3  -- Team always won the game when a player hit 2 or 3 home runs, 
           1 |         3 |     1  --   but these rare events only occurred in 4 games (of 81 total games)

(6 rows)

-------------------------------------------------
-- Analyze ML Prediction Results by Home Runs  
-------------------------------------------------

SELECT Game_Result, ML_Prediction, Home_Runs, COUNT(*)  
FROM BRS_2021_HR_prediction_RF 
GROUP BY Game_Result, ML_Prediction, Home_Runs
ORDER BY Game_Result;


 Game_Result | ML_Prediction | Home_Runs | COUNT
-------------+---------------+-----------+-------
           0 | 0             |         0 |   200  -- When ML correctly predicted no home run = Loss
           0 | 1             |         0 |    88  -- When ML incorrectly predicted no home run = Win
           0 | 1             |         1 |    20  -- When ML incorrectly predicted a home run = Win   
           1 | 0             |         0 |   189  -- When ML incorrectly predicted no home run = Loss
           1 | 1             |         0 |   245  -- When ML correctly predicted no home run = Win 
           1 | 1             |         1 |    74  -- When ML correctly predicted 1 home run = Win
           1 | 1             |         2 |     3  -- When ML correctly predicted 2 home runs = Win
           1 | 1             |         3 |     1  -- When ML correctly predicted 3 home runs = Win

(8 rows)