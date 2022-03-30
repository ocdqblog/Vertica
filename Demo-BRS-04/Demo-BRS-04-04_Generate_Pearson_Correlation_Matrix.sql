---------------------------------------------------
--  Generate the Pearson Correlation Matrix for 
--         BRS_2016_2021_Batting_input
---------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_corr_matrix;

CREATE TABLE BRS_2016_2021_Batting_corr_matrix 
AS SELECT CM.variable_name_1 AS Variable_Name_1, 
   CM.variable_name_2 AS Variable_Name_2, 
   CM.corr_value AS Pearson_Correlation_Coefficient                        
   FROM  
   (SELECT CORR_MATRIX (Game_Result,
                        At_Bats,
                        Runs_Scored,
                        Hits,
                        Doubles,
                        Triples,
                        Home_Runs,
                        Runs_Batted_In,
                        Walks,
                        Strikeouts,
                        Hit_By_Pitch,
                        Sacrifice_Hits,
                        Sacrifice_Flies,
                        Reached_On_Error,
                        Grounded_into_Double_Play,
                        Stolen_Bases,
                        Caught_Stealing,
                        Runners_Left_On_Base,
                        Number_of_Players_Used_in_Game,
                        Attendance_in_Tickets_Sold,
                        Game_Length_in_Minutes) OVER() FROM BRS_2016_2021_Batting_input) AS CM;


---------------------------------------------------
-- Pearson Correlation Matrix >= 0.5
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient >= 0.5 AND Pearson_Correlation_Coefficient != 1 
ORDER BY Pearson_Correlation_Coefficient DESC;


    Variable_Name_1     |    Variable_Name_2     | Pearson_Correlation_Coefficient
------------------------+------------------------+---------------------------------
 Runs_Scored            | Runs_Batted_In         |               0.986703758081603
 Runs_Batted_In         | Runs_Scored            |               0.986703758081603
 Hits                   | Runs_Scored            |               0.800716520635547
 Runs_Scored            | Hits                   |               0.800716520635547
 Hits                   | Runs_Batted_In         |                0.79673606118472
 Runs_Batted_In         | Hits                   |                0.79673606118472
 Hits                   | At_Bats                |               0.723576981453958
 At_Bats                | Hits                   |               0.723576981453958
 At_Bats                | Game_Length_in_Minutes |               0.656483834924951
 Game_Length_in_Minutes | At_Bats                |               0.656483834924951
 Runs_Batted_In         | Home_Runs              |               0.579782477126661
 Home_Runs              | Runs_Batted_In         |               0.579782477126661
 Doubles                | Hits                   |               0.571375475897597
 Hits                   | Doubles                |               0.571375475897597
 Runs_Scored            | Game_Result            |               0.569456618567266
 Game_Result            | Runs_Scored            |               0.569456618567266
 Home_Runs              | Runs_Scored            |                0.56034258694263
 Runs_Scored            | Home_Runs              |                0.56034258694263
 Runs_Batted_In         | Game_Result            |               0.558426364405278
 Game_Result            | Runs_Batted_In         |               0.558426364405278
 Runners_Left_On_Base   | Walks                  |               0.541774502538705
 Walks                  | Runners_Left_On_Base   |               0.541774502538705
 Runs_Batted_In         | Doubles                |               0.531615944926845
 Doubles                | Runs_Batted_In         |               0.531615944926845
 Runs_Scored            | Doubles                |               0.530696260530159
 Doubles                | Runs_Scored            |               0.530696260530159
 Runs_Scored            | At_Bats                |               0.513818674759016
 At_Bats                | Runs_Scored            |               0.513818674759016
 Runs_Batted_In         | At_Bats                |               0.508845285248383
 At_Bats                | Runs_Batted_In         |               0.508845285248383
 Runners_Left_On_Base   | At_Bats                |               0.507137557480591
 At_Bats                | Runners_Left_On_Base   |               0.507137557480591

