---------------------------------------------------------
--       Classification using Random Forest (RF) 
--  Using all non-response input columns as predictors
---------------------------------------------------------

SELECT CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 
       FROM (SELECT Game_Result AS obs, PREDICT_RF_CLASSIFIER (At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging 
             USING PARAMETERS model_name='BRS_2021_RandomForestModel') AS PRED FROM BRS_2021_input) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                   comment
--------------+-------------+-------------+---------------------------------------------
            0 |          30 |           1 |
            1 |           1 |          49 | Of 81 rows, 81 were used and 0 were ignored

(2 rows)


DROP TABLE IF EXISTS BRS_2021_prediction_RF;

CREATE TABLE BRS_2021_prediction_RF AS (SELECT Key, Game_Date, Game_Result,
                                        PREDICT_RF_CLASSIFIER (At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging 
                                        USING PARAMETERS model_name='BRS_2021_RandomForestModel') AS ML_Prediction, At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging 
                                        FROM BRS_2021_input);


SELECT * FROM BRS_2021_prediction_RF WHERE Game_Result != ML_Prediction;

 Key | Game_Date  | Game_Result | ML_Prediction | At_Bats | Runs_Scored | Hits | Runs_Batted_In | Walks | Strikeouts | Batting_Average | On_Base_Percentage | Slugging_Percentage | OnBase_Plus_Slugging
-----+------------+-------------+---------------+---------+-------------+------+----------------+-------+------------+-----------------+--------------------+---------------------+----------------------
  24 | 2021-04-27 |           1 | 0             |      29 |           2 |    5 |              2 |     2 |          8 |           0.172 |              0.226 |               0.345 |                0.571
  28 | 2021-05-01 |           0 | 1             |      38 |           6 |   12 |              6 |     4 |         12 |           0.316 |              0.372 |               0.447 |                0.819

(2 rows)
