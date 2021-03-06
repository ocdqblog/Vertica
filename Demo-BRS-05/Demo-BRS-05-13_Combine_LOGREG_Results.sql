---------------------------------------------------------
--  Combine Results produced by performing (seperately)
--   Classification using Logistic Regression (LOGREG)
--    To determine the Boston Red Sox Win Probability 
--           Based on the input columns:
--                  Opponent
--              Opponent_Division
--                  Game_Month
--               Game_Day_of_Week
--              Runs_Scored_Metric
--                 Hits_Metric
--              Home_Runs_Metric
--             Extra_Base_Hits_Metric
--         Walks_Minus_Strikeouts_Metric 
---------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_win_probability;

CREATE TABLE BRS_2016_2021_win_probability
AS
SELECT * FROM BRS_2016_2021_WP_Opponent_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Opponent_Division_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Game_Month_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Game_Day_of_Week_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Runs_Scored_Metric_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Hits_Metric_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Home_Runs_Metric_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Extra_Base_Hits_Metric_probability
UNION 
SELECT * FROM BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_probability;


SELECT * FROM BRS_2016_2021_win_probability ORDER BY Game_Metric_Type, Win_Probability DESC;


      Team      |       Game_Metric_Type        |       Game_Metric_Value       |  Win_Probability
