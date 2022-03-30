---------------------------------------------------------
-- Classification using eXtreme Gradient Boosting (XGB)  
---------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_Batting_XGBModel;

SELECT XGB_CLASSIFIER (
'BRS_2016_2021_Batting_XGBModel', 
'BRS_2016_2021_Batting_input', 
'Game_Result',
'At_Bats,Runs_Scored,Hits,Doubles,Triples,Home_Runs,Runs_Batted_In,Walks,Strikeouts,Hit_By_Pitch,Sacrifice_Hits,Sacrifice_Flies,Reached_On_Error,Grounded_into_Double_Play,Stolen_Bases,Caught_Stealing,Runners_Left_On_Base');

                    
SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2016_2021_Batting_XGBModel'); 


===========
call_string
===========
xgb_classifier('public.BRS_2016_2021_Batting_XGBModel', 'BRS_2016_2021_Batting_input', '"game_result"', 'At_Bats,Runs_Scored,Hits,Doubles,Triples,Home_Runs,Runs_Batted_In,Walks,Strikeouts,Hit_By_Pitch,Sacrifice_Hits,Sacrifice_Flies,Reached_On_Error,Grounded_into_Double_Play,Stolen_Bases,Caught_Stealing,Runners_Left_On_Base' USING PARAMETERS exclude_columns='', max_ntree=10, max_depth=6, learning_rate=0.3, min_split_loss=0, weight_reg=1, nbins=32, objective=crossentropy, sampling_size=1, col_sample_by_tree=1, col_sample_by_node=1)

=======
details
=======
        predictor        |type
-------------------------+----
         at_bats         |int
       runs_scored       |int
          hits           |int
         doubles         |int
         triples         |int
        home_runs        |int
     runs_batted_in      |int
          walks          |int
       strikeouts        |int
      hit_by_pitch       |int
     sacrifice_hits      |int
     sacrifice_flies     |int
    reached_on_error     |int
grounded_into_double_play|int
      stolen_bases       |int
     caught_stealing     |int
  runners_left_on_base   |int


==================
initial_prediction
==================
response_label| value
--------------+--------
      0       | 0.00000
      1       | 0.00000


===============
Additional Info
===============
       Name       |Value
------------------+-----
    tree_count    | 10
rejected_row_count|  0
accepted_row_count| 870

(1 row)