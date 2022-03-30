---------------------------------------------------------
-- Classification using eXtreme Gradient Boosting (XGB)  
---------------------------------------------------------

SELECT 
CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 

FROM 
(SELECT Game_Result AS obs, 
PREDICT_XGB_CLASSIFIER (
At_Bats,
Runs_Scored,
Hits,
Doubles,
Triples,
Home_Runs,
Runs_Batted_In,
Walks,Strikeouts,
Hit_By_Pitch,
Sacrifice_Hits,
Sacrifice_Flies,
Reached_On_Error,
Grounded_into_Double_Play,
Stolen_Bases,
Caught_Stealing,
Runners_Left_On_Base
USING PARAMETERS model_name='BRS_2016_2021_Batting_XGBModel') AS PRED FROM BRS_2016_2021_Batting_input) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                    comment
--------------+-------------+-------------+-----------------------------------------------
            0 |         327 |          49 |
            1 |          47 |         447 | Of 870 rows, 870 were used and 0 were ignored
(2 rows)

DROP TABLE IF EXISTS BRS_2016_2021_Batting_prediction_XGB;

CREATE TABLE BRS_2016_2021_Batting_prediction_XGB 
AS (SELECT Key, Game_Date, Team, Opponent, Game_Result,
    PREDICT_XGB_CLASSIFIER (
    At_Bats,
    Runs_Scored,
    Hits,
    Doubles,
    Triples,
    Home_Runs,
    Runs_Batted_In,
    Walks,Strikeouts,
    Hit_By_Pitch,
    Sacrifice_Hits,
    Sacrifice_Flies,
    Reached_On_Error,
    Grounded_into_Double_Play,
    Stolen_Bases,
    Caught_Stealing,
    Runners_Left_On_Base
    USING PARAMETERS model_name='BRS_2016_2021_Batting_XGBModel') AS ML_Prediction,
    At_Bats,
    Runs_Scored,
    Hits,
    Doubles,
    Triples,
    Home_Runs,
    Runs_Batted_In,
    Walks,Strikeouts,
    Hit_By_Pitch,
    Sacrifice_Hits,
    Sacrifice_Flies,
    Reached_On_Error,
    Grounded_into_Double_Play,
    Stolen_Bases,
    Caught_Stealing,
    Runners_Left_On_Base
    
    FROM BRS_2016_2021_Batting_input);

-------------------------------------------------------------
--    Create and load a table of XGB metrics 
-------------------------------------------------------------
--  Alternate and extended way of displaying
--       the Confusion Matrix shown above 
-------------------------------------------------------------
-- Accuracy = Overall performance of the model
-- Precision = How accurate the positive predictions are 
-- Recall Sensitivity = Coverage of actual positive sample
-- Specificity = Coverage of actual negative sample
-------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_prediction_XGB_metrics;

CREATE TABLE BRS_2016_2021_Batting_prediction_XGB_metrics 
AS (SELECT 
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
    (SELECT COUNT(*) AS TP FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS true_positives,
    (SELECT COUNT(*) AS TN FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS true_negatives,
    (SELECT COUNT(*) AS FP FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS false_positives,
    (SELECT COUNT(*) AS FN FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS false_negatives,
    (SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result != ML_Prediction) AS total_errors);


SELECT * FROM BRS_2016_2021_Batting_prediction_XGB_metrics; 


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss | ML_Prediction_Errors | ML_Accuracy | ML_Precision | ML_Recall_Sensitivity | ML_Specificity
----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------+-------------+--------------+-----------------------+----------------
                        447 |                         327 |                           49 |                            47 |                   96 |       0.890 |        0.901 |                 0.905 |          0.870

(1 row)