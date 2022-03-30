---------------------------------------------------------
--               Compare Model Results
---------------------------------------------------------

---------------------------------------------------------
-- Classification using eXtreme Gradient Boosting (XGB) 
---------------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_prediction_XGB_metrics; 


 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss | ML_Prediction_Errors | ML_Accuracy | ML_Precision | ML_Recall_Sensitivity | ML_Specificity
----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------+-------------+--------------+-----------------------+----------------
                        447 |                         327 |                           49 |                            47 |                   96 |       0.890 |        0.901 |                 0.905 |          0.870

(1 row)

---------------------------------------------------------
--      Examining XGB Prediction Errors  
---------------------------------------------------------

SELECT 
Key, 
Game_Date, 
Team, 
Opponent, 
Game_Result, 
ML_Prediction, 
Runs_Scored

FROM 
BRS_2016_2021_Batting_prediction_XGB

WHERE 
Game_Result != ML_Prediction;


 Key | Game_Date  |      Team      |       Opponent        | Game_Result | ML_Prediction | Runs_Scored
-----+------------+----------------+-----------------------+-------------+---------------+-------------
   2 | 2016-04-06 | Boston Red Sox | Cleveland Indians     |           0 | 1             |           6
   6 | 2016-04-11 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |           7
   7 | 2016-04-12 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |           5
  15 | 2016-04-21 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           8
  19 | 2016-04-25 | Boston Red Sox | Atlanta Braves        |           1 | 0             |           1
  39 | 2016-05-17 | Boston Red Sox | Kansas City Royals    |           0 | 1             |           4
  48 | 2016-05-27 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           5
  54 | 2016-06-02 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |           7
  71 | 2016-06-22 | Boston Red Sox | Chicago White Sox     |           0 | 1             |           6
  76 | 2016-06-27 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           7
  89 | 2016-07-16 | Boston Red Sox | New York Yankees      |           1 | 0             |           5
  98 | 2016-07-26 | Boston Red Sox | Detroit Tigers        |           0 | 1             |           8
 104 | 2016-08-01 | Boston Red Sox | Seattle Mariners      |           1 | 0             |           2
 110 | 2016-08-07 | Boston Red Sox | Los Angeles Dodgers   |           0 | 1             |           5
 117 | 2016-08-15 | Boston Red Sox | Cleveland Indians     |           1 | 0             |           3
 122 | 2016-08-20 | Boston Red Sox | Detroit Tigers        |           1 | 0             |           3
 123 | 2016-08-21 | Boston Red Sox | Detroit Tigers        |           0 | 1             |           5
 125 | 2016-08-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           2
 130 | 2016-08-28 | Boston Red Sox | Kansas City Royals    |           0 | 1             |           4
 154 | 2016-09-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           2
 156 | 2016-09-25 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           3
 173 | 2017-04-15 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           2
 178 | 2017-04-20 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |           4
 209 | 2017-05-26 | Boston Red Sox | Seattle Mariners      |           1 | 0             |           3
 215 | 2017-06-01 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |           5
 226 | 2017-06-13 | Boston Red Sox | Philadelphia Phillies |           1 | 0             |           4
 229 | 2017-06-16 | Boston Red Sox | Houston Astros        |           1 | 0             |           2
 255 | 2017-07-16 | Boston Red Sox | New York Yankees      |           1 | 0             |           3
 265 | 2017-07-26 | Boston Red Sox | Seattle Mariners      |           1 | 0             |           4
 279 | 2017-08-13 | Boston Red Sox | New York Yankees      |           1 | 0             |           3
 310 | 2017-09-16 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           3
 313 | 2017-09-19 | Boston Red Sox | Baltimore Orioles     |           1 | 0             |           1
 326 | 2018-03-30 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           1
 327 | 2018-03-31 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           3
 328 | 2018-04-01 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           2
 335 | 2018-04-11 | Boston Red Sox | New York Yankees      |           0 | 1             |           7
 339 | 2018-04-15 | Boston Red Sox | Baltimore Orioles     |           1 | 0             |           3
 365 | 2018-05-14 | Boston Red Sox | Oakland Athletics     |           0 | 1             |           5
 391 | 2018-06-11 | Boston Red Sox | Baltimore Orioles     |           1 | 0             |           2
 394 | 2018-06-14 | Boston Red Sox | Seattle Mariners      |           1 | 0             |           2
 395 | 2018-06-15 | Boston Red Sox | Seattle Mariners      |           0 | 1             |           6
 412 | 2018-07-04 | Boston Red Sox | Washington Nationals  |           1 | 0             |           3
 423 | 2018-07-20 | Boston Red Sox | Detroit Tigers        |           1 | 0             |           1
 431 | 2018-07-29 | Boston Red Sox | Minnesota Twins       |           1 | 0             |           3
 440 | 2018-08-09 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           5
 444 | 2018-08-12 | Boston Red Sox | Baltimore Orioles     |           1 | 0             |           4
 445 | 2018-08-14 | Boston Red Sox | Philadelphia Phillies |           1 | 0             |           2
 470 | 2018-09-12 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |           1
 484 | 2018-09-28 | Boston Red Sox | New York Yankees      |           0 | 1             |           6
 489 | 2019-03-30 | Boston Red Sox | Seattle Mariners      |           0 | 1             |           5
 490 | 2019-03-31 | Boston Red Sox | Seattle Mariners      |           0 | 1             |           8
 495 | 2019-04-05 | Boston Red Sox | Arizona Diamondbacks  |           0 | 1             |           8
 497 | 2019-04-07 | Boston Red Sox | Arizona Diamondbacks  |           1 | 0             |           1
 498 | 2019-04-09 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           5
 501 | 2019-04-13 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |           5
 518 | 2019-05-02 | Boston Red Sox | Chicago White Sox     |           0 | 1             |           4
 560 | 2019-06-17 | Boston Red Sox | Minnesota Twins       |           1 | 0             |           2
 564 | 2019-06-22 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           7
 568 | 2019-06-26 | Boston Red Sox | Chicago White Sox     |           0 | 1             |           7
 569 | 2019-06-29 | Boston Red Sox | New York Yankees      |           0 | 1             |          13
 570 | 2019-06-30 | Boston Red Sox | New York Yankees      |           0 | 1             |           8
 600 | 2019-08-04 | Boston Red Sox | New York Yankees      |           0 | 1             |           4
 603 | 2019-08-07 | Boston Red Sox | Kansas City Royals    |           1 | 0             |           5
 614 | 2019-08-20 | Boston Red Sox | Philadelphia Phillies |           0 | 1             |           2
 624 | 2019-09-03 | Boston Red Sox | Minnesota Twins       |           0 | 1             |           5
 629 | 2019-09-08 | Boston Red Sox | New York Yankees      |           0 | 1             |           5
 631 | 2019-09-10 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           3
 634 | 2019-09-14 | Boston Red Sox | Philadelphia Phillies |           1 | 0             |           2
 645 | 2019-09-26 | Boston Red Sox | Texas Rangers         |           0 | 1             |           5
 664 | 2020-08-10 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           7
 666 | 2020-08-12 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           5
 667 | 2020-08-13 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           8
 669 | 2020-08-15 | Boston Red Sox | New York Yankees      |           0 | 1             |           5
 677 | 2020-08-23 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |           4
 685 | 2020-09-02 | Boston Red Sox | Atlanta Braves        |           0 | 1             |           5
 687 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           7
 690 | 2020-09-06 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           8
 691 | 2020-09-08 | Boston Red Sox | Philadelphia Phillies |           0 | 1             |           5
 697 | 2020-09-15 | Boston Red Sox | Miami Marlins         |           1 | 0             |           2
 706 | 2020-09-25 | Boston Red Sox | Atlanta Braves        |           0 | 1             |           7
 718 | 2021-04-13 | Boston Red Sox | Minnesota Twins       |           1 | 0             |           4
 719 | 2021-04-14 | Boston Red Sox | Minnesota Twins       |           1 | 0             |           3
 732 | 2021-04-27 | Boston Red Sox | New York Mets         |           1 | 0             |           2
 733 | 2021-04-28 | Boston Red Sox | New York Mets         |           1 | 0             |           1
 739 | 2021-05-05 | Boston Red Sox | Detroit Tigers        |           0 | 1             |           5
 743 | 2021-05-09 | Boston Red Sox | Baltimore Orioles     |           1 | 0             |           4
 760 | 2021-05-29 | Boston Red Sox | Miami Marlins         |           1 | 0             |           3
 775 | 2021-06-14 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |           2
 791 | 2021-07-02 | Boston Red Sox | Oakland Athletics     |           1 | 0             |           3
 793 | 2021-07-04 | Boston Red Sox | Oakland Athletics     |           1 | 0             |           1
 800 | 2021-07-16 | Boston Red Sox | New York Yankees      |           1 | 0             |           4
 814 | 2021-07-31 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           5
 821 | 2021-08-07 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |           2
 822 | 2021-08-08 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |           8
 843 | 2021-09-01 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |           3
 849 | 2021-09-07 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             |           7

