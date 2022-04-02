-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
--          On the Opponent input column 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_Opponent_OneHotModel;

SELECT ONE_HOT_ENCODER_FIT ('BRS_2016_2021_WP_Opponent_OneHotModel',
                            'BRS_2016_2021_WP_input',
                            'Opponent');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Opponent_encoded;

CREATE TABLE BRS_2016_2021_WP_Opponent_encoded 
AS SELECT Key, Game_Date, Team, Opponent, Game_Result, Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28                                             
FROM (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='BRS_2016_2021_WP_Opponent_OneHotModel', drop_first='false') FROM BRS_2016_2021_WP_input) AS Coming_In_Hot;


DROP MODEL IF EXISTS BRS_2016_2021_WP_Opponent_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_WP_Opponent_LOGREGModel', 
                     'BRS_2016_2021_WP_Opponent_encoded', 
                     'Game_Result',
                     'Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28' USING PARAMETERS optimizer='BFGS');


DROP TABLE IF EXISTS BRS_2016_2021_WP_Opponent_probability;

CREATE TABLE BRS_2016_2021_WP_Opponent_probability 
AS (SELECT DISTINCT Team, 'Opponent' AS Game_Metric_Type, Opponent AS Game_Metric_Value,
           PREDICT_LOGISTIC_REG (Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28
           USING PARAMETERS model_name='BRS_2016_2021_WP_Opponent_LOGREGModel', type = 'probability') AS Win_Probability  
    FROM BRS_2016_2021_WP_Opponent_encoded);


SELECT * FROM BRS_2016_2021_WP_Opponent_probability;


      Team      | Game_Metric_Type |       Game_Metric_Value       |  Win_Probability
----------------+------------------+-------------------------------+-------------------
 Boston Red Sox | Opponent         | Arizona Diamondbacks          | 0.668546431228763
 Boston Red Sox | Opponent         | Atlanta Braves                | 0.650671271806771
 Boston Red Sox | Opponent         | Baltimore Orioles             | 0.628597099075963
 Boston Red Sox | Opponent         | Chicago Cubs                  | 0.664013431018202
 Boston Red Sox | Opponent         | Chicago White Sox             | 0.570458057984563
 Boston Red Sox | Opponent         | Cincinnati Reds               | 0.999563365387808
 Boston Red Sox | Opponent         | Cleveland Guardians (Indians) | 0.562970609167229
 Boston Red Sox | Opponent         | Colorado Rockies              | 0.715377113478947
 Boston Red Sox | Opponent         | Detroit Tigers                | 0.515311884302596
 Boston Red Sox | Opponent         | Houston Astros                | 0.441041376497563
 Boston Red Sox | Opponent         | Kansas City Royals            |  0.61428096485593
 Boston Red Sox | Opponent         | Los Angeles Angels            | 0.593391181194701
 Boston Red Sox | Opponent         | Los Angeles Dodgers           | 0.320954024997328
 Boston Red Sox | Opponent         | Miami Marlins                 |  0.89756245316308
 Boston Red Sox | Opponent         | Milwaukee Brewers             | 0.332325144601367
 Boston Red Sox | Opponent         | Minnesota Twins               | 0.618245958991409
 Boston Red Sox | Opponent         | New York Mets                 | 0.732043065962515
 Boston Red Sox | Opponent         | New York Yankees              | 0.428613461396352
 Boston Red Sox | Opponent         | Oakland Athletics             | 0.532162630071707
 Boston Red Sox | Opponent         | Philadelphia Phillies         |  0.54588046355595
 Boston Red Sox | Opponent         | Pittsburgh Pirates            | 0.999563365387808
 Boston Red Sox | Opponent         | San Diego Padres              | 0.668546431228756
 Boston Red Sox | Opponent         | San Francisco Giants          | 0.565626543030477
 Boston Red Sox | Opponent         | Seattle Mariners              | 0.559107474951931
 Boston Red Sox | Opponent         | St. Louis Cardinals           | 0.999765255387205
 Boston Red Sox | Opponent         | Tampa Bay Rays                | 0.495221466860179
 Boston Red Sox | Opponent         | Texas Rangers                 |  0.63585651203592
 Boston Red Sox | Opponent         | Toronto Blue Jays             | 0.599989754267722
 Boston Red Sox | Opponent         | Washington Nationals          | 0.885116022372991

(29 rows)