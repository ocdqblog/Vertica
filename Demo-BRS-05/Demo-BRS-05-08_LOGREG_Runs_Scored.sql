-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Runs_Scored_Metric input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Runs_Scored_Metric_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Runs_Scored_Metric_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Runs_Scored_Metric');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Runs_Scored_Metric_encoded;

CREATE TABLE BRS_2016_2021_WP_Runs_Scored_Metric_encoded 
AS SELECT Key, Game_Date, Team, Runs_Scored_Metric, Game_Result, Runs_Scored_Metric_0, Runs_Scored_Metric_1, Runs_Scored_Metric_2, Runs_Scored_Metric_3, Runs_Scored_Metric_4                                             
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Runs_Scored_Metric_OneHotModel', drop_first='false') FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Runs_Scored_Metric_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Runs_Scored_Metric_LOGREGModel', 
                     'BRS_2016_2021_WP_Runs_Scored_Metric_encoded', 
                     'Game_Result',
                     'Runs_Scored_Metric_0, Runs_Scored_Metric_1, Runs_Scored_Metric_2, Runs_Scored_Metric_3, Runs_Scored_Metric_4' 
                      USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Runs_Scored_Metric_probability;

CREATE TABLE BRS_2016_2021_WP_Runs_Scored_Metric_probability 
AS (SELECT DISTINCT Team, 'Runs_Scored_Metric' AS Game_Metric_Type, Runs_Scored_Metric AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Runs_Scored_Metric_0, Runs_Scored_Metric_1, Runs_Scored_Metric_2, Runs_Scored_Metric_3, Runs_Scored_Metric_4
           USING PARAMETERS model_name='BRS_2016_2021_WP_Runs_Scored_Metric_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Runs_Scored_Metric_encoded);


SELECT * FROM BRS_2016_2021_WP_Runs_Scored_Metric_probability;


      Team      |  Game_Metric_Type  |    Game_Metric_Value     |  Win_Probability
----------------+--------------------+--------------------------+--------------------
 Boston Red Sox | Runs_Scored_Metric | Runs_Scored <= 1         | 0.0708079996308489
 Boston Red Sox | Runs_Scored_Metric | Runs_Scored = 2 or 3     |  0.235052238220583
 Boston Red Sox | Runs_Scored_Metric | Runs_Scored = 4 or 5     |  0.608161316765206
 Boston Red Sox | Runs_Scored_Metric | Runs_Scored > 5 but <= 9 |  0.835985403811156
 Boston Red Sox | Runs_Scored_Metric | Runs_Scored >= 10        |  0.979166715428108

(5 rows)