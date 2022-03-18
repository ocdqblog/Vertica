-------------------------------------------------
-- Comparing the Classification Model Results 
-------------------------------------------------

-------------------------------------------------
-- Good example of the challenge of prediction
--  is looking at how both models handled the
--  9 input rows misclassified by the SVM Model
-------------------------------------------------

SELECT * FROM BRS_2021_prediction_SVM WHERE Game_Result != ML_Prediction; 

 Key | Game_Date  | Game_Result | ML_Prediction | Predictor_Column | Predictor_Value | At_Bats | Runs_Scored | Hits | Runs_Batted_In | Walks | Strikeouts | Batting_Average | On_Base_Percentage | Slugging_Percentage | OnBase_Plus_Slugging
-----+------------+-------------+---------------+------------------+-----------------+---------+-------------+------+----------------+-------+------------+-----------------+--------------------+---------------------+----------------------
  11 | 2021-04-14 |           1 |             0 | Runs_Scored      |               3 |      32 |           3 |   11 |              2 |     3 |          7 |           0.344 |                0.4 |               0.438 |                0.838
  24 | 2021-04-27 |           1 |             0 | Runs_Scored      |               2 |      29 |           2 |    5 |              2 |     2 |          8 |           0.172 |              0.226 |               0.345 |                0.571
  25 | 2021-04-28 |           1 |             0 | Runs_Scored      |               1 |      30 |           1 |    4 |              1 |     1 |         15 |           0.133 |              0.161 |               0.233 |                0.395
  28 | 2021-05-01 |           0 |             1 | Runs_Scored      |               6 |      38 |           6 |   12 |              6 |     4 |         12 |           0.316 |              0.372 |               0.447 |                0.819
  31 | 2021-05-05 |           0 |             1 | Runs_Scored      |               5 |      39 |           5 |    9 |              5 |     6 |          8 |           0.231 |              0.348 |               0.333 |                0.681
  42 | 2021-05-16 |           0 |             1 | Runs_Scored      |               5 |      35 |           5 |    9 |              5 |     2 |         14 |           0.257 |              0.297 |               0.486 |                0.783
  52 | 2021-05-29 |           1 |             0 | Runs_Scored      |               3 |      35 |           3 |   12 |              3 |     0 |          6 |           0.343 |              0.343 |               0.486 |                0.829
  66 | 2021-06-13 |           0 |             1 | Runs_Scored      |               4 |      32 |           4 |    6 |              4 |     4 |         12 |           0.188 |              0.278 |               0.406 |                0.684
  67 | 2021-06-14 |           1 |             0 | Runs_Scored      |               2 |      31 |           2 |    7 |              2 |     1 |          7 |           0.226 |               0.25 |               0.258 |                0.508

(9 rows)

SELECT * FROM BRS_2021_prediction_RF WHERE Key IN (11,24,25,28,31,42,52,66,67);

 Key | Game_Date  | Game_Result | ML_Prediction | At_Bats | Runs_Scored | Hits | Runs_Batted_In | Walks | Strikeouts | Batting_Average | On_Base_Percentage | Slugging_Percentage | OnBase_Plus_Slugging
-----+------------+-------------+---------------+---------+-------------+------+----------------+-------+------------+-----------------+--------------------+---------------------+----------------------
  11 | 2021-04-14 |           1 | 1             |      32 |           3 |   11 |              2 |     3 |          7 |           0.344 |                0.4 |               0.438 |                0.838
  24 | 2021-04-27 |           1 | 0             |      29 |           2 |    5 |              2 |     2 |          8 |           0.172 |              0.226 |               0.345 |                0.571
  25 | 2021-04-28 |           1 | 1             |      30 |           1 |    4 |              1 |     1 |         15 |           0.133 |              0.161 |               0.233 |                0.395
  28 | 2021-05-01 |           0 | 1             |      38 |           6 |   12 |              6 |     4 |         12 |           0.316 |              0.372 |               0.447 |                0.819
  31 | 2021-05-05 |           0 | 0             |      39 |           5 |    9 |              5 |     6 |          8 |           0.231 |              0.348 |               0.333 |                0.681
  42 | 2021-05-16 |           0 | 0             |      35 |           5 |    9 |              5 |     2 |         14 |           0.257 |              0.297 |               0.486 |                0.783
  52 | 2021-05-29 |           1 | 1             |      35 |           3 |   12 |              3 |     0 |          6 |           0.343 |              0.343 |               0.486 |                0.829
  66 | 2021-06-13 |           0 | 0             |      32 |           4 |    6 |              4 |     4 |         12 |           0.188 |              0.278 |               0.406 |                0.684
  67 | 2021-06-14 |           1 | 1             |      31 |           2 |    7 |              2 |     1 |          7 |           0.226 |               0.25 |               0.258 |                0.508

(9 rows)

-- In the above results, both models incorrectly predicted Keys 24 and 28.
-- On Key 28, the Team scored 6 runs, so it's not surprising that both models incorrectly predicted Win.
-- On Key 24, the Team only scored 2 runs, so it's not surprising that both models incorrectly predicted Loss.

-- (REMEMBER: RF is looking at all the non-response columns while SVM is only looking at Runs_Scored)

-- On Key 67, the Team also only scored 2 runs, but RF correctly predicted Win, while SVM incorrectly predicted Loss.
-- On Key 25, the Team only scored 1 run, so it's not surprising that SVM incorrectly predicted Loss, but RF correctly predicted Win.
-- On Keys 11 and 52, the Team scored 3 runs, SVM incorrectly predicted Loss, while RF correctly predicted Win.
-- On Key 66, the Team scored 4 runs, SVM incorrectly predicted Win, while RF correctly predicted Loss.
-- On Keys 31 and 42, the Team scored 5 runs, SVM incorrectly predicted Win, while RF correctly predicted Loss.

-- (REMEMBER: This demo only trained/tested on 81 input rows. The results produced by both models would change if more data was processed.)

