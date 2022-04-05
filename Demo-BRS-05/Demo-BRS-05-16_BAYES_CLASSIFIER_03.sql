---------------------------------------------------------
--     Classification using Naive Bayes (BAYES)  
---------------------------------------------------------

SELECT 
CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 

FROM 
(SELECT Game_Result AS obs, 
PREDICT_NAIVE_BAYES (
Runs_Scored_Metric_0, Runs_Scored_Metric_1, Runs_Scored_Metric_2, Runs_Scored_Metric_3, Runs_Scored_Metric_4, 
Hits_Metric_0, Hits_Metric_1, Hits_Metric_2, 
Home_Runs_Metric_0, Home_Runs_Metric_1, Home_Runs_Metric_2, 
Extra_Base_Hits_Metric_0, Extra_Base_Hits_Metric_1, Extra_Base_Hits_Metric_2, 
Walks_Minus_Strikeouts_Metric_0, Walks_Minus_Strikeouts_Metric_1, Walks_Minus_Strikeouts_Metric_2
USING PARAMETERS model_name='BRS_2016_2021_WP_BAYES_model') AS PRED FROM BRS_2016_2021_WP_BAYES_input) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                    comment
--------------+-------------+-------------+-----------------------------------------------
            0 |         274 |         102 |
            1 |          98 |         396 | Of 870 rows, 870 were used and 0 were ignored

(2 rows)


-------------------------------------------------------------
--         Create a table containing the BAYES 
--    Predictions along with the class probabilities 
-------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_WP_BAYES_probability;

CREATE TABLE BRS_2016_2021_WP_BAYES_probability 
AS SELECT  
a.Key,
b.Game_Date,
b.Game_Month,
b.Game_Day_of_Week,
b.Team,
b.Opponent,
b.Opponent_Division,
b.Game_Result,
a.Predicted AS ML_Prediction,
a.Probability AS ML_Probability,
b.Runs_Scored,
b.Runs_Scored_Metric,
b.Runs_Scored_Metric_0, 
b.Runs_Scored_Metric_1, 
b.Runs_Scored_Metric_2, 
b.Runs_Scored_Metric_3, 
b.Runs_Scored_Metric_4,
b.Hits,
b.Hits_Metric,
b.Hits_Metric_0, 
b.Hits_Metric_1, 
b.Hits_Metric_2,
b.Doubles,
b.Triples,
b.Home_Runs,
b.Home_Runs_Metric,
b.Home_Runs_Metric_0, 
b.Home_Runs_Metric_1, 
b.Home_Runs_Metric_2,
b.Extra_Base_Hits,
b.Extra_Base_Hits_Metric,
b.Extra_Base_Hits_Metric_0, 
b.Extra_Base_Hits_Metric_1, 
b.Extra_Base_Hits_Metric_2, 
b.Walks,
b.Strikeouts,
b.Walks_Minus_Strikeouts,
b.Walks_Minus_Strikeouts_Metric,
b.Walks_Minus_Strikeouts_Metric_0, 
b.Walks_Minus_Strikeouts_Metric_1, 
b.Walks_Minus_Strikeouts_Metric_2 
 
FROM
(SELECT PREDICT_NAIVE_BAYES_CLASSES (*
USING PARAMETERS model_name='BRS_2016_2021_WP_BAYES_model', key_columns = 'Key', exclude_columns = 'Key, Game_Date, Game_Month, Game_Day_of_Week, Team, Opponent, Opponent_Division, Game_Result, Runs_Scored, Runs_Scored_Metric, Hits, Hits_Metric, Doubles, Triples, Home_Runs, Home_Runs_Metric, Extra_Base_Hits, Extra_Base_Hits_Metric, Walks, Strikeouts, Walks_Minus_Strikeouts, Walks_Minus_Strikeouts_Metric', classes = '0,1')
OVER () FROM BRS_2016_2021_WP_BAYES_input
ORDER BY Key) AS a

INNER JOIN 
(SELECT * FROM BRS_2016_2021_WP_BAYES_input ORDER BY Key) AS b
 ON a.Key = b.Key;


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

DROP TABLE IF EXISTS BRS_2016_2021_WP_BAYES_metrics;

CREATE TABLE BRS_2016_2021_WP_BAYES_metrics
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
    (SELECT COUNT(*) AS TP FROM BRS_2016_2021_WP_BAYES_probability WHERE Game_Result = ML_Prediction AND Game_Result = 1) AS true_positives,
    (SELECT COUNT(*) AS TN FROM BRS_2016_2021_WP_BAYES_probability WHERE Game_Result = ML_Prediction AND Game_Result = 0) AS true_negatives,
    (SELECT COUNT(*) AS FP FROM BRS_2016_2021_WP_BAYES_probability WHERE Game_Result != ML_Prediction AND Game_Result = 0) AS false_positives,
    (SELECT COUNT(*) AS FN FROM BRS_2016_2021_WP_BAYES_probability WHERE Game_Result != ML_Prediction AND Game_Result = 1) AS false_negatives,
    (SELECT COUNT(*) AS ML_Prediction_Errors FROM BRS_2016_2021_WP_BAYES_probability WHERE Game_Result != ML_Prediction) AS total_errors);