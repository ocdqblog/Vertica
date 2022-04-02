-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--       On the Walks_Minus_Strikeouts_Metric input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Walks_Minus_Strikeouts_Metric');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_encoded;

CREATE TABLE BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_encoded 
AS SELECT Key, Game_Date, Team, Walks_Minus_Strikeouts_Metric, Game_Result, Walks_Minus_Strikeouts_Metric_0, Walks_Minus_Strikeouts_Metric_1, Walks_Minus_Strikeouts_Metric_2                                            
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_OneHotModel', drop_first='false') FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_LOGREGModel', 
                     'BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_encoded', 
                     'Game_Result',
                     'Walks_Minus_Strikeouts_Metric_0, Walks_Minus_Strikeouts_Metric_1, Walks_Minus_Strikeouts_Metric_2' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_probability;

CREATE TABLE BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_probability 
AS (SELECT DISTINCT Team, 'Walks_Minus_Strikeouts_Metric' AS Game_Metric_Type, Walks_Minus_Strikeouts_Metric AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Walks_Minus_Strikeouts_Metric_0, Walks_Minus_Strikeouts_Metric_1, Walks_Minus_Strikeouts_Metric_2
           USING PARAMETERS model_name='BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_encoded);


SELECT * FROM BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_probability;


      Team      |       Game_Metric_Type        | Game_Metric_Value  |  Win_Probability
----------------+-------------------------------+--------------------+-------------------
 Boston Red Sox | Walks_Minus_Strikeouts_Metric | Strikeouts > Walks | 0.544068933493066
 Boston Red Sox | Walks_Minus_Strikeouts_Metric | Walks = Strikeouts | 0.816077867824191
 Boston Red Sox | Walks_Minus_Strikeouts_Metric | Walks > Strikeouts | 0.641503712159098

(3 rows)