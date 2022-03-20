-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG)  
-------------------------------------------------------

SELECT CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 
       FROM (SELECT Game_Result AS obs, PREDICT_LOGISTIC_REG (Home_Runs
             USING PARAMETERS model_name='BRS_2021_HR_LogisticRegressionModel') AS PRED FROM BRS_2021_HR_input) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                     comment
--------------+-------------+-------------+-------------------------------------------------
            0 |           0 |         313 |
            1 |           0 |         687 | Of 1000 rows, 1000 were used and 0 were ignored
(2 rows)


DROP TABLE IF EXISTS BRS_2021_HR_prediction_LOGREG;

CREATE TABLE BRS_2021_HR_prediction_LOGREG AS (SELECT Key, Game_Date, Game_Result,
                                               PREDICT_LOGISTIC_REG (Home_Runs 
                                               USING PARAMETERS model_name='BRS_2021_HR_LogisticRegressionModel') AS ML_Prediction, At_Bats, Runs_Scored, Hits, Home_Runs, Runs_Batted_In  
                                               FROM BRS_2021_HR_input);


SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2021_HR_prediction_LOGREG WHERE Game_Result != ML_Prediction;

 ML_Prediction_Errors
----------------------
                  313
(1 row)

                