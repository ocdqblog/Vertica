-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Hits_Metric input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Hits_Metric_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Hits_Metric_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Hits_Metric');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Hits_Metric_encoded;

CREATE TABLE BRS_2016_2021_WP_Hits_Metric_encoded 
AS SELECT Key, Game_Date, Team, Hits_Metric, Game_Result, Hits_Metric_0, Hits_Metric_1, Hits_Metric_2                                            
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Hits_Metric_OneHotModel', drop_first='false') FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Hits_Metric_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Hits_Metric_LOGREGModel', 
                     'BRS_2016_2021_WP_Hits_Metric_encoded', 
                     'Game_Result',
                     'Hits_Metric_0, Hits_Metric_1, Hits_Metric_2' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Hits_Metric_probability;

CREATE TABLE BRS_2016_2021_WP_Hits_Metric_probability 
AS (SELECT DISTINCT Team, 'Hits_Metric' AS Game_Metric_Type, Hits_Metric AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Hits_Metric_0, Hits_Metric_1, Hits_Metric_2
           USING PARAMETERS model_name='BRS_2016_2021_WP_Hits_Metric_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Hits_Metric_encoded);


SELECT * FROM BRS_2016_2021_WP_Hits_Metric_probability;


      Team      | Game_Metric_Type | Game_Metric_Value |  Win_Probability
----------------+------------------+-------------------+--------------------
 Boston Red Sox | Hits_Metric      | Hits <= 3         | 0.0416183089684483
 Boston Red Sox | Hits_Metric      | Hits > 3 but <= 9 |  0.428277784176889
 Boston Red Sox | Hits_Metric      | Hits >= 10        |  0.773095177180053

(3 rows)