(96 rows)


---------------------------------------------------------
--     Classification using Naive Bayes (BAYES)  
---------------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_prediction_BAYES_metrics; 

 ML_Correctly_Predicted_Win | ML_Correctly_Predicted_Loss | ML_Incorrectly_Predicted_Win | ML_Incorrectly_Predicted_Loss | ML_Prediction_Errors | ML_Accuracy | ML_Precision | ML_Recall_Sensitivity | ML_Specificity
----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------+-------------+--------------+-----------------------+----------------
                        389 |                         302 |                           74 |                           105 |                  179 |       0.794 |        0.840 |                 0.787 |          0.803

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
Class_0_Loss_Probability, 
Class_1_Win_Probability,
Runs_Scored

FROM 
BRS_2016_2021_Batting_probability_BAYES 

WHERE 
Game_Result != ML_Prediction;


 Key | Game_Date  |      Team      |       Opponent        | Game_Result | ML_Prediction |  ML_Probability   | Class_0_Loss_Probability | Class_1_Win_Probability | Runs_Scored
-----+------------+----------------+-----------------------+-------------+---------------+-------------------+--------------------------+-------------------------+-------------
   2 | 2016-04-06 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.979600838164287 |       0.0203991618357133 |       0.979600838164287 |           6
   6 | 2016-04-11 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.985082363231414 |       0.0149176367685858 |       0.985082363231414 |           7
   7 | 2016-04-12 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.867751240094021 |        0.132248759905979 |       0.867751240094021 |           5
  15 | 2016-04-21 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.994187020149007 |       0.0058129798509934 |       0.994187020149007 |           8
  19 | 2016-04-25 | Boston Red Sox | Atlanta Braves        |           1 | 0             | 0.997159737521836 |        0.997159737521836 |     0.00284026247816403 |           1
  23 | 2016-04-29 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.505846916460539 |        0.505846916460539 |       0.494153083539461 |           4
  36 | 2016-05-13 | Boston Red Sox | Houston Astros        |           0 | 1             | 0.716077289910426 |        0.283922710089574 |       0.716077289910426 |           6
  44 | 2016-05-22 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.671106642449218 |        0.671106642449218 |       0.328893357550782 |           5
  48 | 2016-05-27 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.745371030784237 |        0.254628969215763 |       0.745371030784237 |           5
  49 | 2016-05-28 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.999681174478535 |     0.000318825521464735 |       0.999681174478535 |           9
  53 | 2016-06-01 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.999752022639932 |     0.000247977360067569 |       0.999752022639932 |           9
  54 | 2016-06-02 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |  0.97975056127765 |       0.0202494387223496 |        0.97975056127765 |           7
  66 | 2016-06-17 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.836416260383299 |        0.163583739616701 |       0.836416260383299 |           4
  68 | 2016-06-19 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.828185569796742 |        0.828185569796742 |       0.171814430203258 |           2
  71 | 2016-06-22 | Boston Red Sox | Chicago White Sox     |           0 | 1             | 0.920734769758973 |       0.0792652302410275 |       0.920734769758973 |           6
  76 | 2016-06-27 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.982858751905401 |       0.0171412480945989 |       0.982858751905401 |           7
  86 | 2016-07-09 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.583960316380656 |        0.583960316380656 |       0.416039683619344 |           4
  95 | 2016-07-23 | Boston Red Sox | Minnesota Twins       |           0 | 1             | 0.997087190085006 |      0.00291280991499406 |       0.997087190085006 |           9
  98 | 2016-07-26 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.998624129249098 |      0.00137587075090189 |       0.998624129249098 |           8
  99 | 2016-07-27 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.720163535742683 |        0.279836464257317 |       0.720163535742683 |           3
 103 | 2016-07-31 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.791918509413789 |        0.791918509413789 |       0.208081490586211 |           5
 104 | 2016-08-01 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.873018065988234 |        0.873018065988234 |       0.126981934011766 |           2
 105 | 2016-08-02 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.605914848886068 |        0.394085151113932 |       0.605914848886068 |           4
 107 | 2016-08-04 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.891545523386622 |        0.891545523386622 |       0.108454476613378 |           3
 110 | 2016-08-07 | Boston Red Sox | Los Angeles Dodgers   |           0 | 1             |  0.63928258854493 |         0.36071741145507 |        0.63928258854493 |           5
 117 | 2016-08-15 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.746033774356755 |        0.746033774356755 |       0.253966225643245 |           3
 122 | 2016-08-20 | Boston Red Sox | Detroit Tigers        |           1 | 0             | 0.974658038081699 |        0.974658038081699 |      0.0253419619183015 |           3
 123 | 2016-08-21 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.879474766822569 |        0.120525233177431 |       0.879474766822569 |           5
 125 | 2016-08-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.996722769583471 |        0.996722769583471 |     0.00327723041652858 |           2
 152 | 2016-09-21 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.797555888410678 |        0.797555888410678 |       0.202444111589322 |           5
 154 | 2016-09-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.985571913581927 |        0.985571913581927 |      0.0144280864180731 |           2
 156 | 2016-09-25 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.949553439907413 |        0.949553439907413 |      0.0504465600925866 |           3
 164 | 2017-04-05 | Boston Red Sox | Pittsburgh Pirates    |           1 | 0             | 0.975593001794922 |        0.975593001794922 |      0.0244069982050778 |           3
 165 | 2017-04-07 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.753613559597341 |        0.246386440402659 |       0.753613559597341 |           5
 170 | 2017-04-12 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.810923618064543 |        0.189076381935457 |       0.810923618064543 |           5
 171 | 2017-04-13 | Boston Red Sox | Pittsburgh Pirates    |           1 | 0             | 0.522374000962621 |        0.522374000962621 |       0.477625999037379 |           4
 173 | 2017-04-15 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |  0.88011273623545 |         0.88011273623545 |        0.11988726376455 |           2
 175 | 2017-04-17 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.613721081796865 |        0.613721081796865 |       0.386278918203135 |           4
 178 | 2017-04-20 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.791676262309304 |        0.791676262309304 |       0.208323737690697 |           4
 185 | 2017-04-29 | Boston Red Sox | Chicago Cubs          |           0 | 1             | 0.714590797251617 |        0.285409202748383 |       0.714590797251617 |           4
 194 | 2017-05-09 | Boston Red Sox | Milwaukee Brewers     |           0 | 1             | 0.953561275190891 |       0.0464387248091088 |       0.953561275190891 |           7
 195 | 2017-05-10 | Boston Red Sox | Milwaukee Brewers     |           0 | 1             |  0.55271050825166 |         0.44728949174834 |        0.55271050825166 |           4
 196 | 2017-05-11 | Boston Red Sox | Milwaukee Brewers     |           1 | 0             | 0.879999204672318 |        0.879999204672318 |       0.120000795327682 |           4
 201 | 2017-05-17 | Boston Red Sox | St. Louis Cardinals   |           1 | 0             | 0.698940526824479 |        0.698940526824479 |       0.301059473175521 |           5
 209 | 2017-05-26 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.984625496990966 |        0.984625496990966 |      0.0153745030090344 |           3
 214 | 2017-05-31 | Boston Red Sox | Chicago White Sox     |           1 | 0             | 0.826820090304278 |        0.826820090304278 |       0.173179909695722 |           4
 215 | 2017-06-01 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.772312596113579 |        0.227687403886421 |       0.772312596113579 |           5
 226 | 2017-06-13 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.636362043512879 |        0.636362043512879 |       0.363637956487121 |           4
 229 | 2017-06-16 | Boston Red Sox | Houston Astros        |           1 | 0             | 0.898876075574812 |        0.898876075574812 |       0.101123924425188 |           2
 238 | 2017-06-26 | Boston Red Sox | Minnesota Twins       |           1 | 0             |  0.67810393798039 |         0.67810393798039 |        0.32189606201961 |           4
 252 | 2017-07-14 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.812983550348644 |        0.812983550348644 |       0.187016449651356 |           5
 255 | 2017-07-16 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.907689814091281 |        0.907689814091281 |      0.0923101859087193 |           3
 257 | 2017-07-18 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.975498196001054 |        0.975498196001054 |      0.0245018039989464 |           5
 259 | 2017-07-20 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |  0.82930370139315 |         0.17069629860685 |        0.82930370139315 |           6
 272 | 2017-08-04 | Boston Red Sox | Chicago White Sox     |           1 | 0             | 0.991153727881646 |        0.991153727881646 |     0.00884627211835355 |           3
 275 | 2017-08-08 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.966166327238448 |        0.966166327238448 |      0.0338336727615524 |           2
 279 | 2017-08-13 | Boston Red Sox | New York Yankees      |           1 | 0             |  0.98931259582751 |         0.98931259582751 |      0.0106874041724903 |           3
 288 | 2017-08-23 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.575859883080371 |        0.575859883080371 |       0.424140116919629 |           6
 289 | 2017-08-24 | Boston Red Sox | Cleveland Indians     |           0 | 1             |  0.80322452021277 |         0.19677547978723 |        0.80322452021277 |           6
 294 | 2017-08-29 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.621080260976764 |        0.621080260976764 |       0.378919739023236 |           3
 297 | 2017-09-01 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.849532249104888 |        0.849532249104888 |       0.150467750895112 |           4
 301 | 2017-09-05 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.999629313541072 |        0.999629313541072 |    0.000370686458927629 |           3
 310 | 2017-09-16 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.806388814833698 |        0.806388814833698 |       0.193611185166302 |           3
 313 | 2017-09-19 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.998624824402104 |        0.998624824402104 |     0.00137517559789599 |           1
 325 | 2018-03-29 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.728949842419462 |        0.271050157580538 |       0.728949842419462 |           4
 326 | 2018-03-30 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.988397156879115 |        0.988397156879115 |      0.0116028431208849 |           1
 327 | 2018-03-31 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.802548290389465 |        0.802548290389465 |       0.197451709610535 |           3
 328 | 2018-04-01 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.981889312698316 |        0.981889312698316 |      0.0181106873016839 |           2
 330 | 2018-04-03 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.919338297883384 |        0.919338297883384 |      0.0806617021166161 |           4
 331 | 2018-04-05 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.963035796456222 |        0.963035796456222 |      0.0369642035437784 |           3
 335 | 2018-04-11 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.975527847375859 |       0.0244721526241406 |       0.975527847375859 |           7
 339 | 2018-04-15 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.866950836635117 |        0.866950836635117 |       0.133049163364883 |           3
 347 | 2018-04-25 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |  0.78888918093424 |         0.78888918093424 |        0.21111081906576 |           4
 351 | 2018-04-29 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.536802031528607 |        0.536802031528607 |       0.463197968471393 |           4
 355 | 2018-05-03 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.762484648261866 |        0.237515351738134 |       0.762484648261866 |           5
 360 | 2018-05-09 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.921746749394277 |       0.0782532506057234 |       0.921746749394277 |           6
 365 | 2018-05-14 | Boston Red Sox | Oakland Athletics     |           0 | 1             |  0.91570898213077 |       0.0842910178692302 |        0.91570898213077 |           5
 369 | 2018-05-18 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.735803651705614 |        0.264196348294386 |       0.735803651705614 |           4
 373 | 2018-05-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.930201881468658 |        0.930201881468658 |      0.0697981185313417 |           4
 389 | 2018-06-09 | Boston Red Sox | Chicago White Sox     |           1 | 0             | 0.902285848005699 |        0.902285848005699 |      0.0977141519943007 |           4
 391 | 2018-06-11 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.996183710663694 |        0.996183710663694 |      0.0038162893363058 |           2
 394 | 2018-06-14 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.958751564125204 |        0.958751564125204 |      0.0412484358747962 |           2
 395 | 2018-06-15 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.865628759036732 |        0.134371240963268 |       0.865628759036732 |           6
 410 | 2018-07-02 | Boston Red Sox | Washington Nationals  |           1 | 0             | 0.899702591225526 |        0.899702591225526 |       0.100297408774474 |           4
 412 | 2018-07-04 | Boston Red Sox | Washington Nationals  |           1 | 0             | 0.910055600455227 |        0.910055600455227 |      0.0899443995447733 |           3
 418 | 2018-07-11 | Boston Red Sox | Texas Rangers         |           1 | 0             | 0.648944444783834 |        0.648944444783834 |       0.351055555216166 |           4
 420 | 2018-07-13 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.879947526622303 |        0.120052473377697 |       0.879947526622303 |           7
 423 | 2018-07-20 | Boston Red Sox | Detroit Tigers        |           1 | 0             | 0.998679667022897 |        0.998679667022897 |      0.0013203329771029 |           1
 427 | 2018-07-24 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.930705539147996 |       0.0692944608520042 |       0.930705539147996 |           6
 429 | 2018-07-27 | Boston Red Sox | Minnesota Twins       |           1 | 0             | 0.543566739629315 |        0.543566739629315 |       0.456433260370685 |           4
 431 | 2018-07-29 | Boston Red Sox | Minnesota Twins       |           1 | 0             | 0.977721036406689 |        0.977721036406689 |      0.0222789635933111 |           3
 432 | 2018-07-30 | Boston Red Sox | Philadelphia Phillies |           1 | 0             |  0.98278699053732 |         0.98278699053732 |      0.0172130094626803 |           2
 437 | 2018-08-05 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.991664255002855 |        0.991664255002855 |     0.00833574499714531 |           5
 440 | 2018-08-09 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.939143751251115 |       0.0608562487488846 |       0.939143751251115 |           5
 444 | 2018-08-12 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.751538638798803 |        0.751538638798803 |       0.248461361201197 |           4
 445 | 2018-08-14 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.934511528922276 |        0.934511528922276 |      0.0654884710777239 |           2
 470 | 2018-09-12 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |  0.98250598035996 |         0.98250598035996 |      0.0174940196400396 |           1
 473 | 2018-09-15 | Boston Red Sox | New York Mets         |           1 | 0             | 0.598058903833522 |        0.598058903833522 |       0.401941096166478 |           5
 474 | 2018-09-16 | Boston Red Sox | New York Mets         |           1 | 0             | 0.530303753579519 |        0.530303753579519 |       0.469696246420481 |           4
 484 | 2018-09-28 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.732125935900589 |        0.267874064099411 |       0.732125935900589 |           6
 490 | 2019-03-31 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.997452135925809 |      0.00254786407419165 |       0.997452135925809 |           8
 495 | 2019-04-05 | Boston Red Sox | Arizona Diamondbacks  |           0 | 1             | 0.998308336656998 |      0.00169166334300193 |       0.998308336656998 |           8
 497 | 2019-04-07 | Boston Red Sox | Arizona Diamondbacks  |           1 | 0             | 0.996793288118963 |        0.996793288118963 |     0.00320671188103714 |           1
 501 | 2019-04-13 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.777848655050541 |        0.222151344949459 |       0.777848655050541 |           5
 502 | 2019-04-14 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.559533056142391 |        0.559533056142391 |       0.440466943857609 |           4
 508 | 2019-04-21 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.827136709208502 |        0.827136709208502 |       0.172863290791498 |           4
 509 | 2019-04-23 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.682290566076493 |        0.317709433923507 |       0.682290566076493 |           4
 524 | 2019-05-08 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.997206813519356 |        0.997206813519356 |     0.00279318648064344 |           2
 539 | 2019-05-26 | Boston Red Sox | Houston Astros        |           1 | 0             | 0.665004760554219 |        0.665004760554219 |       0.334995239445781 |           4
 542 | 2019-05-29 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.997813048376654 |        0.002186951623346 |       0.997813048376654 |           9
 554 | 2019-06-11 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.550519939393299 |        0.449480060606701 |       0.550519939393299 |           5
 555 | 2019-06-12 | Boston Red Sox | Texas Rangers         |           1 | 0             | 0.568858571694871 |        0.568858571694871 |       0.431141428305129 |           4
 560 | 2019-06-17 | Boston Red Sox | Minnesota Twins       |           1 | 0             | 0.980798855736831 |        0.980798855736831 |       0.019201144263169 |           2
 564 | 2019-06-22 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.984264930935738 |       0.0157350690642617 |       0.984264930935738 |           7
 568 | 2019-06-26 | Boston Red Sox | Chicago White Sox     |           0 | 1             |  0.97225850679102 |       0.0277414932089803 |        0.97225850679102 |           7
 569 | 2019-06-29 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.999997581011663 |     2.41898833664859e-06 |       0.999997581011663 |          13
 570 | 2019-06-30 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.996501506625957 |      0.00349849337404261 |       0.996501506625957 |           8
 588 | 2019-07-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |  0.54984162799152 |         0.54984162799152 |        0.45015837200848 |           5
 594 | 2019-07-30 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.668341458853297 |        0.331658541146703 |       0.668341458853297 |           5
 600 | 2019-08-04 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.552841204356502 |        0.447158795643498 |       0.552841204356502 |           4
 603 | 2019-08-07 | Boston Red Sox | Kansas City Royals    |           1 | 0             | 0.817369722126573 |        0.817369722126573 |       0.182630277873427 |           5
 604 | 2019-08-08 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.807278475954129 |        0.807278475954129 |       0.192721524045871 |           3
 608 | 2019-08-12 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.897605533652928 |        0.102394466347072 |       0.897605533652928 |           5
 617 | 2019-08-24 | Boston Red Sox | San Diego Padres      |           1 | 0             | 0.506627177049417 |        0.506627177049417 |       0.493372822950583 |           5
 622 | 2019-08-31 | Boston Red Sox | Los Angeles Angels    |           0 | 1             | 0.624461839609935 |        0.375538160390065 |       0.624461839609935 |           4
 623 | 2019-09-01 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.737058244021581 |        0.737058244021581 |       0.262941755978419 |           4
 624 | 2019-09-03 | Boston Red Sox | Minnesota Twins       |           0 | 1             | 0.543197771666179 |        0.456802228333821 |       0.543197771666179 |           5
 629 | 2019-09-08 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.805919961973869 |        0.194080038026131 |       0.805919961973869 |           5
 634 | 2019-09-14 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.980949996269708 |        0.980949996269708 |      0.0190500037302922 |           2
 638 | 2019-09-19 | Boston Red Sox | San Francisco Giants  |           1 | 0             | 0.645530993275866 |        0.645530993275866 |       0.354469006724134 |           5
 645 | 2019-09-26 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.747189853221379 |        0.252810146778621 |       0.747189853221379 |           5
 648 | 2019-09-29 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.543097486976271 |        0.543097486976271 |       0.456902513023729 |           5
 651 | 2020-07-26 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.605123085903362 |        0.394876914096638 |       0.605123085903362 |           4
 652 | 2020-07-27 | Boston Red Sox | New York Mets         |           0 | 1             | 0.714219808374638 |        0.285780191625362 |       0.714219808374638 |           4
 655 | 2020-07-30 | Boston Red Sox | New York Mets         |           1 | 0             | 0.732181600207578 |        0.732181600207578 |       0.267818399792422 |           4
 658 | 2020-08-02 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.955886404987379 |       0.0441135950126209 |       0.955886404987379 |           7
 660 | 2020-08-05 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.519528125636743 |        0.519528125636743 |       0.480471874363257 |           5
 664 | 2020-08-10 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.973221882255931 |       0.0267781177440693 |       0.973221882255931 |           7
 667 | 2020-08-13 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.990058305194143 |       0.0099416948058572 |       0.990058305194143 |           8
 669 | 2020-08-15 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.920239460161892 |       0.0797605398381078 |       0.920239460161892 |           5
 677 | 2020-08-23 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.589474962556388 |        0.410525037443612 |       0.589474962556388 |           4
 685 | 2020-09-02 | Boston Red Sox | Atlanta Braves        |           0 | 1             | 0.625319050608468 |        0.374680949391532 |       0.625319050608468 |           5
 687 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.983984377039906 |       0.0160156229600939 |       0.983984377039906 |           7
 688 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.923162246161731 |        0.923162246161731 |      0.0768377538382694 |           3
 690 | 2020-09-06 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.996254062051635 |       0.0037459379483646 |       0.996254062051635 |           8
 691 | 2020-09-08 | Boston Red Sox | Philadelphia Phillies |           0 | 1             | 0.933252294358305 |       0.0667477056416946 |       0.933252294358305 |           5
 692 | 2020-09-08 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.532336659473049 |        0.532336659473049 |       0.467663340526951 |           5
 693 | 2020-09-10 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.912143851802977 |        0.912143851802977 |      0.0878561481970233 |           4
 695 | 2020-09-12 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.657455985503663 |        0.342544014496337 |       0.657455985503663 |           4
 697 | 2020-09-15 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.989202454749506 |        0.989202454749506 |      0.0107975452504942 |           2
 699 | 2020-09-17 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.591791663069233 |        0.591791663069233 |       0.408208336930767 |           5
 706 | 2020-09-25 | Boston Red Sox | Atlanta Braves        |           0 | 1             | 0.928880463633968 |       0.0711195363660317 |       0.928880463633968 |           7
 713 | 2021-04-06 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.670883272210972 |        0.670883272210972 |       0.329116727789028 |           6
 719 | 2021-04-14 | Boston Red Sox | Minnesota Twins       |           1 | 0             |  0.93563187345028 |         0.93563187345028 |      0.0643681265497205 |           3
 732 | 2021-04-27 | Boston Red Sox | New York Mets         |           1 | 0             | 0.926354761217187 |        0.926354761217187 |      0.0736452387828127 |           2
 733 | 2021-04-28 | Boston Red Sox | New York Mets         |           1 | 0             | 0.998947708265467 |        0.998947708265467 |     0.00105229173453289 |           1
 736 | 2021-05-01 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.743535822999337 |        0.256464177000663 |       0.743535822999337 |           6
 743 | 2021-05-09 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.536887965354298 |        0.536887965354298 |       0.463112034645702 |           4
 748 | 2021-05-14 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.501050369032526 |        0.501050369032526 |       0.498949630967474 |           4
 755 | 2021-05-22 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.749573417387964 |        0.749573417387964 |       0.250426582612035 |           4
 760 | 2021-05-29 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.751907685549346 |        0.751907685549346 |       0.248092314450654 |           3
 764 | 2021-06-03 | Boston Red Sox | Houston Astros        |           1 | 0             | 0.608780821093157 |        0.608780821093157 |       0.391219178906843 |           5
 768 | 2021-06-07 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.536957265554152 |        0.536957265554152 |       0.463042734445848 |           5
 775 | 2021-06-14 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.967638922783762 |        0.967638922783762 |      0.0323610772162378 |           2
 791 | 2021-07-02 | Boston Red Sox | Oakland Athletics     |           1 | 0             | 0.862542388188141 |        0.862542388188141 |       0.137457611811859 |           3
 793 | 2021-07-04 | Boston Red Sox | Oakland Athletics     |           1 | 0             | 0.998994066350348 |        0.998994066350348 |     0.00100593364965188 |           1
 805 | 2021-07-22 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.528948559418756 |        0.528948559418756 |       0.471051440581244 |           5
 821 | 2021-08-07 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.919933789212095 |        0.919933789212095 |      0.0800662107879046 |           2
 822 | 2021-08-08 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.981941038621243 |       0.0180589613787573 |       0.981941038621243 |           8
 838 | 2021-08-27 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.710955209294115 |        0.710955209294115 |       0.289044790705885 |           4
 840 | 2021-08-29 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.667615045244375 |        0.332384954755625 |       0.667615045244375 |           5
 842 | 2021-08-31 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.613119291251123 |        0.386880708748877 |       0.613119291251123 |           5
 843 | 2021-09-01 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.966277333479711 |        0.966277333479711 |      0.0337226665202887 |           3
 844 | 2021-09-02 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.925039442678364 |        0.925039442678364 |      0.0749605573216364 |           4
 847 | 2021-09-05 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.761119623168607 |        0.238880376831393 |       0.761119623168607 |           5
 848 | 2021-09-06 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.999158725043308 |     0.000841274956691646 |       0.999158725043308 |          10
 849 | 2021-09-07 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.990253809277536 |      0.00974619072246361 |       0.990253809277536 |           7
 850 | 2021-09-08 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.934793443776023 |        0.934793443776023 |      0.0652065562239768 |           2
 869 | 2021-10-02 | Boston Red Sox | Washington Nationals  |           1 | 0             | 0.678426804258196 |        0.678426804258196 |       0.321573195741804 |           5

