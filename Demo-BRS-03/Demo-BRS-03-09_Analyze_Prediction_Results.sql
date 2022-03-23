-------------------------------------------------
--       Analyze the Prediction Results 
-------------------------------------------------

-------------------------------------------------
--       A Logistic Regression (LOGREG)
--    Classification Machine Learning Model 
-------------------------------------------------
--       Was used to try to predict 
--    if the Boston Red Sox will win a game
--     based on what team they are playing
-------------------------------------------------
--     LOGREG can either return a 0 or 1
--         or return the probability 
--        the predicted class will be 1
-------------------------------------------------
--     The input data used in this demo had a 
--       Game_Result response column where
--     Game_Result = 0 = Team Lost the Game
--     Game_Result = 1 = Team Won the Game
-------------------------------------------------
--       The input data contained 6 years 
--        of regular seasons game results 
--          from 2016 through 2021
-------------------------------------------------

-------------------------------------------------
--  Aggregate analytics can find this answer
--   by dividing the wins against an opponent
--  by the number of games played against them
-------------------------------------------------
--    This demo functions a simple example 
--  of how LOGREG probabilities are calculated         
-------------------------------------------------

SELECT 
a.Team, 
a.Opponent, 
a.Win_Probability,
b.Past_Games_Played,
c.Past_Games_Won
FROM
((SELECT DISTINCT Team, Opponent, ML_Prediction AS Win_Probability FROM BRS_2016_2021_prediction_LOGREG ORDER BY Opponent) AS a
INNER JOIN 
(SELECT Opponent, COUNT(*) AS Past_Games_Played FROM BRS_2016_2021_prediction_LOGREG GROUP BY Opponent ORDER BY Opponent) AS b
ON a.Opponent = b.Opponent)
INNER JOIN
(SELECT Opponent, COUNT(*) AS Past_Games_Won FROM BRS_2016_2021_prediction_LOGREG WHERE Game_Result = 1 GROUP BY Opponent ORDER BY Opponent) AS c
ON a.Opponent = c.Opponent;


      Team      |       Opponent        |  Win_Probability  | Past_Games_Played | Past_Games_Won
----------------+-----------------------+-------------------+-------------------+----------------
 Boston Red Sox | Arizona Diamondbacks  | 0.668546431228756 |                 6 |              4
 Boston Red Sox | Atlanta Braves        | 0.650671271806771 |                20 |             13
 Boston Red Sox | Baltimore Orioles     | 0.628597099075963 |               105 |             66
 Boston Red Sox | Chicago Cubs          | 0.664013431018207 |                 3 |              2
 Boston Red Sox | Chicago White Sox     |  0.57045805798456 |                35 |             20
 Boston Red Sox | Cincinnati Reds       | 0.999563365387808 |                 3 |              3
 Boston Red Sox | Cleveland Indians     | 0.562970609167227 |                32 |             18
 Boston Red Sox | Colorado Rockies      | 0.715377113478941 |                 7 |              5
 Boston Red Sox | Detroit Tigers        | 0.515311884302596 |                33 |             17
 Boston Red Sox | Houston Astros        | 0.441041376497563 |                34 |             15
 Boston Red Sox | Kansas City Royals    | 0.614280964855929 |                31 |             19
 Boston Red Sox | Los Angeles Angels    | 0.593391181194699 |                32 |             19
 Boston Red Sox | Los Angeles Dodgers   | 0.320954024997332 |                 6 |              2
 Boston Red Sox | Miami Marlins         | 0.897562453163083 |                10 |              9
 Boston Red Sox | Milwaukee Brewers     | 0.332325144601369 |                 3 |              1
 Boston Red Sox | Minnesota Twins       |  0.61824595899141 |                34 |             21
 Boston Red Sox | New York Mets         | 0.732043065962515 |                11 |              8
 Boston Red Sox | New York Yankees      | 0.428613461396352 |               105 |             45
 Boston Red Sox | Oakland Athletics     | 0.532162630071707 |                32 |             17
 Boston Red Sox | Philadelphia Phillies | 0.545880463555955 |                22 |             12
 Boston Red Sox | Pittsburgh Pirates    | 0.999563365387808 |                 3 |              3
 Boston Red Sox | San Diego Padres      | 0.668546431228756 |                 6 |              4
 Boston Red Sox | San Francisco Giants  |  0.56562654303048 |                 7 |              4
 Boston Red Sox | Seattle Mariners      | 0.559107474951933 |                34 |             19
 Boston Red Sox | St. Louis Cardinals   | 0.999765255387204 |                 4 |              4
 Boston Red Sox | Tampa Bay Rays        | 0.495221466860179 |               105 |             52
 Boston Red Sox | Texas Rangers         |  0.63585651203592 |                33 |             21
 Boston Red Sox | Toronto Blue Jays     | 0.599989754267722 |               105 |             63
 Boston Red Sox | Washington Nationals  | 0.885116022372992 |                 9 |              8

(29 rows)