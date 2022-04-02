-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Extra_Base_Hits_Metric input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Extra_Base_Hits_Metric_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Extra_Base_Hits_Metric_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Extra_Base_Hits_Metric');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Extra_Base_Hits_Metric_encoded;

CREATE TABLE BRS_2016_2021_WP_Extra_Base_Hits_Metric_encoded 
AS SELECT Key, Game_Date, Team, Extra_Base_Hits_Metric, Game_Result, Extra_Base_Hits_Metric_0, Extra_Base_Hits_Metric_1, Extra_Base_Hits_Metric_2               FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Extra_Base_Hits_Metric_OneHotModel', drop_first='false') 
   FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Extra_Base_Hits_Metric_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Extra_Base_Hits_Metric_LOGREGModel', 
                     'BRS_2016_2021_WP_Extra_Base_Hits_Metric_encoded', 
                     'Game_Result',
                     'Extra_Base_Hits_Metric_0, Extra_Base_Hits_Metric_1, Extra_Base_Hits_Metric_2' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Extra_Base_Hits_Metric_probability;

CREATE TABLE BRS_2016_2021_WP_Extra_Base_Hits_Metric_probability 
AS (SELECT DISTINCT Team, 'Extra_Base_Hits_Metric' AS Game_Metric_Type, Extra_Base_Hits_Metric AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Extra_Base_Hits_Metric_0, Extra_Base_Hits_Metric_1, Extra_Base_Hits_Metric_2
           USING PARAMETERS model_name='BRS_2016_2021_WP_Extra_Base_Hits_Metric_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Extra_Base_Hits_Metric_encoded);


SELECT * FROM BRS_2016_2021_WP_Extra_Base_Hits_Metric_probability;


      Team      |    Game_Metric_Type    |      Game_Metric_Value       |  Win_Probability
----------------+------------------------+------------------------------+--------------------
 Boston Red Sox | Extra_Base_Hits_Metric | Extra_Base_Hits = 0          | 0.0937185723568038
 Boston Red Sox | Extra_Base_Hits_Metric | Extra_Base_Hits > 0 but <= 5 |  0.527138655487472
 Boston Red Sox | Extra_Base_Hits_Metric | Extra_Base_Hits > 5          |   0.88406269057941

(3 rows)