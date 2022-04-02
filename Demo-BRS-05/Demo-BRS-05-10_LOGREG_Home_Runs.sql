-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Home_Runs_Metric input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Home_Runs_Metric_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Home_Runs_Metric_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Home_Runs_Metric');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Home_Runs_Metric_encoded;

CREATE TABLE BRS_2016_2021_WP_Home_Runs_Metric_encoded 
AS SELECT Key, Game_Date, Team, Home_Runs_Metric, Game_Result, Home_Runs_Metric_0, Home_Runs_Metric_1, Home_Runs_Metric_2                                       FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Home_Runs_Metric_OneHotModel', drop_first='false') 
   FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Home_Runs_Metric_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Home_Runs_Metric_LOGREGModel', 
                     'BRS_2016_2021_WP_Home_Runs_Metric_encoded', 
                     'Game_Result',
                     'Home_Runs_Metric_0, Home_Runs_Metric_1, Home_Runs_Metric_2' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Home_Runs_Metric_probability;

CREATE TABLE BRS_2016_2021_WP_Home_Runs_Metric_probability 
AS (SELECT DISTINCT Team, 'Home_Runs_Metric' AS Game_Metric_Type, Home_Runs_Metric AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Home_Runs_Metric_0, Home_Runs_Metric_1, Home_Runs_Metric_2
           USING PARAMETERS model_name='BRS_2016_2021_WP_Home_Runs_Metric_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Home_Runs_Metric_encoded);


SELECT * FROM BRS_2016_2021_WP_Home_Runs_Metric_probability;


      Team      | Game_Metric_Type | Game_Metric_Value |  Win_Probability
----------------+------------------+-------------------+-------------------
 Boston Red Sox | Home_Runs_Metric | Home_Runs = 0     | 0.377031032742407
 Boston Red Sox | Home_Runs_Metric | Home_Runs = 1     | 0.506414394559368
 Boston Red Sox | Home_Runs_Metric | Home_Runs > 1     | 0.778893214604029

(3 rows)