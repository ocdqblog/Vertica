---------------------------------------------------------
--     Classification using Naive Bayes (BAYES)  
---------------------------------------------------------

SELECT 
CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 

FROM 
(SELECT Game_Result AS obs, 
PREDICT_NAIVE_BAYES (
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
USING PARAMETERS model_name='BRS_2016_2021_Batting_BAYESModel') AS PRED FROM BRS_2016_2021_Batting_input) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                    comment
--------------+-------------+-------------+-----------------------------------------------
            0 |         302 |          74 |
            1 |         105 |         389 | Of 870 rows, 870 were used and 0 were ignored
(2 rows)


-------------------------------------------------------------
--  Create a table containing the BAYES predictions
-------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_prediction_BAYES;

CREATE TABLE BRS_2016_2021_Batting_prediction_BAYES 
AS (SELECT Key, Game_Date, Team, Opponent, Game_Result,
    PREDICT_NAIVE_BAYES (
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
    USING PARAMETERS model_name='BRS_2016_2021_Batting_BAYESModel') AS ML_Prediction,
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
--    Create and load a table of BAYES metrics 
-------------------------------------------------------------
--  Alternate and extended way of displaying
--       the Confusion Matrix shown above 
-------------------------------------------------------------
-- Accuracy = Overall performance of the model
-- Precision = How accurate the positive predictions are 
-- Recall Sensitivity = Coverage of actual positive sample
-- Specificity = Coverage of actual negative sample
-------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_prediction_BAYES_metrics;

CREATE TABLE BRS_2016_2021_Batting_prediction_BAYES_metrics 
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
    (SELECT COUNT(*) AS TP FROM BRS_2016_2021_Batting_prediction_BAYES WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS true_positives,
    (SELECT COUNT(*) AS TN FROM BRS_2016_2021_Batting_prediction_BAYES WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS true_negatives,
    (SELECT COUNT(*) AS FP FROM BRS_2016_2021_Batting_prediction_BAYES WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS false_positives,
    (SELECT COUNT(*) AS FN FROM BRS_2016_2021_Batting_prediction_BAYES WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS false_negatives,
    (SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2016_2021_Batting_prediction_BAYES WHERE Game_Result != ML_Prediction) AS total_errors);


SELECT * FROM BRS_2016_2021_Batting_prediction_BAYES_metrics; 


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss | ML_Prediction_Errors | ML_Accuracy | ML_Precision | ML_Recall_Sensitivity | ML_Specificity
----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------+-------------+--------------+-----------------------+----------------
                        389 |                         302 |                           74 |                           105 |                  179 |       0.794 |        0.840 |                 0.787 |          0.803

(1 row)


-------------------------------------------------------------
--         Create a table containing the BAYES 
--    Predictions along with the class probabilities 
-------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_probability_BAYES;

CREATE TABLE BRS_2016_2021_Batting_probability_BAYES 
AS SELECT  
a.Key,
a.Game_Date, 
a.Team,
a.Opponent,
a.Game_Result,
a.Predicted AS ML_Prediction,
a.Probability AS ML_Probability,  
a.'0' AS Class_0_Loss_Probability,
a.'1' AS Class_1_Win_Probability,
b.At_Bats,
b.Runs_Scored,
b.Hits,
b.Doubles,
b.Triples,
b.Home_Runs,
b.Runs_Batted_In,
b.Walks,Strikeouts,
b.Hit_By_Pitch,
b.Sacrifice_Hits,
b.Sacrifice_Flies,
b.Reached_On_Error,
b.Grounded_into_Double_Play,
b.Stolen_Bases,
b.Caught_Stealing,
b.Runners_Left_On_Base
 
FROM
(SELECT PREDICT_NAIVE_BAYES_CLASSES (
Key,
Game_Date,
Team,
Opponent,
Game_Result,
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
USING PARAMETERS model_name='BRS_2016_2021_Batting_BAYESModel', key_columns = 'Key, Game_Date, Team, Opponent, Game_Result', exclude_columns = 'Key, Game_Date, Team, Opponent, Game_Result', classes = '0,1')
OVER () FROM BRS_2016_2021_Batting_input
ORDER BY Key) AS a

INNER JOIN 
(SELECT
 Key,
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
 
 FROM 
 BRS_2016_2021_Batting_input ORDER BY Key) AS b
 ON a.Key = b.Key;