(32 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Game_Result
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Game_Result'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Game_Result     | Runs_Scored                    |               0.569456618567266
 Game_Result     | Runs_Batted_In                 |               0.558426364405278
 Game_Result     | Hits                           |                0.43175546243393
 Game_Result     | Home_Runs                      |               0.329409844139473
 Game_Result     | Doubles                        |               0.250385876283949
 Game_Result     | Walks                          |               0.198120660813061
 Game_Result     | At_Bats                        |               0.171393006539623
 Game_Result     | Sacrifice_Flies                |               0.142241965031141
 Game_Result     | Triples                        |               0.126641160122832
 Game_Result     | Stolen_Bases                   |               0.125662834755986
 Game_Result     | Hit_By_Pitch                   |              0.0630897813489684
 Game_Result     | Reached_On_Error               |              0.0528781681505505
 Game_Result     | Sacrifice_Hits                 |              0.0526732403393836
 Game_Result     | Caught_Stealing                |              0.0476165372943238
 Game_Result     | Grounded_into_Double_Play      |              0.0370729978259745
 Game_Result     | Attendance_in_Tickets_Sold     |              0.0273519132655309
 Game_Result     | Game_Length_in_Minutes         |              0.0122484766891262
 Game_Result     | Runners_Left_On_Base           |             -0.0128006531712312
 Game_Result     | Number_of_Players_Used_in_Game |             -0.0428806997785463
 Game_Result     | Strikeouts                     |              -0.199828316510282

(20 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Runs_Scored
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Runs_Scored'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Runs_Scored     | Runs_Batted_In                 |               0.986703758081603
 Runs_Scored     | Hits                           |               0.800716520635547
 Runs_Scored     | Game_Result                    |               0.569456618567266
 Runs_Scored     | Home_Runs                      |                0.56034258694263
 Runs_Scored     | Doubles                        |               0.530696260530159
 Runs_Scored     | At_Bats                        |               0.513818674759016
 Runs_Scored     | Walks                          |               0.342841830383053
 Runs_Scored     | Game_Length_in_Minutes         |                0.25563724976712
 Runs_Scored     | Sacrifice_Flies                |               0.225784896919925
 Runs_Scored     | Triples                        |               0.172679951647914
 Runs_Scored     | Reached_On_Error               |                0.11701588222942
 Runs_Scored     | Runners_Left_On_Base           |               0.109983467325392
 Runs_Scored     | Hit_By_Pitch                   |               0.106738576811564
 Runs_Scored     | Number_of_Players_Used_in_Game |              0.0975464195112646
 Runs_Scored     | Stolen_Bases                   |              0.0798783616265361
 Runs_Scored     | Attendance_in_Tickets_Sold     |               0.042983068787424
 Runs_Scored     | Sacrifice_Hits                 |             0.00737546750137168
 Runs_Scored     | Grounded_into_Double_Play      |             0.00694087428113268
 Runs_Scored     | Caught_Stealing                |            -0.00792023039022915
 Runs_Scored     | Strikeouts                     |              -0.194565358359379

(20 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Hits
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Hits'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Hits            | Runs_Scored                    |               0.800716520635547
 Hits            | Runs_Batted_In                 |                0.79673606118472
 Hits            | At_Bats                        |               0.723576981453958
 Hits            | Doubles                        |               0.571375475897597
 Hits            | Runners_Left_On_Base           |               0.443269750618941
 Hits            | Game_Result                    |                0.43175546243393
 Hits            | Home_Runs                      |                  0.409785278224
 Hits            | Game_Length_in_Minutes         |               0.355867530943783
 Hits            | Triples                        |               0.188071008043437
 Hits            | Walks                          |               0.182010577012792
 Hits            | Sacrifice_Flies                |               0.139308650452739
 Hits            | Number_of_Players_Used_in_Game |              0.0824705158052401
 Hits            | Grounded_into_Double_Play      |              0.0802898022741384
 Hits            | Stolen_Bases                   |              0.0751387251812701
 Hits            | Hit_By_Pitch                   |               0.062335807494859
 Hits            | Attendance_in_Tickets_Sold     |              0.0479944493327959
 Hits            | Reached_On_Error               |              0.0451241318516689
 Hits            | Caught_Stealing                |              0.0347960298621039
 Hits            | Sacrifice_Hits                 |              0.0147783248482036
 Hits            | Strikeouts                     |              -0.154862038647193

(20 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Walks
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Walks'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Walks           | Runners_Left_On_Base           |               0.541774502538705
 Walks           | Game_Length_in_Minutes         |               0.379023046731654
 Walks           | Runs_Scored                    |               0.342841830383053
 Walks           | Runs_Batted_In                 |               0.329209110581914
 Walks           | Game_Result                    |               0.198120660813061
 Walks           | Hits                           |               0.182010577012792
 Walks           | Number_of_Players_Used_in_Game |               0.164515500660209
 Walks           | At_Bats                        |               0.145040440917992
 Walks           | Doubles                        |               0.142251338516537
 Walks           | Stolen_Bases                   |               0.140024116906081
 Walks           | Grounded_into_Double_Play      |               0.130023725575482
 Walks           | Sacrifice_Flies                |               0.126894627468109
 Walks           | Sacrifice_Hits                 |               0.120111341757195
 Walks           | Caught_Stealing                |              0.0909867273221392
 Walks           | Attendance_in_Tickets_Sold     |              0.0680174347942046
 Walks           | Home_Runs                      |              0.0451083293762516
 Walks           | Triples                        |              0.0326808130774041
 Walks           | Hit_By_Pitch                   |              0.0178605654474875
 Walks           | Reached_On_Error               |             0.00455019278117723
 Walks           | Strikeouts                     |             -0.0548783730027694

(20 rows)