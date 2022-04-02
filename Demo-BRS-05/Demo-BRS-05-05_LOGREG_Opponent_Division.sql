-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Opponent_Division_Division input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Opponent_Division_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Opponent_Division_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Opponent_Division');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Opponent_Division_encoded;

CREATE TABLE BRS_2016_2021_WP_Opponent_Division_encoded 
AS SELECT Key, Game_Date, Team, Opponent_Division, Game_Result, Opponent_Division_0, Opponent_Division_1, Opponent_Division_2, Opponent_Division_3, Opponent_Division_4, Opponent_Division_5                                           
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Opponent_Division_OneHotModel', drop_first='false') FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Opponent_Division_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Opponent_Division_LOGREGModel', 
                     'BRS_2016_2021_WP_Opponent_Division_encoded', 
                     'Game_Result',
                     'Opponent_Division_0, Opponent_Division_1, Opponent_Division_2, Opponent_Division_3, Opponent_Division_4, Opponent_Division_5' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Opponent_Division_probability;

CREATE TABLE BRS_2016_2021_WP_Opponent_Division_probability 
AS (SELECT DISTINCT Team, 'Opponent_Division' AS Game_Metric_Type, Opponent_Division AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Opponent_Division_0, Opponent_Division_1, Opponent_Division_2, Opponent_Division_3, Opponent_Division_4, Opponent_Division_5
           USING PARAMETERS model_name='BRS_2016_2021_WP_Opponent_Division_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Opponent_Division_encoded);


SELECT * FROM BRS_2016_2021_WP_Opponent_Division_probability;


      Team      | Game_Metric_Type  |      Game_Metric_Value       |  Win_Probability
----------------+-------------------+------------------------------+-------------------
 Boston Red Sox | Opponent_Division | American League (AL) Central |  0.57581242110488
 Boston Red Sox | Opponent_Division | American League (AL) East    |  0.53806786716387
 Boston Red Sox | Opponent_Division | American League (AL) West    | 0.551103597026283
 Boston Red Sox | Opponent_Division | National League (NL) Central | 0.812404484526841
 Boston Red Sox | Opponent_Division | National League (NL) East    | 0.693482373353625
 Boston Red Sox | Opponent_Division | National League (NL) West    | 0.598872010612162

(6 rows)