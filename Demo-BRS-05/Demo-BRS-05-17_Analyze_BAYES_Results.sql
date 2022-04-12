---------------------------------------------------------------
--  Analyze Naive Bayes (BAYES) Classification Model Results
---------------------------------------------------------------

SELECT * FROM BRS_2016_2021_WP_BAYES_metrics;


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss | ML_Prediction_Errors | ML_Accuracy | ML_Precision | ML_Recall_Sensitivity | ML_Specificity
----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------+-------------+--------------+-----------------------+----------------
                        397 |                         271 |                          105 |                            97 |                  202 |       0.768 |        0.791 |                 0.804 |          0.721

(1 row)


---------------------------------------------------------
--      Examining All BAYES Prediction Errors  
---------------------------------------------------------

SELECT 
Key, 
Game_Date, 
Team, 
Opponent, 
Game_Result, 
ML_Prediction, 
ML_Probability,
Runs_Scored_Metric,
Hits_Metric,
Home_Runs_Metric,
Extra_Base_Hits_Metric,
Walks_Minus_Strikeouts_Metric

FROM 
BRS_2016_2021_WP_BAYES_probability 

WHERE 
Game_Result != ML_Prediction

ORDER BY
Runs_Scored DESC; 


 Key | Game_Date  |      Team      |           Opponent            | Game_Result | ML_Prediction |  ML_Probability   |    Runs_Scored_Metric    |    Hits_Metric    | Home_Runs_Metric |    Extra_Base_Hits_Metric    | Walks_Minus_Strikeout