(179 rows)


---------------------------------------------------------
-- Examining All BAYES and XBG Shared Prediction Errors  
---------------------------------------------------------

SELECT 
Key, 
Game_Date, 
Team, 
Opponent, 
Game_Result, 
ML_Prediction, 
ML_Probability, 
Class_0_Loss_Probability, 
Class_1_Win_Probability,
Runs_Scored

FROM 
BRS_2016_2021_Batting_probability_BAYES 

WHERE 
Game_Result != ML_Prediction
AND Key IN (SELECT Key FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result != ML_Prediction);

 Key | Game_Date  |      Team      |       Opponent        | Game_Result | ML_Prediction |  ML_Probability   | Class_0_Loss_Probability | Class_1_Win_Probability | Runs_Scored
-----+------------+----------------+-----------------------+-------------+---------------+-------------------+--------------------------+-------------------------+-------------
   2 | 2016-04-06 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.979600838164287 |       0.0203991618357133 |       0.979600838164287 |           6
   6 | 2016-04-11 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.985082363231414 |       0.0149176367685858 |       0.985082363231414 |           7
   7 | 2016-04-12 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.867751240094021 |        0.132248759905979 |       0.867751240094021 |           5
  15 | 2016-04-21 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.994187020149007 |       0.0058129798509934 |       0.994187020149007 |           8
  19 | 2016-04-25 | Boston Red Sox | Atlanta Braves        |           1 | 0             | 0.997159737521836 |        0.997159737521836 |     0.00284026247816403 |           1
  48 | 2016-05-27 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.745371030784237 |        0.254628969215763 |       0.745371030784237 |           5
  54 | 2016-06-02 | Boston Red Sox | Baltimore Orioles     |           0 | 1             |  0.97975056127765 |       0.0202494387223496 |        0.97975056127765 |           7
  71 | 2016-06-22 | Boston Red Sox | Chicago White Sox     |           0 | 1             | 0.920734769758973 |       0.0792652302410275 |       0.920734769758973 |           6
  76 | 2016-06-27 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.982858751905401 |       0.0171412480945989 |       0.982858751905401 |           7
  98 | 2016-07-26 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.998624129249098 |      0.00137587075090189 |       0.998624129249098 |           8
 104 | 2016-08-01 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.873018065988234 |        0.873018065988234 |       0.126981934011766 |           2
 110 | 2016-08-07 | Boston Red Sox | Los Angeles Dodgers   |           0 | 1             |  0.63928258854493 |         0.36071741145507 |        0.63928258854493 |           5
 117 | 2016-08-15 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.746033774356755 |        0.746033774356755 |       0.253966225643245 |           3
 122 | 2016-08-20 | Boston Red Sox | Detroit Tigers        |           1 | 0             | 0.974658038081699 |        0.974658038081699 |      0.0253419619183015 |           3
 123 | 2016-08-21 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.879474766822569 |        0.120525233177431 |       0.879474766822569 |           5
 125 | 2016-08-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.996722769583471 |        0.996722769583471 |     0.00327723041652858 |           2
 154 | 2016-09-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.985571913581927 |        0.985571913581927 |      0.0144280864180731 |           2
 156 | 2016-09-25 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.949553439907413 |        0.949553439907413 |      0.0504465600925866 |           3
 173 | 2017-04-15 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |  0.88011273623545 |         0.88011273623545 |        0.11988726376455 |           2
 178 | 2017-04-20 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.791676262309304 |        0.791676262309304 |       0.208323737690697 |           4
 209 | 2017-05-26 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.984625496990966 |        0.984625496990966 |      0.0153745030090344 |           3
 215 | 2017-06-01 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.772312596113579 |        0.227687403886421 |       0.772312596113579 |           5
 226 | 2017-06-13 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.636362043512879 |        0.636362043512879 |       0.363637956487121 |           4
 229 | 2017-06-16 | Boston Red Sox | Houston Astros        |           1 | 0             | 0.898876075574812 |        0.898876075574812 |       0.101123924425188 |           2
 255 | 2017-07-16 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.907689814091281 |        0.907689814091281 |      0.0923101859087193 |           3
 279 | 2017-08-13 | Boston Red Sox | New York Yankees      |           1 | 0             |  0.98931259582751 |         0.98931259582751 |      0.0106874041724903 |           3
 310 | 2017-09-16 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.806388814833698 |        0.806388814833698 |       0.193611185166302 |           3
 313 | 2017-09-19 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.998624824402104 |        0.998624824402104 |     0.00137517559789599 |           1
 326 | 2018-03-30 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.988397156879115 |        0.988397156879115 |      0.0116028431208849 |           1
 327 | 2018-03-31 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.802548290389465 |        0.802548290389465 |       0.197451709610535 |           3
 328 | 2018-04-01 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.981889312698316 |        0.981889312698316 |      0.0181106873016839 |           2
 335 | 2018-04-11 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.975527847375859 |       0.0244721526241406 |       0.975527847375859 |           7
 339 | 2018-04-15 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.866950836635117 |        0.866950836635117 |       0.133049163364883 |           3
 365 | 2018-05-14 | Boston Red Sox | Oakland Athletics     |           0 | 1             |  0.91570898213077 |       0.0842910178692302 |        0.91570898213077 |           5
 391 | 2018-06-11 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.996183710663694 |        0.996183710663694 |      0.0038162893363058 |           2
 394 | 2018-06-14 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.958751564125204 |        0.958751564125204 |      0.0412484358747962 |           2
 395 | 2018-06-15 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.865628759036732 |        0.134371240963268 |       0.865628759036732 |           6
 412 | 2018-07-04 | Boston Red Sox | Washington Nationals  |           1 | 0             | 0.910055600455227 |        0.910055600455227 |      0.0899443995447733 |           3
 423 | 2018-07-20 | Boston Red Sox | Detroit Tigers        |           1 | 0             | 0.998679667022897 |        0.998679667022897 |      0.0013203329771029 |           1
 431 | 2018-07-29 | Boston Red Sox | Minnesota Twins       |           1 | 0             | 0.977721036406689 |        0.977721036406689 |      0.0222789635933111 |           3
 440 | 2018-08-09 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.939143751251115 |       0.0608562487488846 |       0.939143751251115 |           5
 444 | 2018-08-12 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.751538638798803 |        0.751538638798803 |       0.248461361201197 |           4
 445 | 2018-08-14 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.934511528922276 |        0.934511528922276 |      0.0654884710777239 |           2
 470 | 2018-09-12 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |  0.98250598035996 |         0.98250598035996 |      0.0174940196400396 |           1
 484 | 2018-09-28 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.732125935900589 |        0.267874064099411 |       0.732125935900589 |           6
 490 | 2019-03-31 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.997452135925809 |      0.00254786407419165 |       0.997452135925809 |           8
 495 | 2019-04-05 | Boston Red Sox | Arizona Diamondbacks  |           0 | 1             | 0.998308336656998 |      0.00169166334300193 |       0.998308336656998 |           8
 497 | 2019-04-07 | Boston Red Sox | Arizona Diamondbacks  |           1 | 0             | 0.996793288118963 |        0.996793288118963 |     0.00320671188103714 |           1
 501 | 2019-04-13 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.777848655050541 |        0.222151344949459 |       0.777848655050541 |           5
 560 | 2019-06-17 | Boston Red Sox | Minnesota Twins       |           1 | 0             | 0.980798855736831 |        0.980798855736831 |       0.019201144263169 |           2
 564 | 2019-06-22 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.984264930935738 |       0.0157350690642617 |       0.984264930935738 |           7
 568 | 2019-06-26 | Boston Red Sox | Chicago White Sox     |           0 | 1             |  0.97225850679102 |       0.0277414932089803 |        0.97225850679102 |           7
 569 | 2019-06-29 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.999997581011663 |     2.41898833664859e-06 |       0.999997581011663 |          13
 570 | 2019-06-30 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.996501506625957 |      0.00349849337404261 |       0.996501506625957 |           8
 600 | 2019-08-04 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.552841204356502 |        0.447158795643498 |       0.552841204356502 |           4
 603 | 2019-08-07 | Boston Red Sox | Kansas City Royals    |           1 | 0             | 0.817369722126573 |        0.817369722126573 |       0.182630277873427 |           5
 624 | 2019-09-03 | Boston Red Sox | Minnesota Twins       |           0 | 1             | 0.543197771666179 |        0.456802228333821 |       0.543197771666179 |           5
 629 | 2019-09-08 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.805919961973869 |        0.194080038026131 |       0.805919961973869 |           5
 634 | 2019-09-14 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.980949996269708 |        0.980949996269708 |      0.0190500037302922 |           2
 645 | 2019-09-26 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.747189853221379 |        0.252810146778621 |       0.747189853221379 |           5
 664 | 2020-08-10 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.973221882255931 |       0.0267781177440693 |       0.973221882255931 |           7
 667 | 2020-08-13 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.990058305194143 |       0.0099416948058572 |       0.990058305194143 |           8
 669 | 2020-08-15 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.920239460161892 |       0.0797605398381078 |       0.920239460161892 |           5
 677 | 2020-08-23 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.589474962556388 |        0.410525037443612 |       0.589474962556388 |           4
 685 | 2020-09-02 | Boston Red Sox | Atlanta Braves        |           0 | 1             | 0.625319050608468 |        0.374680949391532 |       0.625319050608468 |           5
 687 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.983984377039906 |       0.0160156229600939 |       0.983984377039906 |           7
 690 | 2020-09-06 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.996254062051635 |       0.0037459379483646 |       0.996254062051635 |           8
 691 | 2020-09-08 | Boston Red Sox | Philadelphia Phillies |           0 | 1             | 0.933252294358305 |       0.0667477056416946 |       0.933252294358305 |           5
 697 | 2020-09-15 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.989202454749506 |        0.989202454749506 |      0.0107975452504942 |           2
 706 | 2020-09-25 | Boston Red Sox | Atlanta Braves        |           0 | 1             | 0.928880463633968 |       0.0711195363660317 |       0.928880463633968 |           7
 719 | 2021-04-14 | Boston Red Sox | Minnesota Twins       |           1 | 0             |  0.93563187345028 |         0.93563187345028 |      0.0643681265497205 |           3
 732 | 2021-04-27 | Boston Red Sox | New York Mets         |           1 | 0             | 0.926354761217187 |        0.926354761217187 |      0.0736452387828127 |           2
 733 | 2021-04-28 | Boston Red Sox | New York Mets         |           1 | 0             | 0.998947708265467 |        0.998947708265467 |     0.00105229173453289 |           1
 743 | 2021-05-09 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.536887965354298 |        0.536887965354298 |       0.463112034645702 |           4
 760 | 2021-05-29 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.751907685549346 |        0.751907685549346 |       0.248092314450654 |           3
 775 | 2021-06-14 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.967638922783762 |        0.967638922783762 |      0.0323610772162378 |           2
 791 | 2021-07-02 | Boston Red Sox | Oakland Athletics     |           1 | 0             | 0.862542388188141 |        0.862542388188141 |       0.137457611811859 |           3
 793 | 2021-07-04 | Boston Red Sox | Oakland Athletics     |           1 | 0             | 0.998994066350348 |        0.998994066350348 |     0.00100593364965188 |           1
 821 | 2021-08-07 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.919933789212095 |        0.919933789212095 |      0.0800662107879046 |           2
 822 | 2021-08-08 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.981941038621243 |       0.0180589613787573 |       0.981941038621243 |           8
 843 | 2021-09-01 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.966277333479711 |        0.966277333479711 |      0.0337226665202887 |           3
 849 | 2021-09-07 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.990253809277536 |      0.00974619072246361 |       0.990253809277536 |           7

