---------------------------------------------------------
--     Classification using Naive Bayes (BAYES)  
---------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_Batting_BAYESModel;

SELECT NAIVE_BAYES (
'BRS_2016_2021_Batting_BAYESModel', 
'BRS_2016_2021_Batting_input', 
'Game_Result',
'At_Bats,Runs_Scored,Hits,Doubles,Triples,Home_Runs,Runs_Batted_In,Walks,Strikeouts,Hit_By_Pitch,Sacrifice_Hits,Sacrifice_Flies,Reached_On_Error,Grounded_into_Double_Play,Stolen_Bases,Caught_Stealing,Runners_Left_On_Base');

                    
SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2016_2021_Batting_BAYESModel');


=======
details
=======
index|        predictor        |   type
-----+-------------------------+-----------
  0  |       Game_Result       | ResponseI
  1  |         At_Bats         |Multinomial
  2  |       Runs_Scored       |Multinomial
  3  |          Hits           |Multinomial
  4  |         Doubles         |Multinomial
  5  |         Triples         |Multinomial
  6  |        Home_Runs        |Multinomial
  7  |     Runs_Batted_In      |Multinomial
  8  |          Walks          |Multinomial
  9  |       Strikeouts        |Multinomial
 10  |      Hit_By_Pitch       |Multinomial
 11  |     Sacrifice_Hits      |Multinomial
 12  |     Sacrifice_Flies     |Multinomial
 13  |    Reached_On_Error     |Multinomial
 14  |Grounded_into_Double_Play|Multinomial
 15  |      Stolen_Bases       |Multinomial
 16  |     Caught_Stealing     |Multinomial
 17  |  Runners_Left_On_Base   |Multinomial


=====
prior
=====
class|probability
-----+-----------
  0  |  0.43218
  1  |  0.56782


===========
call_string
===========
naive_bayes('public.BRS_2016_2021_Batting_BAYESModel', 'BRS_2016_2021_Batting_input', '"game_result"', 'At_Bats,Runs_Scored,Hits,Doubles,Triples,Home_Runs,Runs_Batted_In,Walks,Strikeouts,Hit_By_Pitch,Sacrifice_Hits,Sacrifice_Flies,Reached_On_Error,Grounded_into_Double_Play,Stolen_Bases,Caught_Stealing,Runners_Left_On_Base' USING PARAMETERS exclude_columns='', alpha=1)

=============
multinomial.0
=============
index|probability
-----+-----------
  1  |  0.48090
  2  |  0.04231
  3  |  0.10663
  4  |  0.02261
  5  |  0.00136
  6  |  0.01206
  7  |  0.03983
  8  |  0.04201
  9  |  0.12242
 10  |  0.00403
 11  |  0.00075
 12  |  0.00241
 13  |  0.00463
 14  |  0.01070
 15  |  0.00561
 16  |  0.00211
 17  |  0.09962


=============
multinomial.1
=============
index|probability
-----+-----------
  1  |  0.41760
  2  |  0.08186
  3  |  0.12565
  4  |  0.02844
  5  |  0.00233
  6  |  0.01930
  7  |  0.07765
  8  |  0.04459
  9  |  0.08812
 10  |  0.00421
 11  |  0.00095
 12  |  0.00374
 13  |  0.00459
 14  |  0.00961
 15  |  0.00728
 16  |  0.00219
 17  |  0.08188


===============
Additional Info
===============
       Name       | Value
------------------+--------
      alpha       | 1.00000
accepted_row_count|  870
rejected_row_count|   0

(1 row)