s_Metric
-----+------------+----------------+-------------------------------+-------------+---------------+-------------------+--------------------------+-------------------+------------------+------------------------------+----------------------
---------
 569 | 2019-06-29 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.999690966244088 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Walks > Strikeouts
 848 | 2021-09-06 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             |  0.99680270172364 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 542 | 2019-05-29 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
  95 | 2016-07-23 | Boston Red Sox | Minnesota Twins               |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  53 | 2016-06-01 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
  49 | 2016-05-28 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 822 | 2021-08-08 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.817970988675918 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 690 | 2020-09-06 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 667 | 2020-08-13 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.966858432220726 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 5          | Strikeouts > Walks
 570 | 2019-06-30 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 495 | 2019-04-05 | Boston Red Sox | Arizona Diamondbacks          |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 490 | 2019-03-31 | Boston Red Sox | Seattle Mariners              |           0 | 1             |  0.94583163837044 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 276 | 2017-08-09 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.500673231738528 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  98 | 2016-07-26 | Boston Red Sox | Detroit Tigers                |           0 | 1             | 0.851171434549553 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  15 | 2016-04-21 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 849 | 2021-09-07 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 706 | 2020-09-25 | Boston Red Sox | Atlanta Braves                |           0 | 1             |  0.85329293348213 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 687 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 664 | 2020-08-10 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 658 | 2020-08-02 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 568 | 2019-06-26 | Boston Red Sox | Chicago White Sox             |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 564 | 2019-06-22 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.627256096751927 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 420 | 2018-07-13 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.817970988675918 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 335 | 2018-04-11 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 194 | 2017-05-09 | Boston Red Sox | Milwaukee Brewers             |           0 | 1             | 0.980089955455607 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
  76 | 2016-06-27 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  54 | 2016-06-02 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
   6 | 2016-04-11 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 836 | 2021-08-25 | Boston Red Sox | Minnesota Twins               |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 792 | 2021-07-03 | Boston Red Sox | Oakland Athletics             |           0 | 1             | 0.627256096751927 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 736 | 2021-05-01 | Boston Red Sox | Texas Rangers                 |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 672 | 2020-08-18 | Boston Red Sox | Philadelphia Phillies         |           0 | 1             | 0.817970988675918 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 636 | 2019-09-17 | Boston Red Sox | San Francisco Giants          |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 593 | 2019-07-28 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 484 | 2018-09-28 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.627256096751927 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 427 | 2018-07-24 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.851171434549553 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 395 | 2018-06-15 | Boston Red Sox | Seattle Mariners              |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 360 | 2018-05-09 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 353 | 2018-05-01 | Boston Red Sox | Kansas City Royals            |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 350 | 2018-04-28 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 336 | 2018-04-12 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.500673231738528 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 289 | 2017-08-24 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.851171434549553 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 260 | 2017-07-21 | Boston Red Sox | Los Angeles Angels            |           1 | 0             | 0.500673231738528 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 259 | 2017-07-20 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.627256096751927 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  71 | 2016-06-22 | Boston Red Sox | Chicago White Sox             |           0 | 1             | 0.958590994968755 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
  36 | 2016-05-13 | Boston Red Sox | Houston Astros                |           0 | 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
   2 | 2016-04-06 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 847 | 2021-09-05 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.938329771523953 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 842 | 2021-08-31 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 840 | 2021-08-29 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 814 | 2021-07-31 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 808 | 2021-07-25 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 784 | 2021-06-25 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 765 | 2021-06-04 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 764 | 2021-06-03 | Boston Red Sox | Houston Astros                |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 759 | 2021-05-28 | Boston Red Sox | Miami Marlins                 |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 750 | 2021-05-16 | Boston Red Sox | Los Angeles Angels            |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 731 | 2021-04-25 | Boston Red Sox | Seattle Mariners              |           1 | 0             | 0.515161269677407 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 700 | 2020-09-18 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 691 | 2020-09-08 | Boston Red Sox | Philadelphia Phillies         |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 669 | 2020-08-15 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 666 | 2020-08-12 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 645 | 2019-09-26 | Boston Red Sox | Texas Rangers                 |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 629 | 2019-09-08 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 624 | 2019-09-03 | Boston Red Sox | Minnesota Twins               |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 608 | 2019-08-12 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.981028345139191 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 595 | 2019-07-31 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 594 | 2019-07-30 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 554 | 2019-06-11 | Boston Red Sox | Texas Rangers                 |           0 | 1             | 0.919849327771591 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 551 | 2019-06-08 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 541 | 2019-05-28 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 498 | 2019-04-09 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 485 | 2018-09-29 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 464 | 2018-09-04 | Boston Red Sox | Atlanta Braves                |           1 | 0             | 0.515161269677407 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 448 | 2018-08-18 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 440 | 2018-08-09 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 403 | 2018-06-24 | Boston Red Sox | Seattle Mariners              |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 365 | 2018-05-14 | Boston Red Sox | Oakland Athletics             |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 364 | 2018-05-13 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 348 | 2018-04-26 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 315 | 2017-09-22 | Boston Red Sox | Cincinnati Reds               |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 258 | 2017-07-19 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 217 | 2017-06-03 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 172 | 2017-04-14 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 170 | 2017-04-12 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 165 | 2017-04-07 | Boston Red Sox | Detroit Tigers                |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 153 | 2016-09-22 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 152 | 2016-09-21 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 111 | 2016-08-09 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  58 | 2016-06-07 | Boston Red Sox | San Francisco Giants          |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  50 | 2016-05-29 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.515161269677407 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
   9 | 2016-04-15 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
   7 | 2016-04-12 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 854 | 2021-09-13 | Boston Red Sox | Seattle Mariners              |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 844 | 2021-09-02 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             |  0.96443168637514 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 838 | 2021-08-27 | Boston Red Sox | Cleveland Guardians (Indians) |           1 | 0             | 0.945364210657688 | Runs_Scored = 4 or 5     | Hits <= 3         | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 823 | 2021-08-10 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 799 | 2021-07-11 | Boston Red Sox | Philadelphia Phillies         |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 774 | 2021-06-13 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 726 | 2021-04-20 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 698 | 2020-09-16 | Boston Red Sox | Miami Marlins                 |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 695 | 2020-09-12 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 677 | 2020-08-23 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 652 | 2020-07-27 | Boston Red Sox | New York Mets                 |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 651 | 2020-07-26 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 647 | 2019-09-28 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 642 | 2019-09-23 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 640 | 2019-09-21 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 639 | 2019-09-20 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 600 | 2019-08-04 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 596 | 2019-08-01 | Boston Red Sox | Tampa Bay Rays                |           0 | 1             | 0.981028345139191 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 581 | 2019-07-16 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.613605313927289 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 579 | 2019-07-14 | Boston Red Sox | Los Angeles Dodgers           |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 539 | 2019-05-26 | Boston Red Sox | Houston Astros                |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 528 | 2019-05-14 | Boston Red Sox | Colorado Rockies              |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 509 | 2019-04-23 | Boston Red Sox | Detroit Tigers                |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 508 | 2019-04-21 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 502 | 2019-04-14 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 487 | 2019-03-28 | Boston Red Sox | Seattle Mariners              |           0 | 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 479 | 2018-09-22 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 474 | 2018-09-16 | Boston Red Sox | New York Mets                 |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 450 | 2018-08-20 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 446 | 2018-08-15 | Boston Red Sox | Philadelphia Phillies         |           0 | 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 444 | 2018-08-12 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 410 | 2018-07-02 | Boston Red Sox | Washington Nationals          |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 373 | 2018-05-23 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 369 | 2018-05-18 | Boston Red Sox | Baltimore Orioles             |           0 | 1             | 0.938329771523953 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 351 | 2018-04-29 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             |  0.96443168637514 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 286 | 2017-08-21 | Boston Red Sox | Cleveland Guardians (Indians) |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 277 | 2017-08-11 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 238 | 2017-06-26 | Boston Red Sox | Minnesota Twins               |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 234 | 2017-06-21 | Boston Red Sox | Kansas City Royals            |           0 | 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 214 | 2017-05-31 | Boston Red Sox | Chicago White Sox             |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 196 | 2017-05-11 | Boston Red Sox | Milwaukee Brewers             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 195 | 2017-05-10 | Boston Red Sox | Milwaukee Brewers             |           0 | 1             | 0.877379594410426 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 189 | 2017-05-03 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.515161269677407 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 185 | 2017-04-29 | Boston Red Sox | Chicago Cubs                  |           0 | 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 178 | 2017-04-20 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 175 | 2017-04-17 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 171 | 2017-04-13 | Boston Red Sox | Pittsburgh Pirates            |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 157 | 2016-09-27 | Boston Red Sox | New York Yankees              |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  87 | 2016-07-10 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  86 | 2016-07-09 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  66 | 2016-06-17 | Boston Red Sox | Seattle Mariners              |           0 | 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  23 | 2016-04-29 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  10 | 2016-04-16 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
   8 | 2016-04-13 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 843 | 2021-09-01 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 791 | 2021-07-02 | Boston Red Sox | Oakland Athletics             |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 780 | 2021-06-20 | Boston Red Sox | Kansas City Royals            |           0 | 1             | 0.616605283697067 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 760 | 2021-05-29 | Boston Red Sox | Miami Marlins                 |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 727 | 2021-04-21 | Boston Red Sox | Toronto Blue Jays             |           0 | 1             | 0.754435812881248 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 719 | 2021-04-14 | Boston Red Sox | Minnesota Twins               |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 688 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 637 | 2019-09-18 | Boston Red Sox | San Francisco Giants          |           0 | 1             |  0.52147662934828 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 604 | 2019-08-08 | Boston Red Sox | Los Angeles Angels            |           1 | 0             |  0.73695266876692 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 561 | 2019-06-18 | Boston Red Sox | Minnesota Twins               |           0 | 1             | 0.616605283697067 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 431 | 2018-07-29 | Boston Red Sox | Minnesota Twins               |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 412 | 2018-07-04 | Boston Red Sox | Washington Nationals          |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 339 | 2018-04-15 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 331 | 2018-04-05 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 327 | 2018-03-31 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.757201177940761 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 310 | 2017-09-16 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 301 | 2017-09-05 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 294 | 2017-08-29 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 279 | 2017-08-13 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 272 | 2017-08-04 | Boston Red Sox | Chicago White Sox             |           1 | 0             |  0.73695266876692 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 255 | 2017-07-16 | Boston Red Sox | New York Yankees              |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 209 | 2017-05-26 | Boston Red Sox | Seattle Mariners              |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 164 | 2017-04-05 | Boston Red Sox | Pittsburgh Pirates            |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 156 | 2016-09-25 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 122 | 2016-08-20 | Boston Red Sox | Detroit Tigers                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 107 | 2016-08-04 | Boston Red Sox | Seattle Mariners              |           1 | 0             | 0.678784429983535 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 850 | 2021-09-08 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 821 | 2021-08-07 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 775 | 2021-06-14 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 732 | 2021-04-27 | Boston Red Sox | New York Mets                 |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 697 | 2020-09-15 | Boston Red Sox | Miami Marlins                 |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 634 | 2019-09-14 | Boston Red Sox | Philadelphia Phillies         |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 560 | 2019-06-17 | Boston Red Sox | Minnesota Twins               |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 524 | 2019-05-08 | Boston Red Sox | Baltimore Orioles             |           1 | 0             |  0.73695266876692 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 445 | 2018-08-14 | Boston Red Sox | Philadelphia Phillies         |           1 | 0             |  0.73695266876692 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 432 | 2018-07-30 | Boston Red Sox | Philadelphia Phillies         |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 394 | 2018-06-14 | Boston Red Sox | Seattle Mariners              |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 391 | 2018-06-11 | Boston Red Sox | Baltimore Orioles             |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 328 | 2018-04-01 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.992608254354845 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 275 | 2017-08-08 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 229 | 2017-06-16 | Boston Red Sox | Houston Astros                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 173 | 2017-04-15 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 154 | 2016-09-23 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 125 | 2016-08-23 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 104 | 2016-08-01 | Boston Red Sox | Seattle Mariners              |           1 | 0             |  0.73695266876692 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  83 | 2016-07-05 | Boston Red Sox | Texas Rangers                 |           0 | 1             | 0.590965456086299 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
  68 | 2016-06-19 | Boston Red Sox | Seattle Mariners              |           1 | 0             | 0.678784429983535 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 793 | 2021-07-04 | Boston Red Sox | Oakland Athletics             |           1 | 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 733 | 2021-04-28 | Boston Red Sox | New York Mets                 |           1 | 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 497 | 2019-04-07 | Boston Red Sox | Arizona Diamondbacks          |           1 | 0             | 0.972217929541055 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 470 | 2018-09-12 | Boston Red Sox | Toronto Blue Jays             |           1 | 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 423 | 2018-07-20 | Boston Red Sox | Detroit Tigers                |           1 | 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 326 | 2018-03-30 | Boston Red Sox | Tampa Bay Rays                |           1 | 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 313 | 2017-09-19 | Boston Red Sox | Baltimore Orioles             |           1 | 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
  19 | 2016-04-25 | Boston Red Sox | Atlanta Braves                |           1 | 0             | 0.972217929541055 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks

