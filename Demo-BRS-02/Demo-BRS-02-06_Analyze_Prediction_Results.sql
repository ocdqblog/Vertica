-------------------------------------------------
--       Analyze the Prediction Results 
-------------------------------------------------
--       A Logistic Regression (LOGREG) 
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

SELECT 
tp.ML_Correctly_Predicted_Win,
tn.ML_Correctly_Predicted_Loss,
fp.ML_Incorrectly_Predicted_Win,
fn.ML_Incorrectly_Predicted_Loss

FROM
(SELECT COUNT(*) AS ML_Correctly_Predicted_Win FROM BRS_2021_HR_prediction_LOGREG WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS tp,
(SELECT COUNT(*) AS ML_Correctly_Predicted_Loss FROM BRS_2021_HR_prediction_LOGREG WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS tn,
(SELECT COUNT(*) AS ML_Incorrectly_Predicted_Win FROM BRS_2021_HR_prediction_LOGREG WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS fp,
(SELECT COUNT(*) AS ML_Incorrectly_Predicted_Loss FROM BRS_2021_HR_prediction_LOGREG WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS fn;


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss
----------------------------+-----------------------------+------------------------------+-------------------------------
                        687 |                           0 |                            0 |                           313

(1 row)