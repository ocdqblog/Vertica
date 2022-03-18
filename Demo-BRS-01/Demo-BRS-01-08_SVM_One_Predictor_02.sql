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


SELECT * FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction;

 Key | Game_Date  | Game_Result | ML_Prediction | Predictor_Column | Predictor_Value | At_Bats | Runs_Scored | Hits | Runs_Batted_In | Walks | Strikeouts | Batting_Average | On_Base_Percentage | Slugging_Percentage | OnBase_Plus_Slugging
-----+------------+-------------+---------------+------------------+-----------------+---------+-------------+------+----------------+-------+------------+-----------------+--------------------+---------------------+----------------------
  11 | 2021-04-14 |           1 |             0 | Runs_Scored      |               3 |      32 |           3 |   11 |              2 |     3 |          7 |           0.344 |                0.4 |               0.438 |                0.838
  24 | 2021-04-27 |           1 |             0 | Runs_Scored      |               2 |      29 |           2 |    5 |              2 |     2 |          8 |           0.172 |              0.226 |               0.345 |                0.571
  25 | 2021-04-28 |           1 |             0 | Runs_Scored      |               1 |      30 |           1 |    4 |              1 |     1 |         15 |           0.133 |              0.161 |               0.233 |                0.395
  28 | 2021-05-01 |           0 |             1 | Runs_Scored      |               6 |      38 |           6 |   12 |              6 |     4 |         12 |           0.316 |              0.372 |               0.447 |                0.819
  31 | 2021-05-05 |           0 |             1 | Runs_Scored      |               5 |      39 |           5 |    9 |              5 |     6 |          8 |           0.231 |              0.348 |               0.333 |                0.681
  42 | 2021-05-16 |           0 |             1 | Runs_Scored      |               5 |      35 |           5 |    9 |              5 |     2 |         14 |           0.257 |              0.297 |               0.486 |                0.783
  52 | 2021-05-29 |           1 |             0 | Runs_Scored      |               3 |      35 |           3 |   12 |              3 |     0 |          6 |           0.343 |              0.343 |               0.486 |                0.829
  66 | 2021-06-13 |           0 |             1 | Runs_Scored      |               4 |      32 |           4 |    6 |              4 |     4 |         12 |           0.188 |              0.278 |               0.406 |                0.684
  67 | 2021-06-14 |           1 |             0 | Runs_Scored      |               2 |      31 |           2 |    7 |              2 |     1 |          7 |           0.226 |               0.25 |               0.258 |                0.508

(9 rows)