(202 rows)


---------------------------------------------------------
--  BAYES Game Probability Combinations   
---------------------------------------------------------

SELECT DISTINCT
ML_Prediction, 
ML_Probability,
Runs_Scored_Metric,
Hits_Metric,
Home_Runs_Metric,
Extra_Base_Hits_Metric,
Walks_Minus_Strikeouts_Metric

FROM 
BRS_2016_2021_WP_BAYES_probability 

ORDER BY
ML_Probability DESC;


 ML_Prediction |  ML_Probability   |    Runs_Scored_Metric    |    Hits_Metric    | Home_Runs_Metric |    Extra_Base_Hits_Metric    | Walks_Minus_Strikeouts_Metric
---------------+-------------------+--------------------------+-------------------+------------------+------------------------------+-------------------------------
 0             | 0.999774922573044 | Runs_Scored <= 1         | Hits <= 3         | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 1             | 0.999727010339926 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Walks = Strikeouts
 1             | 0.999690966244088 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Walks > Strikeouts
 1             | 0.999072832236703 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Walks = Strikeouts
 1             | 0.999057095184849 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.998950504634153 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Walks > Strikeouts
 1             | 0.998609078958119 | Runs_Scored >= 10        | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 5          | Walks > Strikeouts
 1             | 0.998273579059877 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Walks = Strikeouts
 1             | 0.998230347107811 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 0             | 0.998121815922581 | Runs_Scored <= 1         | Hits <= 3         | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.998046006745221 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Walks > Strikeouts
 1             | 0.997997087503546 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.997977944110493 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 0             | 0.996834941615636 | Runs_Scored <= 1         | Hits <= 3         | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             |  0.99680270172364 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.995765506819355 | Runs_Scored >= 10        | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             |  0.99461688520206 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.994156831353014 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Walks = Strikeouts
 1             | 0.994058150031757 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.993910001918529 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.993390193145171 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Walks > Strikeouts
 0             | 0.992608254354845 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 1             | 0.991038309121815 | Runs_Scored >= 10        | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.990179998904679 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 5          | Walks = Strikeouts
 1             | 0.988897417469604 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 5          | Walks > Strikeouts
 1             | 0.988896990207558 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.988622069617193 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.988465023891754 | Runs_Scored = 2 or 3     | Hits <= 3         | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.987448960239152 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             |  0.98334656897511 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.981028345139191 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.980089955455607 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.979600685335486 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             |  0.97490742206414 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Walks = Strikeouts
 1             | 0.973773833969046 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 0             | 0.972217929541055 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.967535924087168 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 1             | 0.966858432220726 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             |  0.96605527160141 | Runs_Scored >= 10        | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             |  0.96443168637514 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits = 0          | Strikeouts > Walks
 1             | 0.963244477768483 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.962643355579234 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.961852990778283 | Runs_Scored = 2 or 3     | Hits <= 3         | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.958590994968755 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.951846970644659 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 0             |  0.95083676264999 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             |  0.94583163837044 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.945364210657688 | Runs_Scored = 4 or 5     | Hits <= 3         | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             |  0.94470256538339 | Runs_Scored <= 1         | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 0             | 0.941403732703654 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.939508984680739 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.938329771523953 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             |  0.93206238468202 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.929103009986517 | Runs_Scored <= 1         | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.919849327771591 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             |  0.91614352113352 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 0             | 0.904955869245631 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.900172608805689 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 5          | Strikeouts > Walks
 1             | 0.890113300704957 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.888454649238526 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.883481163931682 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.877379594410426 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.859349834382429 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             |  0.85329293348213 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.851171434549553 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.843677315901942 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.840312089045008 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.837073459113719 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.817970988675918 | Runs_Scored > 5 but <= 9 | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.809179881327557 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.780973309274121 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.764374247430185 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.757201177940761 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.754435812881248 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 5          | Strikeouts > Walks
 0             |  0.73695266876692 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.733673893052802 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.700923045070837 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.678784429983535 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 0             | 0.657833980438202 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.642572064214258 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks = Strikeouts
 1             | 0.638693635392219 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.627256096751927 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.616605283697067 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             | 0.613605313927289 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.590965456086299 | Runs_Scored = 2 or 3     | Hits >= 10        | Home_Runs = 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 1             | 0.581404325545108 | Runs_Scored = 4 or 5     | Hits >= 10        | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks
 1             |  0.52147662934828 | Runs_Scored = 2 or 3     | Hits > 3 but <= 9 | Home_Runs > 1    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.515161269677407 | Runs_Scored = 4 or 5     | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Walks > Strikeouts
 0             | 0.500673231738528 | Runs_Scored > 5 but <= 9 | Hits > 3 but <= 9 | Home_Runs = 0    | Extra_Base_Hits > 0 but <= 5 | Strikeouts > Walks

