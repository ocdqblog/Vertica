--------------------------------------------
--          One Hot Encoding 
--      For the Opponent predictor column 
--        Categorical data values   
--    in the BRS_2016_2021_input table 
--------------------------------------------
-- In this demo, this is an alternative
--  Because the input data was encoded 
--  During pre-loading data preparation
--------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_OneHotModel',
                            'BRS_2016_2021_input',
                            'Opponent');


DROP TABLE IF EXISTS BRS_2016_2021_encoded_alternative;

CREATE TABLE BRS_2016_2021_encoded_alternative AS SELECT Key, Game_Date, Team, Opponent, Game_Result, Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28 
                                                  FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_OneHotModel', drop_first='false') FROM BRS_2016_2021_input) AS Coming_In_Hot;


SELECT * FROM BRS_2016_2021_encoded_alternative LIMIT 27;


 Key | Game_Date  |      Team      |     Opponent      | Game_Result | Opponent_0 | Opponent_1 | Opponent_2 | Opponent_3 | Opponent_4 | Opponent_5 | Opponent_6 | Opponent_7 | Opponent_8 | Opponent_9 | Opponent_10 | Opponent_11 | Opponent_12 | Opponent_13 | Opponent_14 | Opponent_15 | Opponent_16 | Opponent_17 | Opponent_18 | Opponent_19 | Opponent_20 | Opponent_21 | Opponent_22 | Opponent_23 | Opponent_24 | Opponent_25 | Opponent_26 | Opponent_27 | Opponent_28
-----+------------+----------------+-------------------+-------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------
   1 | 2016-04-05 | Boston Red Sox | Cleveland Indians |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          1 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
   2 | 2016-04-06 | Boston Red Sox | Cleveland Indians |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          1 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
   3 | 2016-04-08 | Boston Red Sox | Toronto Blue Jays |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
   4 | 2016-04-09 | Boston Red Sox | Toronto Blue Jays |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
   5 | 2016-04-10 | Boston Red Sox | Toronto Blue Jays |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
   6 | 2016-04-11 | Boston Red Sox | Baltimore Orioles |           0 |          0 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
   7 | 2016-04-12 | Boston Red Sox | Baltimore Orioles |           0 |          0 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
   8 | 2016-04-13 | Boston Red Sox | Baltimore Orioles |           1 |          0 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
   9 | 2016-04-15 | Boston Red Sox | Toronto Blue Jays |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
  10 | 2016-04-16 | Boston Red Sox | Toronto Blue Jays |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
  11 | 2016-04-17 | Boston Red Sox | Toronto Blue Jays |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
  12 | 2016-04-18 | Boston Red Sox | Toronto Blue Jays |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0
  13 | 2016-04-19 | Boston Red Sox | Tampa Bay Rays    |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0 |           0 |           0
  14 | 2016-04-20 | Boston Red Sox | Tampa Bay Rays    |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0 |           0 |           0
  15 | 2016-04-21 | Boston Red Sox | Tampa Bay Rays    |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0 |           0 |           0
  16 | 2016-04-22 | Boston Red Sox | Houston Astros    |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          1 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  17 | 2016-04-23 | Boston Red Sox | Houston Astros    |           0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          1 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  18 | 2016-04-24 | Boston Red Sox | Houston Astros    |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          1 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  19 | 2016-04-25 | Boston Red Sox | Atlanta Braves    |           1 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  20 | 2016-04-26 | Boston Red Sox | Atlanta Braves    |           1 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  21 | 2016-04-27 | Boston Red Sox | Atlanta Braves    |           1 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  22 | 2016-04-28 | Boston Red Sox | Atlanta Braves    |           0 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  23 | 2016-04-29 | Boston Red Sox | New York Yankees  |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  24 | 2016-04-30 | Boston Red Sox | New York Yankees  |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  25 | 2016-05-01 | Boston Red Sox | New York Yankees  |           1 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           1 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  26 | 2016-05-03 | Boston Red Sox | Chicago White Sox |           0 |          0 |          0 |          0 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0
  27 | 2016-05-04 | Boston Red Sox | Chicago White Sox |           1 |          0 |          0 |          0 |          0 |          1 |          0 |          0 |          0 |          0 |          0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0 |           0

(27 rows)

-----------------------------------------------------------------------------------------------
-- NOTE: The only difference between this encoding table (BRS_2016_2021_encoded_alternative)
--       And the encoding table shown in the rest of this demo (BRS_2016_2021_encoded) 
--       Is the addition of a Opponent_label column in BRS_2016_2021_encoded 
--       Which indicates which encoded column relates to the Opponent column value
--       For Example: Opponent value = "Cleveland Indians" relates to Opponent_6 column
-----------------------------------------------------------------------------------------------