-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Game_Day_of_Week input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_ODMD_Game_Day_of_Week_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_ODMD_Game_Day_of_Week_OneHotModel',
                            'BRS_2016_2021_ODMD_input',
                            'Game_Day_of_Week');


DROP TABLE IF EXISTS BRS_2016_2021_ODMD_Game_Day_of_Week_encoded;

CREATE TABLE BRS_2016_2021_ODMD_Game_Day_of_Week_encoded 
AS SELECT Key, Game_Date, Team, Game_Day_of_Week, Game_Result, Game_Day_of_Week_0, Game_Day_of_Week_1, Game_Day_of_Week_2, Game_Day_of_Week_3, Game_Day_of_Week_4, Game_Day_of_Week_5, Game_Day_of_Week_6                                             
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_ODMD_Game_Day_of_Week_OneHotModel', drop_first='false') FROM BRS_2016_2021_ODMD_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_ODMD_Game_Day_of_Week_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_ODMD_Game_Day_of_Week_LOGREGModel', 
                     'BRS_2016_2021_ODMD_Game_Day_of_Week_encoded', 
                     'Game_Result',
                     'Game_Day_of_Week_0, Game_Day_of_Week_1, Game_Day_of_Week_2, Game_Day_of_Week_3, Game_Day_of_Week_4, Game_Day_of_Week_5, Game_Day_of_Week_6' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_ODMD_Game_Day_of_Week_probability;

CREATE TABLE BRS_2016_2021_ODMD_Game_Day_of_Week_probability 
AS (SELECT DISTINCT Team, 'Game_Day_of_Week' AS Game_Metric_Type, Game_Day_of_Week AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Game_Day_of_Week_0, Game_Day_of_Week_1, Game_Day_of_Week_2, Game_Day_of_Week_3, Game_Day_of_Week_4, Game_Day_of_Week_5, Game_Day_of_Week_6
           USING PARAMETERS model_name='BRS_2016_2021_ODMD_Game_Day_of_Week_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_ODMD_Game_Day_of_Week_encoded);


SELECT * FROM BRS_2016_2021_ODMD_Game_Day_of_Week_probability;

      Team      | Game_Metric_Type | Game_Metric_Value |  Win_Probability
----------------+------------------+-------------------+-------------------
 Boston Red Sox | Game_Day_of_Week | Friday            | 0.608399241528952
 Boston Red Sox | Game_Day_of_Week | Monday            | 0.569007177636546
 Boston Red Sox | Game_Day_of_Week | Saturday          | 0.537358445953015
 Boston Red Sox | Game_Day_of_Week | Sunday            | 0.545229671305732
 Boston Red Sox | Game_Day_of_Week | Thursday          | 0.545577499897059
 Boston Red Sox | Game_Day_of_Week | Tuesday           | 0.545085503545496
 Boston Red Sox | Game_Day_of_Week | Wednesday         | 0.621047828501882

(7 rows)