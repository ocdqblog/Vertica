-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--          On the Game_Month input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Game_Month_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Game_Month_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Game_Month');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Game_Month_encoded;

CREATE TABLE BRS_2016_2021_WP_Game_Month_encoded 
AS SELECT Key, Game_Date, Team, Game_Month, Game_Result, Game_Month_0, Game_Month_1, Game_Month_2, Game_Month_3, Game_Month_4, Game_Month_5, Game_Month_6, Game_Month_7                                             
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Game_Month_OneHotModel', drop_first='false') FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Game_Month_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Game_Month_LOGREGModel', 
                     'BRS_2016_2021_WP_Game_Month_encoded', 
                     'Game_Result',
                     'Game_Month_0, Game_Month_1, Game_Month_2, Game_Month_3, Game_Month_4, Game_Month_5, Game_Month_6, Game_Month_7' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Game_Month_probability;

CREATE TABLE BRS_2016_2021_WP_Game_Month_probability 
AS (SELECT DISTINCT Team, 'Game_Month' AS Game_Metric_Type, Game_Month AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Game_Month_0, Game_Month_1, Game_Month_2, Game_Month_3, Game_Month_4, Game_Month_5, Game_Month_6, Game_Month_7
           USING PARAMETERS model_name='BRS_2016_2021_WP_Game_Month_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Game_Month_encoded);


SELECT * FROM BRS_2016_2021_WP_Game_Month_probability;


      Team      | Game_Metric_Type | Game_Metric_Value |  Win_Probability
----------------+------------------+-------------------+-------------------
 Boston Red Sox | Game_Month       | April             |  0.59568109909801
 Boston Red Sox | Game_Month       | August            | 0.529920323470617
 Boston Red Sox | Game_Month       | July              | 0.577495325768641
 Boston Red Sox | Game_Month       | June              | 0.558794823547582
 Boston Red Sox | Game_Month       | March             | 0.429814809179887
 Boston Red Sox | Game_Month       | May               | 0.601002449077947
 Boston Red Sox | Game_Month       | October           |  0.49710113029989
 Boston Red Sox | Game_Month       | September         | 0.564727896623445

(8 rows)