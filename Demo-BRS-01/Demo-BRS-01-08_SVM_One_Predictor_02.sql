-------------------------------------------------------
-- Classification using Support Vector Machine (SVM) 
-------------------------------------------------------

SELECT CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 
       FROM (SELECT Game_Result AS obs, PREDICT_SVM_CLASSIFIER (Predictor_Value 
             USING PARAMETERS model_name='BRS_2021_SupportVectorMachineModel') AS PRED FROM BRS_2021_predictor) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                   comment
--------------+-------------+-------------+---------------------------------------------
            0 |          27 |           4 |
            1 |           5 |          45 | Of 81 rows, 81 were used and 0 were ignored

(2 rows)

DROP TABLE IF EXISTS BRS_2021_prediction_SVM;

CREATE TABLE BRS_2021_prediction_SVM AS (SELECT Key, Game_Date, Game_Result,
                                         PREDICT_SVM_CLASSIFIER (Predictor_Value 
                                         USING PARAMETERS model_name='BRS_2021_SupportVectorMachineModel') AS ML_Prediction, Predictor_Column, Predictor_Value, At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging 
                                         FROM BRS_2021_predictor);


SELECT
a.ML_Prediction_Errors,
100 - (a.ML_Prediction_Errors / b.Total_Input_Rows) * 100 AS ML_Prediction_Accuracy  
FROM
(SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction) AS a,
(SELECT COUNT(*) AS Total_Input_Rows FROM BRS_2021_prediction_SVM) as b;


 ML_Prediction_Errors | ML_Prediction_Accuracy
----------------------+------------------------
                    9 |  88.888888888888888900

(1 row)

-------------------------------------------------
--       Alternate way of displaying the
--      the Confusion Matrix shown above 
-------------------------------------------------

SELECT 
true_positives.ML_Correctly_Predicted_Win,
true_negatives.ML_Correctly_Predicted_Loss,
false_positives.ML_Incorrectly_Predicted_Win,
false_negatives.ML_Incorrectly_Predicted_Loss

FROM
(SELECT COUNT(*) AS ML_Correctly_Predicted_Win FROM BRS_2021_prediction_SVM WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS true_positives,
(SELECT COUNT(*) AS ML_Correctly_Predicted_Loss FROM BRS_2021_prediction_SVM WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS true_negatives,
(SELECT COUNT(*) AS ML_Incorrectly_Predicted_Win FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS false_positives,
(SELECT COUNT(*) AS ML_Incorrectly_Predicted_Loss FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS false_negatives;


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss
----------------------------+-----------------------------+------------------------------+-------------------------------
                         45 |                          27 |                            4 |                             5

(1 row)