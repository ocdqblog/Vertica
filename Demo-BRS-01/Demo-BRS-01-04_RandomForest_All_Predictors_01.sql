---------------------------------------------------------
--       Classification using Random Forest (RF) 
--  Using all non-response input columns as predictors
---------------------------------------------------------

DROP MODEL IF EXISTS BRS_2021_RandomForestModel;

SELECT RF_CLASSIFIER ('BRS_2021_RandomForestModel', 
                      'BRS_2021_input', 
                      'Game_Result', 
                      'At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging');

SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2021_RandomForestModel');


===========
call_string
===========
SELECT rf_classifier('public.BRS_2021_RandomForestModel', 'BRS_2021_input', 'game_result', 'At_Bats, Runs_Scored, Hits, Runs_Batted_In, Walks, Strikeouts, Batting_Average, On_Base_Percentage, Slugging_Percentage, OnBase_Plus_Slugging' USING PARAMETERS exclude_columns='', ntree=20, mtry=3, sampling_size=0.632, max_depth=5, max_breadth=32, min_leaf_size=1, min_info_gain=0, nbins=32);

=======
details
=======
     predictor      |      type
--------------------+----------------
      at_bats       |      int
    runs_scored     |      int
        hits        |      int
   runs_batted_in   |      int
       walks        |      int
     strikeouts     |      int
  batting_average   |float or numeric
 on_base_percentage |float or numeric
slugging_percentage |float or numeric
onbase_plus_slugging|float or numeric


===============
Additional Info
===============
       Name       |Value
------------------+-----
    tree_count    | 20
rejected_row_count|  0
accepted_row_count| 81

(1 row)