(82 rows)

---------------------------------------------------------
-- Examining XBG Prediction Errors that BAYES got right 
---------------------------------------------------------

SELECT 
Key, 
Game_Date, 
Team, 
Opponent, 
Game_Result, 
ML_Prediction, 
ML_Probability, 
Class_0_Loss_Probability, 
Class_1_Win_Probability,
Runs_Scored

FROM 
BRS_2016_2021_Batting_probability_BAYES 

WHERE 
Game_Result = ML_Prediction
AND Key IN (SELECT Key FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result != ML_Prediction);


 Key | Game_Date  |      Team      |       Opponent        | Game_Result | ML_Prediction |  ML_Probability   | Class_0_Loss_Probability | Class_1_Win_Probability | Runs_Scored
-----+------------+----------------+-----------------------+-------------+---------------+-------------------+--------------------------+-------------------------+-------------
  39 | 2016-05-17 | Boston Red Sox | Kansas City Royals    |           0 | 0             | 0.562245129490672 |        0.562245129490672 |       0.437754870509328 |           4
  89 | 2016-07-16 | Boston Red Sox | New York Yankees      |           1 | 1             | 0.699121166986401 |        0.300878833013599 |       0.699121166986401 |           5
 130 | 2016-08-28 | Boston Red Sox | Kansas City Royals    |           0 | 0             | 0.536411625298995 |        0.536411625298995 |       0.463588374701005 |           4
 265 | 2017-07-26 | Boston Red Sox | Seattle Mariners      |           1 | 1             | 0.781629910197384 |        0.218370089802616 |       0.781629910197384 |           4
 489 | 2019-03-30 | Boston Red Sox | Seattle Mariners      |           0 | 0             | 0.978649133778905 |        0.978649133778905 |      0.0213508662210946 |           5
 498 | 2019-04-09 | Boston Red Sox | Toronto Blue Jays     |           0 | 0             | 0.509693515061783 |        0.509693515061783 |       0.490306484938217 |           5
 518 | 2019-05-02 | Boston Red Sox | Chicago White Sox     |           0 | 0             | 0.822143448227435 |        0.822143448227435 |       0.177856551772565 |           4
 614 | 2019-08-20 | Boston Red Sox | Philadelphia Phillies |           0 | 0             | 0.926810745261005 |        0.926810745261005 |      0.0731892547389945 |           2
 631 | 2019-09-10 | Boston Red Sox | Toronto Blue Jays     |           0 | 0             | 0.747080256866549 |        0.747080256866549 |       0.252919743133451 |           3
 666 | 2020-08-12 | Boston Red Sox | Tampa Bay Rays        |           0 | 0             |  0.58021299030278 |         0.58021299030278 |        0.41978700969722 |           5
 718 | 2021-04-13 | Boston Red Sox | Minnesota Twins       |           1 | 1             | 0.820232640584588 |        0.179767359415412 |       0.820232640584588 |           4
 739 | 2021-05-05 | Boston Red Sox | Detroit Tigers        |           0 | 0             | 0.690360643595275 |        0.690360643595275 |       0.309639356404725 |           5
 800 | 2021-07-16 | Boston Red Sox | New York Yankees      |           1 | 1             | 0.670265634505792 |        0.329734365494208 |       0.670265634505792 |           4
 814 | 2021-07-31 | Boston Red Sox | Tampa Bay Rays        |           0 | 0             | 0.573472541554728 |        0.573472541554728 |       0.426527458445272 |           5

