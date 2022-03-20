-------------------------------------------------------
-- Classification using Random Forest (RF)  
-------------------------------------------------------

SELECT CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 
       FROM (SELECT Game_Result AS obs, PREDICT_RF_CLASSIFIER (Runs_Scored, Hits, Home_Runs, Runs_Batted_In
             USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel') AS PRED FROM BRS_2021_HR_input) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                    comment
--------------+-------------+-------------+-----------------------------------------------
            0 |         200 |         108 |
            1 |         189 |         323 | Of 820 rows, 820 were used and 0 were ignored

(2 rows)


DROP TABLE IF EXISTS BRS_2021_HR_prediction_RF;

CREATE TABLE BRS_2021_HR_prediction_RF AS (SELECT Key, Game_Date, Game_Result,
                                           PREDICT_RF_CLASSIFIER (Runs_Scored, Hits, Home_Runs, Runs_Batted_In 
                                           USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel') AS ML_Prediction, At_Bats, Runs_Scored, Hits, Home_Runs, Runs_Batted_In  
                                           FROM BRS_2021_HR_input);


SELECT
a.ML_Prediction_Errors,
100 - (a.ML_Prediction_Errors / b.Total_Input_Rows) * 100 AS ML_Prediction_Accuracy  
FROM
(SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2021_HR_prediction_RF WHERE Game_Result != ML_Prediction) AS a,
(SELECT COUNT(*) AS Total_Input_Rows FROM BRS_2021_HR_prediction_RF) as b;


 ML_Prediction_Errors | ML_Prediction_Accuracy
----------------------+------------------------
                  297 |  63.780487804878048800

(1 row)