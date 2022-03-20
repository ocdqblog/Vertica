-------------------------------------------------------
-- Classification using Random Forest (RF)  
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2021_HR_RandomForestModel;

SELECT RF_CLASSIFIER ('BRS_2021_HR_RandomForestModel', 
                      'BRS_2021_HR_input', 
                      'Game_Result', 
                      'Runs_Scored, Hits, Home_Runs, Runs_Batted_In');


SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2021_HR_RandomForestModel');


===========
call_string
===========
SELECT rf_classifier('public.BRS_2021_HR_RandomForestModel', 'BRS_2021_HR_input', 'game_result', 'Runs_Scored, Hits, Home_Runs, Runs_Batted_In' USING PARAMETERS exclude_columns='', ntree=20, mtry=2, sampling_size=0.632, max_depth=5, max_breadth=32, min_leaf_size=1, min_info_gain=0, nbins=32);

=======
details
=======
  predictor   |type
--------------+----
 runs_scored  |int
     hits     |int
  home_runs   |int
runs_batted_in|int


===============
Additional Info
===============
       Name       |Value
------------------+-----
    tree_count    | 20
rejected_row_count|  0
accepted_row_count| 820

(1 row)