(14 rows)


---------------------------------------------------------
-- Examining BAYES Prediction Errors that XGB got right 
---------------------------------------------------------

SELECT 
Key, 
Game_Date, 
Team, 
Opponent, 
Game_Result, 
ML_Prediction, 
ML_Probability, 
Class_0_Loss_Probability, 
Class_1_Win_Probability,
Runs_Scored

FROM 
BRS_2016_2021_Batting_probability_BAYES 

WHERE 
Game_Result != ML_Prediction
AND Key IN (SELECT Key FROM BRS_2016_2021_Batting_prediction_XGB WHERE Game_Result = ML_Prediction);

 Key | Game_Date  |      Team      |       Opponent        | Game_Result | ML_Prediction |  ML_Probability   | Class_0_Loss_Probability | Class_1_Win_Probability | Runs_Scored
-----+------------+----------------+-----------------------+-------------+---------------+-------------------+--------------------------+-------------------------+-------------
  23 | 2016-04-29 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.505846916460539 |        0.505846916460539 |       0.494153083539461 |           4
  36 | 2016-05-13 | Boston Red Sox | Houston Astros        |           0 | 1             | 0.716077289910426 |        0.283922710089574 |       0.716077289910426 |           6
  44 | 2016-05-22 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.671106642449218 |        0.671106642449218 |       0.328893357550782 |           5
  49 | 2016-05-28 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.999681174478535 |     0.000318825521464735 |       0.999681174478535 |           9
  53 | 2016-06-01 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.999752022639932 |     0.000247977360067569 |       0.999752022639932 |           9
  66 | 2016-06-17 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.836416260383299 |        0.163583739616701 |       0.836416260383299 |           4
  68 | 2016-06-19 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.828185569796742 |        0.828185569796742 |       0.171814430203258 |           2
  86 | 2016-07-09 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.583960316380656 |        0.583960316380656 |       0.416039683619344 |           4
  95 | 2016-07-23 | Boston Red Sox | Minnesota Twins       |           0 | 1             | 0.997087190085006 |      0.00291280991499406 |       0.997087190085006 |           9
  99 | 2016-07-27 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.720163535742683 |        0.279836464257317 |       0.720163535742683 |           3
 103 | 2016-07-31 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.791918509413789 |        0.791918509413789 |       0.208081490586211 |           5
 105 | 2016-08-02 | Boston Red Sox | Seattle Mariners      |           0 | 1             | 0.605914848886068 |        0.394085151113932 |       0.605914848886068 |           4
 107 | 2016-08-04 | Boston Red Sox | Seattle Mariners      |           1 | 0             | 0.891545523386622 |        0.891545523386622 |       0.108454476613378 |           3
 152 | 2016-09-21 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.797555888410678 |        0.797555888410678 |       0.202444111589322 |           5
 164 | 2017-04-05 | Boston Red Sox | Pittsburgh Pirates    |           1 | 0             | 0.975593001794922 |        0.975593001794922 |      0.0244069982050778 |           3
 165 | 2017-04-07 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.753613559597341 |        0.246386440402659 |       0.753613559597341 |           5
 170 | 2017-04-12 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.810923618064543 |        0.189076381935457 |       0.810923618064543 |           5
 171 | 2017-04-13 | Boston Red Sox | Pittsburgh Pirates    |           1 | 0             | 0.522374000962621 |        0.522374000962621 |       0.477625999037379 |           4
 175 | 2017-04-17 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.613721081796865 |        0.613721081796865 |       0.386278918203135 |           4
 185 | 2017-04-29 | Boston Red Sox | Chicago Cubs          |           0 | 1             | 0.714590797251617 |        0.285409202748383 |       0.714590797251617 |           4
 194 | 2017-05-09 | Boston Red Sox | Milwaukee Brewers     |           0 | 1             | 0.953561275190891 |       0.0464387248091088 |       0.953561275190891 |           7
 195 | 2017-05-10 | Boston Red Sox | Milwaukee Brewers     |           0 | 1             |  0.55271050825166 |         0.44728949174834 |        0.55271050825166 |           4
 196 | 2017-05-11 | Boston Red Sox | Milwaukee Brewers     |           1 | 0             | 0.879999204672318 |        0.879999204672318 |       0.120000795327682 |           4
 201 | 2017-05-17 | Boston Red Sox | St. Louis Cardinals   |           1 | 0             | 0.698940526824479 |        0.698940526824479 |       0.301059473175521 |           5
 214 | 2017-05-31 | Boston Red Sox | Chicago White Sox     |           1 | 0             | 0.826820090304278 |        0.826820090304278 |       0.173179909695722 |           4
 238 | 2017-06-26 | Boston Red Sox | Minnesota Twins       |           1 | 0             |  0.67810393798039 |         0.67810393798039 |        0.32189606201961 |           4
 252 | 2017-07-14 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.812983550348644 |        0.812983550348644 |       0.187016449651356 |           5
 257 | 2017-07-18 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.975498196001054 |        0.975498196001054 |      0.0245018039989464 |           5
 259 | 2017-07-20 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             |  0.82930370139315 |         0.17069629860685 |        0.82930370139315 |           6
 272 | 2017-08-04 | Boston Red Sox | Chicago White Sox     |           1 | 0             | 0.991153727881646 |        0.991153727881646 |     0.00884627211835355 |           3
 275 | 2017-08-08 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.966166327238448 |        0.966166327238448 |      0.0338336727615524 |           2
 288 | 2017-08-23 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.575859883080371 |        0.575859883080371 |       0.424140116919629 |           6
 289 | 2017-08-24 | Boston Red Sox | Cleveland Indians     |           0 | 1             |  0.80322452021277 |         0.19677547978723 |        0.80322452021277 |           6
 294 | 2017-08-29 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.621080260976764 |        0.621080260976764 |       0.378919739023236 |           3
 297 | 2017-09-01 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.849532249104888 |        0.849532249104888 |       0.150467750895112 |           4
 301 | 2017-09-05 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.999629313541072 |        0.999629313541072 |    0.000370686458927629 |           3
 325 | 2018-03-29 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.728949842419462 |        0.271050157580538 |       0.728949842419462 |           4
 330 | 2018-04-03 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.919338297883384 |        0.919338297883384 |      0.0806617021166161 |           4
 331 | 2018-04-05 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.963035796456222 |        0.963035796456222 |      0.0369642035437784 |           3
 347 | 2018-04-25 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             |  0.78888918093424 |         0.78888918093424 |        0.21111081906576 |           4
 351 | 2018-04-29 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.536802031528607 |        0.536802031528607 |       0.463197968471393 |           4
 355 | 2018-05-03 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.762484648261866 |        0.237515351738134 |       0.762484648261866 |           5
 360 | 2018-05-09 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.921746749394277 |       0.0782532506057234 |       0.921746749394277 |           6
 369 | 2018-05-18 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.735803651705614 |        0.264196348294386 |       0.735803651705614 |           4
 373 | 2018-05-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.930201881468658 |        0.930201881468658 |      0.0697981185313417 |           4
 389 | 2018-06-09 | Boston Red Sox | Chicago White Sox     |           1 | 0             | 0.902285848005699 |        0.902285848005699 |      0.0977141519943007 |           4
 410 | 2018-07-02 | Boston Red Sox | Washington Nationals  |           1 | 0             | 0.899702591225526 |        0.899702591225526 |       0.100297408774474 |           4
 418 | 2018-07-11 | Boston Red Sox | Texas Rangers         |           1 | 0             | 0.648944444783834 |        0.648944444783834 |       0.351055555216166 |           4
 420 | 2018-07-13 | Boston Red Sox | Toronto Blue Jays     |           0 | 1             | 0.879947526622303 |        0.120052473377697 |       0.879947526622303 |           7
 427 | 2018-07-24 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.930705539147996 |       0.0692944608520042 |       0.930705539147996 |           6
 429 | 2018-07-27 | Boston Red Sox | Minnesota Twins       |           1 | 0             | 0.543566739629315 |        0.543566739629315 |       0.456433260370685 |           4
 432 | 2018-07-30 | Boston Red Sox | Philadelphia Phillies |           1 | 0             |  0.98278699053732 |         0.98278699053732 |      0.0172130094626803 |           2
 437 | 2018-08-05 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.991664255002855 |        0.991664255002855 |     0.00833574499714531 |           5
 473 | 2018-09-15 | Boston Red Sox | New York Mets         |           1 | 0             | 0.598058903833522 |        0.598058903833522 |       0.401941096166478 |           5
 474 | 2018-09-16 | Boston Red Sox | New York Mets         |           1 | 0             | 0.530303753579519 |        0.530303753579519 |       0.469696246420481 |           4
 502 | 2019-04-14 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.559533056142391 |        0.559533056142391 |       0.440466943857609 |           4
 508 | 2019-04-21 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.827136709208502 |        0.827136709208502 |       0.172863290791498 |           4
 509 | 2019-04-23 | Boston Red Sox | Detroit Tigers        |           0 | 1             | 0.682290566076493 |        0.317709433923507 |       0.682290566076493 |           4
 524 | 2019-05-08 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.997206813519356 |        0.997206813519356 |     0.00279318648064344 |           2
 539 | 2019-05-26 | Boston Red Sox | Houston Astros        |           1 | 0             | 0.665004760554219 |        0.665004760554219 |       0.334995239445781 |           4
 542 | 2019-05-29 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.997813048376654 |        0.002186951623346 |       0.997813048376654 |           9
 554 | 2019-06-11 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.550519939393299 |        0.449480060606701 |       0.550519939393299 |           5
 555 | 2019-06-12 | Boston Red Sox | Texas Rangers         |           1 | 0             | 0.568858571694871 |        0.568858571694871 |       0.431141428305129 |           4
 588 | 2019-07-23 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             |  0.54984162799152 |         0.54984162799152 |        0.45015837200848 |           5
 594 | 2019-07-30 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.668341458853297 |        0.331658541146703 |       0.668341458853297 |           5
 604 | 2019-08-08 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.807278475954129 |        0.807278475954129 |       0.192721524045871 |           3
 608 | 2019-08-12 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.897605533652928 |        0.102394466347072 |       0.897605533652928 |           5
 617 | 2019-08-24 | Boston Red Sox | San Diego Padres      |           1 | 0             | 0.506627177049417 |        0.506627177049417 |       0.493372822950583 |           5
 622 | 2019-08-31 | Boston Red Sox | Los Angeles Angels    |           0 | 1             | 0.624461839609935 |        0.375538160390065 |       0.624461839609935 |           4
 623 | 2019-09-01 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.737058244021581 |        0.737058244021581 |       0.262941755978419 |           4
 638 | 2019-09-19 | Boston Red Sox | San Francisco Giants  |           1 | 0             | 0.645530993275866 |        0.645530993275866 |       0.354469006724134 |           5
 648 | 2019-09-29 | Boston Red Sox | Baltimore Orioles     |           1 | 0             | 0.543097486976271 |        0.543097486976271 |       0.456902513023729 |           5
 651 | 2020-07-26 | Boston Red Sox | Baltimore Orioles     |           0 | 1             | 0.605123085903362 |        0.394876914096638 |       0.605123085903362 |           4
 652 | 2020-07-27 | Boston Red Sox | New York Mets         |           0 | 1             | 0.714219808374638 |        0.285780191625362 |       0.714219808374638 |           4
 655 | 2020-07-30 | Boston Red Sox | New York Mets         |           1 | 0             | 0.732181600207578 |        0.732181600207578 |       0.267818399792422 |           4
 658 | 2020-08-02 | Boston Red Sox | New York Yankees      |           0 | 1             | 0.955886404987379 |       0.0441135950126209 |       0.955886404987379 |           7
 660 | 2020-08-05 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.519528125636743 |        0.519528125636743 |       0.480471874363257 |           5
 688 | 2020-09-04 | Boston Red Sox | Toronto Blue Jays     |           1 | 0             | 0.923162246161731 |        0.923162246161731 |      0.0768377538382694 |           3
 692 | 2020-09-08 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.532336659473049 |        0.532336659473049 |       0.467663340526951 |           5
 693 | 2020-09-10 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.912143851802977 |        0.912143851802977 |      0.0878561481970233 |           4
 695 | 2020-09-12 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.657455985503663 |        0.342544014496337 |       0.657455985503663 |           4
 699 | 2020-09-17 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.591791663069233 |        0.591791663069233 |       0.408208336930767 |           5
 713 | 2021-04-06 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.670883272210972 |        0.670883272210972 |       0.329116727789028 |           6
 736 | 2021-05-01 | Boston Red Sox | Texas Rangers         |           0 | 1             | 0.743535822999337 |        0.256464177000663 |       0.743535822999337 |           6
 748 | 2021-05-14 | Boston Red Sox | Los Angeles Angels    |           1 | 0             | 0.501050369032526 |        0.501050369032526 |       0.498949630967474 |           4
 755 | 2021-05-22 | Boston Red Sox | Philadelphia Phillies |           1 | 0             | 0.749573417387964 |        0.749573417387964 |       0.250426582612035 |           4
 764 | 2021-06-03 | Boston Red Sox | Houston Astros        |           1 | 0             | 0.608780821093157 |        0.608780821093157 |       0.391219178906843 |           5
 768 | 2021-06-07 | Boston Red Sox | Miami Marlins         |           1 | 0             | 0.536957265554152 |        0.536957265554152 |       0.463042734445848 |           5
 805 | 2021-07-22 | Boston Red Sox | New York Yankees      |           1 | 0             | 0.528948559418756 |        0.528948559418756 |       0.471051440581244 |           5
 838 | 2021-08-27 | Boston Red Sox | Cleveland Indians     |           1 | 0             | 0.710955209294115 |        0.710955209294115 |       0.289044790705885 |           4
 840 | 2021-08-29 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.667615045244375 |        0.332384954755625 |       0.667615045244375 |           5
 842 | 2021-08-31 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.613119291251123 |        0.386880708748877 |       0.613119291251123 |           5
 844 | 2021-09-02 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.925039442678364 |        0.925039442678364 |      0.0749605573216364 |           4
 847 | 2021-09-05 | Boston Red Sox | Cleveland Indians     |           0 | 1             | 0.761119623168607 |        0.238880376831393 |       0.761119623168607 |           5
 848 | 2021-09-06 | Boston Red Sox | Tampa Bay Rays        |           0 | 1             | 0.999158725043308 |     0.000841274956691646 |       0.999158725043308 |          10
 850 | 2021-09-08 | Boston Red Sox | Tampa Bay Rays        |           1 | 0             | 0.934793443776023 |        0.934793443776023 |      0.0652065562239768 |           2
 869 | 2021-10-02 | Boston Red Sox | Washington Nationals  |           1 | 0             | 0.678426804258196 |        0.678426804258196 |       0.321573195741804 |           5

(97 rows)