-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG)  
-------------------------------------------------------

SELECT CONFUSION_MATRIX(obs::int, pred::int USING PARAMETERS num_classes=2) OVER() 
       FROM (SELECT Game_Result AS obs, PREDICT_LOGISTIC_REG (Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28
             USING PARAMETERS model_name='BRS_2016_2021_LOGREGModel', type = 'probability') AS PRED FROM BRS_2016_2021_encoded) AS prediction_output;


 actual_class | predicted_0 | predicted_1 |                    comment
--------------+-------------+-------------+-----------------------------------------------
            0 |         138 |         238 |
            1 |         115 |         379 | Of 870 rows, 870 were used and 0 were ignored

(2 rows)

DROP TABLE IF EXISTS BRS_2016_2021_prediction_LOGREG;

CREATE TABLE BRS_2016_2021_prediction_LOGREG AS (SELECT Key, Game_Date, Team, Opponent, Game_Result,
                                                 PREDICT_LOGISTIC_REG (Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28
             USING PARAMETERS model_name='BRS_2016_2021_LOGREGModel', type = 'probability') AS ML_Prediction  
                                                 FROM BRS_2016_2021_encoded);


SELECT * FROM BRS_2016_2021_prediction_LOGREG LIMIT 27;

 Key | Game_Date  |      Team      |     Opponent      | Game_Result |   ML_Prediction
-----+------------+----------------+-------------------+-------------+-------------------
   1 | 2016-04-05 | Boston Red Sox | Cleveland Indians |           1 | 0.562970609167227
   2 | 2016-04-06 | Boston Red Sox | Cleveland Indians |           0 | 0.562970609167227
   3 | 2016-04-08 | Boston Red Sox | Toronto Blue Jays |           1 | 0.599989754267722
   4 | 2016-04-09 | Boston Red Sox | Toronto Blue Jays |           1 | 0.599989754267722
   5 | 2016-04-10 | Boston Red Sox | Toronto Blue Jays |           0 | 0.599989754267722
   6 | 2016-04-11 | Boston Red Sox | Baltimore Orioles |           0 | 0.628597099075963
   7 | 2016-04-12 | Boston Red Sox | Baltimore Orioles |           0 | 0.628597099075963
   8 | 2016-04-13 | Boston Red Sox | Baltimore Orioles |           1 | 0.628597099075963
   9 | 2016-04-15 | Boston Red Sox | Toronto Blue Jays |           1 | 0.599989754267722
  10 | 2016-04-16 | Boston Red Sox | Toronto Blue Jays |           1 | 0.599989754267722
  11 | 2016-04-17 | Boston Red Sox | Toronto Blue Jays |           0 | 0.599989754267722
  12 | 2016-04-18 | Boston Red Sox | Toronto Blue Jays |           0 | 0.599989754267722
  13 | 2016-04-19 | Boston Red Sox | Tampa Bay Rays    |           0 | 0.495221466860179
  14 | 2016-04-20 | Boston Red Sox | Tampa Bay Rays    |           1 | 0.495221466860179
  15 | 2016-04-21 | Boston Red Sox | Tampa Bay Rays    |           0 | 0.495221466860179
  16 | 2016-04-22 | Boston Red Sox | Houston Astros    |           1 | 0.441041376497563
  17 | 2016-04-23 | Boston Red Sox | Houston Astros    |           0 | 0.441041376497563
  18 | 2016-04-24 | Boston Red Sox | Houston Astros    |           1 | 0.441041376497563
  19 | 2016-04-25 | Boston Red Sox | Atlanta Braves    |           1 | 0.650671271806771
  20 | 2016-04-26 | Boston Red Sox | Atlanta Braves    |           1 | 0.650671271806771
  21 | 2016-04-27 | Boston Red Sox | Atlanta Braves    |           1 | 0.650671271806771
  22 | 2016-04-28 | Boston Red Sox | Atlanta Braves    |           0 | 0.650671271806771
  23 | 2016-04-29 | Boston Red Sox | New York Yankees  |           1 | 0.428613461396352
  24 | 2016-04-30 | Boston Red Sox | New York Yankees  |           1 | 0.428613461396352
  25 | 2016-05-01 | Boston Red Sox | New York Yankees  |           1 | 0.428613461396352
  26 | 2016-05-03 | Boston Red Sox | Chicago White Sox |           0 |  0.57045805798456
  27 | 2016-05-04 | Boston Red Sox | Chicago White Sox |           1 |  0.57045805798456

(27 rows)