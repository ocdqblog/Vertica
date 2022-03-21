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

-------------------------------------------------
-- Create and load a table of SVM predictions 
-------------------------------------------------

DROP TABLE IF EXISTS BRS_2021_prediction_SVM;

CREATE TABLE BRS_2021_prediction_SVM AS (SELECT Key, Game_Date, Game_Result,
                                         PREDICT_SVM_CLASSIFIER (Predictor_Value 
                                         USING PARAMETERS model_name='BRS_2021_SupportVectorMachineModel') AS ML_Prediction, Predictor_Column, Predictor_Value, At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging 
                                         FROM BRS_2021_predictor);

-------------------------------------------------------------
--    Create and load a table of SVM metrics 
-------------------------------------------------------------
--  Alternate and extended way of displaying
--       the Confusion Matrix shown above 
-------------------------------------------------------------
-- Accuracy = Overall performance of the model
-- Precision = How accurate the positive predictions are 
-- Recall Sensitivity = Coverage of actual positive sample
-- Specificity = Coverage of actual negative sample
-------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2021_prediction_SVM_metrics;

CREATE TABLE BRS_2021_prediction_SVM_metrics AS (SELECT 
                                                true_positives.TP AS ML_Correctly_Predicted_Win,
                                                true_negatives.TN AS ML_Correctly_Predicted_Loss,
                                                false_positives.FP AS ML_Incorrectly_Predicted_Win,
                                                false_negatives.FN AS ML_Incorrectly_Predicted_Loss,
                                                total_errors.ML_Prediction_Errors,
                                                CAST((true_positives.TP + true_negatives.TN) / (true_positives.TP + true_negatives.TN + false_positives.FP + false_negatives.FN) AS decimal(5,3)) AS ML_Accuracy,
                                                CAST(true_positives.TP / (true_positives.TP + false_positives.FP) AS decimal(5,3)) AS ML_Precision,
                                                CAST(true_positives.TP / (true_positives.TP + false_negatives.FN) AS decimal(5,3)) AS ML_Recall_Sensitivity,
                                                CAST(true_negatives.TN / (true_negatives.TN + false_positives.FP) AS decimal(5,3)) AS ML_Specificity
                                                FROM
                                                (SELECT COUNT(*) AS TP FROM BRS_2021_prediction_SVM WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS true_positives,
                                                (SELECT COUNT(*) AS TN FROM BRS_2021_prediction_SVM WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS true_negatives,
                                                (SELECT COUNT(*) AS FP FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS false_positives,
                                                (SELECT COUNT(*) AS FN FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS false_negatives,
                                                (SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction) AS total_errors);


SELECT * FROM BRS_2021_prediction_SVM_metrics; 


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss | ML_Prediction_Errors | ML_Accuracy | ML_Precision | ML_Recall_Sensitivity | ML_Specificity
----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------+-------------+--------------+-----------------------+----------------
                         45 |                          27 |                            4 |                             5 |                    9 |       0.889 |        0.918 |                 0.900 |          0.871

(1 row)