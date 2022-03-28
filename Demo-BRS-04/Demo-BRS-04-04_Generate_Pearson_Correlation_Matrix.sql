---------------------------------------------------
--  Generate the Pearson Correlation Matrix for 
--         BRS_2016_2021_Batting_input
---------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_corr_matrix;

CREATE TABLE BRS_2016_2021_Batting_corr_matrix AS SELECT CM.variable_name_1 AS Variable_Name_1, CM.variable_name_2 AS Variable_Name_2, CM.corr_value AS Pearson_Correlation_Coefficient 
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
 Runs_Scored            | Runs_Batted_In         |               0.986677612989541
 Runs_Batted_In         | Runs_Scored            |               0.986677612989541
 Hits                   | Runs_Scored            |               0.804259501138278
 Runs_Scored            | Hits                   |               0.804259501138278
 Hits                   | Runs_Batted_In         |               0.799447531029803
 Runs_Batted_In         | Hits                   |               0.799447531029803
 Hits                   | At_Bats                |               0.726750246077111
 At_Bats                | Hits                   |               0.726750246077111
 At_Bats                | Game_Length_in_Minutes |               0.663235316864618
 Game_Length_in_Minutes | At_Bats                |               0.663235316864618
 Runs_Batted_In         | Home_Runs              |               0.588093372872726
 Home_Runs              | Runs_Batted_In         |               0.588093372872726
 Doubles                | Hits                   |               0.577229358980546
 Hits                   | Doubles                |               0.577229358980546
 Runs_Scored            | Game_Result            |                0.57334691422394
 Game_Result            | Runs_Scored            |                0.57334691422394
 Home_Runs              | Runs_Scored            |                0.56947053012847
 Runs_Scored            | Home_Runs              |                0.56947053012847
 Runs_Batted_In         | Game_Result            |               0.562625783200702
 Game_Result            | Runs_Batted_In         |               0.562625783200702
 Runners_Left_On_Base   | Walks                  |                0.54635197043545
 Walks                  | Runners_Left_On_Base   |                0.54635197043545
 Runs_Batted_In         | Doubles                |               0.540867301033761
 Doubles                | Runs_Batted_In         |               0.540867301033761
 Runs_Scored            | Doubles                |               0.537302954294358
 Doubles                | Runs_Scored            |               0.537302954294358
 Runs_Scored            | At_Bats                |               0.514578348787496
 At_Bats                | Runs_Scored            |               0.514578348787496
 At_Bats                | Runners_Left_On_Base   |               0.508344146678245
 Runners_Left_On_Base   | At_Bats                |               0.508344146678245
 Runs_Batted_In         | At_Bats                |               0.507566202659097
 At_Bats                | Runs_Batted_In         |               0.507566202659097