(89 rows)


---------------------------------------------------------
--        BAYES Game Probability Combinations 
--           With Training Data Row Counts 
--    and Prediction Results (Correct vs. Incorrect)   
---------------------------------------------------------

SELECT
a.ML_Prediction, 
a.ML_Probability,
a.Runs_Scored_Metric,
a.Hits_Metric,
a.Home_Runs_Metric,
a.Extra_Base_Hits_Metric,
a.Walks_Minus_Strikeouts_Metric,
a.Training_Rows,
ISNULL(b.Training_Correct_Predictions, 0) AS Training_Correct_Predictions,
ISNULL(c.Training_Incorrect_Predictions, 0) AS Training_Incorrect_Predictions

FROM

(SELECT
 ML_Prediction, 
 ML_Probability,
 Runs_Scored_Metric,
 Hits_Metric,
 Home_Runs_Metric,
 Extra_Base_Hits_Metric,
 Walks_Minus_Strikeouts_Metric,
 COUNT(*) AS Training_Rows

 FROM 
 BRS_2016_2021_WP_BAYES_probability 

 GROUP BY
 ML_Prediction, 
 ML_Probability,
 Runs_Scored_Metric,
 Hits_Metric,
 Home_Runs_Metric,
 Extra_Base_Hits_Metric,
 Walks_Minus_Strikeouts_Metric) AS a

