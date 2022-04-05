---------------------------------------------------------
--     Classification using Naive Bayes (BAYES)  
---------------------------------------------------------

---------------------------------------------------------
--     Create the input table   
---------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_WP_BAYES_input;

CREATE TABLE BRS_2016_2021_WP_BAYES_input
AS SELECT  
a.Key,
a.Game_Date,
a.Game_Month,
a.Game_Day_of_Week,
a.Team,
a.Opponent,
a.Opponent_Division,
a.Game_Result,
a.Runs_Scored,
a.Runs_Scored_Metric,
b.Runs_Scored_Metric_0, 
b.Runs_Scored_Metric_1, 
b.Runs_Scored_Metric_2, 
b.Runs_Scored_Metric_3, 
b.Runs_Scored_Metric_4,
a.Hits,
a.Hits_Metric,
c.Hits_Metric_0, 
c.Hits_Metric_1, 
c.Hits_Metric_2,
a.Doubles,
a.Triples,
a.Home_Runs,
a.Home_Runs_Metric,
d.Home_Runs_Metric_0, 
d.Home_Runs_Metric_1, 
d.Home_Runs_Metric_2,
a.Extra_Base_Hits,
a.Extra_Base_Hits_Metric,
e.Extra_Base_Hits_Metric_0, 
e.Extra_Base_Hits_Metric_1, 
e.Extra_Base_Hits_Metric_2, 
a.Walks,
a.Strikeouts,
a.Walks_Minus_Strikeouts,
a.Walks_Minus_Strikeouts_Metric,
f.Walks_Minus_Strikeouts_Metric_0, 
f.Walks_Minus_Strikeouts_Metric_1, 
f.Walks_Minus_Strikeouts_Metric_2 

FROM (SELECT * FROM BRS_2016_2021_WP_input ORDER BY Key) AS a

INNER JOIN 
(SELECT * FROM BRS_2016_2021_WP_Runs_Scored_Metric_encoded ORDER BY Key) AS b
ON a.Key = b.Key

INNER JOIN 
(SELECT * FROM BRS_2016_2021_WP_Hits_Metric_encoded ORDER BY Key) AS c
ON a.Key = c.Key

INNER JOIN 
(SELECT * FROM BRS_2016_2021_WP_Home_Runs_Metric_encoded ORDER BY Key) AS d
ON a.Key = d.Key

INNER JOIN 
(SELECT * FROM BRS_2016_2021_WP_Extra_Base_Hits_Metric_encoded ORDER BY Key) AS e
ON a.Key = e.Key

INNER JOIN 
(SELECT * FROM BRS_2016_2021_WP_Walks_Minus_Strikeouts_Metric_encoded ORDER BY Key) AS f
ON a.Key = f.Key;


SELECT COUNT(*) AS Row_Count FROM BRS_2016_2021_WP_BAYES_input;


 Row_Count
-----------
       870

(1 row)


SELECT * FROM BRS_2016_2021_WP_BAYES_input LIMIT 1;


 Key | Game_Date  | Game_Month | Game_Day_of_Week |      Team      |           Opponent            |      Opponent_Division       | Game_Result | Runs_Scored |    Runs_Scored_Metric    | Runs_Scored_Metric_0 | Runs_Scored_Metric_1 | Runs_Scored_Metric_2 | Runs_Scored_Metric_3 | Runs_Scored_Metric_4 | Hits | Hits_Metric | Hits_Metric_0 | Hits_Metric_1 | Hits_Metric_2 | Doubles | Triples | Home_Runs | Home_Runs_Metric | Home_Runs_Metric_0 | Home_Runs_Metric_1 | Home_Runs_Metric_2 | Extra_Base_Hits |    Extra_Base_Hits_Metric    | Extra_Base_Hits_Metric_0 | Extra_Base_Hits_Metric_1 | Extra_Base_Hits_Metric_2 | Walks | Strikeouts | Walks_Minus_Strikeouts | Walks_Minus_Strikeouts_Metric | Walks_Minus_Strikeouts_Metric_0 | Walks_Minus_Strikeouts_Metric_1 | Walks_Minus_Strikeouts_Metric_2
-----+------------+------------+------------------+----------------+-------------------------------+------------------------------+-------------+-------------+--------------------------+----------------------+----------------------+----------------------+----------------------+----------------------+------+-------------+---------------+---------------+---------------+---------+---------+-----------+------------------+--------------------+--------------------+--------------------+-----------------+------------------------------+--------------------------+--------------------------+--------------------------+-------+------------+------------------------+-------------------------------+---------------------------------+---------------------------------+---------------------------------
   1 | 2016-04-05 | April      | Tuesday          | Boston Red Sox | Cleveland Guardians (Indians) | American League (AL) Central |           1 |           6 | Runs_Scored > 5 but <= 9 |                    0 |                    0 |                    0 |                    1 |                    0 |   11 | Hits >= 10  |             0 |             0 |             1 |       1 |       0 |         2 | Home_Runs > 1    |                  0 |                  0 |                  1 |               3 | Extra_Base_Hits > 0 but <= 5 |                        0 |                        1 |                        0 |     6 |          8 |                     -2 | Strikeouts > Walks            |                               1 |                               0 |                               0

(1 row)