(32 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Game_Result
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Game_Result'
ORDER BY Pearson_Correlation_Coefficient DESC;

 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Game_Result     | Runs_Scored                    |                0.57334691422394
 Game_Result     | Runs_Batted_In                 |               0.562625783200702
 Game_Result     | Hits                           |               0.438606921533123
 Game_Result     | Home_Runs                      |               0.333551188484333
 Game_Result     | Doubles                        |               0.259839851318805
 Game_Result     | Walks                          |               0.191190868644428
 Game_Result     | At_Bats                        |               0.180511838282455
 Game_Result     | Stolen_Bases                   |               0.149597787281031
 Game_Result     | Sacrifice_Flies                |               0.144161215507922
 Game_Result     | Triples                        |               0.131675619043015
 Game_Result     | Hit_By_Pitch                   |              0.0671766609909617
 Game_Result     | Reached_On_Error               |               0.057810593136492
 Game_Result     | Grounded_into_Double_Play      |              0.0532012136111685
 Game_Result     | Sacrifice_Hits                 |              0.0495317387372651
 Game_Result     | Caught_Stealing                |              0.0414407981548775
 Game_Result     | Game_Length_in_Minutes         |              0.0204686787513652
 Game_Result     | Runners_Left_On_Base           |             -0.0184935398383132
 Game_Result     | Attendance_in_Tickets_Sold     |             -0.0348571250485237
 Game_Result     | Number_of_Players_Used_in_Game |             -0.0420023256039244
 Game_Result     | Strikeouts                     |              -0.199152533738936

(20 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Runs_Scored
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Runs_Scored'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Runs_Scored     | Runs_Batted_In                 |               0.986677612989541
 Runs_Scored     | Hits                           |               0.804259501138278
 Runs_Scored     | Home_Runs                      |                0.56947053012847
 Runs_Scored     | Doubles                        |               0.537302954294358
 Runs_Scored     | At_Bats                        |               0.514578348787496
 Runs_Scored     | Walks                          |               0.339732374101545
 Runs_Scored     | Game_Length_in_Minutes         |               0.256833213968956
 Runs_Scored     | Sacrifice_Flies                |               0.220395165626142
 Runs_Scored     | Triples                        |               0.173734407599743
 Runs_Scored     | Reached_On_Error               |               0.127095618129261
 Runs_Scored     | Hit_By_Pitch                   |               0.110700521680633
 Runs_Scored     | Runners_Left_On_Base           |               0.107910799420354
 Runs_Scored     | Number_of_Players_Used_in_Game |              0.0955013309391699
 Runs_Scored     | Stolen_Bases                   |               0.085170965924635
 Runs_Scored     | Attendance_in_Tickets_Sold     |              0.0300435335726948
 Runs_Scored     | Grounded_into_Double_Play      |              0.0295523951128435
 Runs_Scored     | Sacrifice_Hits                 |             0.00597688164919012
 Runs_Scored     | Caught_Stealing                |            -0.00658510203832216
 Runs_Scored     | Strikeouts                     |              -0.196483185599928

(19 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Hits
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Hits'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Hits            | Runs_Scored                    |               0.804259501138278
 Hits            | Runs_Batted_In                 |               0.799447531029803
 Hits            | At_Bats                        |               0.726750246077111
 Hits            | Doubles                        |               0.577229358980546
 Hits            | Runners_Left_On_Base           |               0.440397383391111
 Hits            | Home_Runs                      |               0.420658191841083
 Hits            | Game_Length_in_Minutes         |               0.361824340635101
 Hits            | Triples                        |               0.189806342081445
 Hits            | Walks                          |               0.186923787223051
 Hits            | Sacrifice_Flies                |               0.137187603139065
 Hits            | Grounded_into_Double_Play      |              0.0958235631661871
 Hits            | Stolen_Bases                   |              0.0861515576033018
 Hits            | Number_of_Players_Used_in_Game |              0.0805531497998648
 Hits            | Attendance_in_Tickets_Sold     |              0.0568113508474804
 Hits            | Hit_By_Pitch                   |              0.0545043585231346
 Hits            | Reached_On_Error               |               0.049462911300532
 Hits            | Caught_Stealing                |              0.0323912426727721
 Hits            | Sacrifice_Hits                 |              0.0235821081069018
 Hits            | Strikeouts                     |              -0.156075783909184

(19 rows)

---------------------------------------------------
-- Pearson Correlation Matrix for Walks
---------------------------------------------------

SELECT * FROM BRS_2016_2021_Batting_corr_matrix 
WHERE Pearson_Correlation_Coefficient != 1 AND Variable_Name_1 = 'Walks'
ORDER BY Pearson_Correlation_Coefficient DESC;


 Variable_Name_1 |        Variable_Name_2         | Pearson_Correlation_Coefficient
-----------------+--------------------------------+---------------------------------
 Walks           | Runners_Left_On_Base           |                0.54635197043545
 Walks           | Game_Length_in_Minutes         |               0.372593242116555
 Walks           | Runs_Scored                    |               0.339732374101545
 Walks           | Runs_Batted_In                 |               0.326304580115344
 Walks           | Hits                           |               0.186923787223051
 Walks           | Number_of_Players_Used_in_Game |               0.165665279075309
 Walks           | Grounded_into_Double_Play      |               0.151158041744944
 Walks           | At_Bats                        |               0.147122971415108
 Walks           | Stolen_Bases                   |                0.14682910901456
 Walks           | Doubles                        |               0.136345289075443
 Walks           | Sacrifice_Hits                 |               0.120035507919369
 Walks           | Sacrifice_Flies                |               0.112098652296627
 Walks           | Caught_Stealing                |               0.100881463933507
 Walks           | Attendance_in_Tickets_Sold     |              0.0552035686895443
 Walks           | Home_Runs                      |              0.0456817842321552
 Walks           | Triples                        |              0.0433693612044488
 Walks           | Hit_By_Pitch                   |              0.0352505155216299
 Walks           | Reached_On_Error               |            -0.00281883890557337
 Walks           | Strikeouts                     |             -0.0641160676158456

(19 rows)