LEFT OUTER JOIN
 
(SELECT
 ML_Prediction, 
 ML_Probability,
 Runs_Scored_Metric,
 Hits_Metric,
 Home_Runs_Metric,
 Extra_Base_Hits_Metric,
 Walks_Minus_Strikeouts_Metric,
 COUNT(*) AS Training_Correct_Predictions

 FROM 
 BRS_2016_2021_WP_BAYES_probability

 WHERE
 Game_Result = ML_Prediction 

 GROUP BY
 ML_Prediction, 
 ML_Probability,
 Runs_Scored_Metric,
 Hits_Metric,
 Home_Runs_Metric,
 Extra_Base_Hits_Metric,
 Walks_Minus_Strikeouts_Metric) AS b

ON 
a.ML_Prediction = b.ML_Prediction 
AND a.ML_Probability = b.ML_Probability
AND a.Runs_Scored_Metric = b.Runs_Scored_Metric
AND a.Hits_Metric = b.Hits_Metric
AND a.Home_Runs_Metric = b.Home_Runs_Metric
AND a.Extra_Base_Hits_Metric = b.Extra_Base_Hits_Metric
AND a.Walks_Minus_Strikeouts_Metric = b.Walks_Minus_Strikeouts_Metric

LEFT OUTER JOIN
 
(SELECT
 ML_Prediction, 
 ML_Probability,
 Runs_Scored_Metric,
 Hits_Metric,
 Home_Runs_Metric,
 Extra_Base_Hits_Metric,
 Walks_Minus_Strikeouts_Metric,
 COUNT(*) AS Training_Incorrect_Predictions

 FROM 
 BRS_2016_2021_WP_BAYES_probability

 WHERE
 Game_Result != ML_Prediction 

 GROUP BY
 ML_Prediction, 
 ML_Probability,
 Runs_Scored_Metric,
 Hits_Metric,
 Home_Runs_Metric,
 Extra_Base_Hits_Metric,
 Walks_Minus_Strikeouts_Metric) AS c

ON 
a.ML_Prediction = c.ML_Prediction 
AND a.ML_Probability = c.ML_Probability
AND a.Runs_Scored_Metric = c.Runs_Scored_Metric
AND a.Hits_Metric = c.Hits_Metric
AND a.Home_Runs_Metric = c.Home_Runs_Metric
AND a.Extra_Base_Hits_Metric = c.Extra_Base_Hits_Metric
AND a.Walks_Minus_Strikeouts_Metric = c.Walks_Minus_Strikeouts_Metric

ORDER BY
a.ML_Probability DESC;