----------------+-------------------------------+-------------------------------+--------------------
 Boston Red Sox | Extra_Base_Hits_Metric        | Extra_Base_Hits > 5           |   0.88406269057941
 Boston Red Sox | Extra_Base_Hits_Metric        | Extra_Base_Hits > 0 but <= 5  |  0.527138655487472
 Boston Red Sox | Extra_Base_Hits_Metric        | Extra_Base_Hits = 0           | 0.0937185723568038
 Boston Red Sox | Game_Day_of_Week              | Wednesday                     |  0.621047828501882
 Boston Red Sox | Game_Day_of_Week              | Friday                        |  0.608399241528952
 Boston Red Sox | Game_Day_of_Week              | Monday                        |  0.569007177636546
 Boston Red Sox | Game_Day_of_Week              | Thursday                      |  0.545577499897059
 Boston Red Sox | Game_Day_of_Week              | Sunday                        |  0.545229671305732
 Boston Red Sox | Game_Day_of_Week              | Tuesday                       |  0.545085503545496
 Boston Red Sox | Game_Day_of_Week              | Saturday                      |  0.537358445953015
 Boston Red Sox | Game_Month                    | May                           |  0.601002449077947
 Boston Red Sox | Game_Month                    | April                         |   0.59568109909801
 Boston Red Sox | Game_Month                    | July                          |  0.577495325768641
 Boston Red Sox | Game_Month                    | September                     |  0.564727896623445
 Boston Red Sox | Game_Month                    | June                          |  0.558794823547582
 Boston Red Sox | Game_Month                    | August                        |  0.529920323470617
 Boston Red Sox | Game_Month                    | October                       |   0.49710113029989
 Boston Red Sox | Game_Month                    | March                         |  0.429814809179887
 Boston Red Sox | Hits_Metric                   | Hits >= 10                    |  0.773095177180053
 Boston Red Sox | Hits_Metric                   | Hits > 3 but <= 9             |  0.428277784176889
 Boston Red Sox | Hits_Metric                   | Hits <= 3                     | 0.0416183089684483
 Boston Red Sox | Home_Runs_Metric              | Home_Runs > 1                 |  0.778893214604029
 Boston Red Sox | Home_Runs_Metric              | Home_Runs = 1                 |  0.506414394559368
 Boston Red Sox | Home_Runs_Metric              | Home_Runs = 0                 |  0.377031032742407
 Boston Red Sox | Opponent                      | St. Louis Cardinals           |  0.999765255387205
 Boston Red Sox | Opponent                      | Cincinnati Reds               |  0.999563365387808
 Boston Red Sox | Opponent                      | Pittsburgh Pirates            |  0.999563365387808
 Boston Red Sox | Opponent                      | Miami Marlins                 |   0.89756245316308
 Boston Red Sox | Opponent                      | Washington Nationals          |  0.885116022372991
 Boston Red Sox | Opponent                      | New York Mets                 |  0.732043065962515
 Boston Red Sox | Opponent                      | Colorado Rockies              |  0.715377113478947
 Boston Red Sox | Opponent                      | Arizona Diamondbacks          |  0.668546431228763
 Boston Red Sox | Opponent                      | San Diego Padres              |  0.668546431228756
 Boston Red Sox | Opponent                      | Chicago Cubs                  |  0.664013431018202
 Boston Red Sox | Opponent                      | Atlanta Braves                |  0.650671271806771
 Boston Red Sox | Opponent                      | Texas Rangers                 |   0.63585651203592
 Boston Red Sox | Opponent                      | Baltimore Orioles             |  0.628597099075963
 Boston Red Sox | Opponent                      | Minnesota Twins               |  0.618245958991409
 Boston Red Sox | Opponent                      | Kansas City Royals            |   0.61428096485593
 Boston Red Sox | Opponent                      | Toronto Blue Jays             |  0.599989754267722
 Boston Red Sox | Opponent                      | Los Angeles Angels            |  0.593391181194701
 Boston Red Sox | Opponent                      | Chicago White Sox             |  0.570458057984563
 Boston Red Sox | Opponent                      | San Francisco Giants          |  0.565626543030477
 Boston Red Sox | Opponent                      | Cleveland Guardians (Indians) |  0.562970609167229
 Boston Red Sox | Opponent                      | Seattle Mariners              |  0.559107474951931
 Boston Red Sox | Opponent                      | Philadelphia Phillies         |   0.54588046355595
 Boston Red Sox | Opponent                      | Oakland Athletics             |  0.532162630071707
 Boston Red Sox | Opponent                      | Detroit Tigers                |  0.515311884302596
 Boston Red Sox | Opponent                      | Tampa Bay Rays                |  0.495221466860179
 Boston Red Sox | Opponent                      | Houston Astros                |  0.441041376497563
 Boston Red Sox | Opponent                      | New York Yankees              |  0.428613461396352
 Boston Red Sox | Opponent                      | Milwaukee Brewers             |  0.332325144601367
 Boston Red Sox | Opponent                      | Los Angeles Dodgers           |  0.320954024997328
 Boston Red Sox | Opponent_Division             | National League (NL) Central  |  0.812404484526841
 Boston Red Sox | Opponent_Division             | National League (NL) East     |  0.693482373353625
 Boston Red Sox | Opponent_Division             | National League (NL) West     |  0.598872010612162
 Boston Red Sox | Opponent_Division             | American League (AL) Central  |   0.57581242110488
 Boston Red Sox | Opponent_Division             | American League (AL) West     |  0.551103597026283
 Boston Red Sox | Opponent_Division             | American League (AL) East     |   0.53806786716387
 Boston Red Sox | Runs_Scored_Metric            | Runs_Scored >= 10             |  0.979166715428108
 Boston Red Sox | Runs_Scored_Metric            | Runs_Scored > 5 but <= 9      |  0.835985403811156
 Boston Red Sox | Runs_Scored_Metric            | Runs_Scored = 4 or 5          |  0.608161316765206
 Boston Red Sox | Runs_Scored_Metric            | Runs_Scored = 2 or 3          |  0.235052238220583
 Boston Red Sox | Runs_Scored_Metric            | Runs_Scored <= 1              | 0.0708079996308489
 Boston Red Sox | Walks_Minus_Strikeouts_Metric | Walks = Strikeouts            |  0.815852604905327
 Boston Red Sox | Walks_Minus_Strikeouts_Metric | Walks > Strikeouts            |  0.787866281700013
 Boston Red Sox | Walks_Minus_Strikeouts_Metric | Strikeouts > Walks            |  0.536552724986346

(67 rows)