-------------------------------------------------------
--               Manually Test   
--          The Random Forest (RF) 
--    Classification Machine Learning Model 
-------------------------------------------------------

-------------------------------------------------------
--    If this machine learning model is useful,
--          You should be able to enter
--   One player's box score statistics for a game and
--   Receive an accurate prediction of the game result
-------------------------------------------------------

-------------------------------------------------------
--    REMEMBER: ML_Prediction = 0 = Team Lost
--              ML_Prediction = 1 = Team Won
-------------------------------------------------------

-------------------------------------------------------
--  Create a one row test table to use in testing
-------------------------------------------------------

DROP TABLE IF EXISTS BRS_2021_HR_test;

CREATE TABLE BRS_2021_HR_test AS (SELECT * FROM BRS_2021_HR_input LIMIT 1);

-------------------------------------------------------
--               Input Value Order: 
--    Runs_Scored, Hits, Home_Runs, Runs_Batted_In 
-------------------------------------------------------

-------------------------------------------------------
--     A Player went 5 for 5 with 5 solo home runs
--  NOTE: This never occured in the actual input data
-------------------------------------------------------

SELECT PREDICT_RF_CLASSIFIER (5, 5, 5, 5  
       USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel', match_by_pos ='true') AS ML_Prediction, 
       5 AS Runs_Scored, 
       5 AS Hits, 
       5 AS Home_Runs, 
       5 AS Runs_Batted_In 
       FROM BRS_2021_HR_test;


 ML_Prediction | Runs_Scored | Hits | Home_Runs | Runs_Batted_In
---------------+-------------+------+-----------+----------------
 1             |           5 |    5 |         5 |              5

(1 row)

-------------------------------------------------------
--     Additional manual model test cases 
-------------------------------------------------------

SELECT PREDICT_RF_CLASSIFIER (0, 0, 0, 0  
       USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel', match_by_pos ='true') AS ML_Prediction, 
       0 AS Runs_Scored, 
       0 AS Hits, 
       0 AS Home_Runs, 
       0 AS Runs_Batted_In 
       FROM BRS_2021_HR_test;


 ML_Prediction | Runs_Scored | Hits | Home_Runs | Runs_Batted_In
---------------+-------------+------+-----------+----------------
 0             |           0 |    0 |         0 |              0

(1 row)


SELECT PREDICT_RF_CLASSIFIER (0, 3, 0, 0  
       USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel', match_by_pos ='true') AS ML_Prediction, 
       0 AS Runs_Scored, 
       3 AS Hits, 
       0 AS Home_Runs, 
       0 AS Runs_Batted_In 
       FROM BRS_2021_HR_test;


 ML_Prediction | Runs_Scored | Hits | Home_Runs | Runs_Batted_In
---------------+-------------+------+-----------+----------------
 0             |           0 |    3 |         0 |              0

(1 row)


SELECT PREDICT_RF_CLASSIFIER (2, 3, 0, 0  
       USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel', match_by_pos ='true') AS ML_Prediction, 
       2 AS Runs_Scored, 
       3 AS Hits, 
       0 AS Home_Runs, 
       0 AS Runs_Batted_In 
       FROM BRS_2021_HR_test;


 ML_Prediction | Runs_Scored | Hits | Home_Runs | Runs_Batted_In
---------------+-------------+------+-----------+----------------
 1             |           2 |    3 |         0 |              0

(1 row)