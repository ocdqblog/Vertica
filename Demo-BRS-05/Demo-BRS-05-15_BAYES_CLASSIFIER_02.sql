---------------------------------------------------------
--     Classification using Naive Bayes (BAYES)  
---------------------------------------------------------

---------------------------------------------------------
--     Create the model   
---------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_WP_BAYES_model;

SELECT NAIVE_BAYES (
'BRS_2016_2021_WP_BAYES_model', 
'BRS_2016_2021_WP_BAYES_input', 
'Game_Result',
'Runs_Scored_Metric_0, Runs_Scored_Metric_1, Runs_Scored_Metric_2, Runs_Scored_Metric_3, Runs_Scored_Metric_4, Hits_Metric_0, Hits_Metric_1, Hits_Metric_2, Home_Runs_Metric_0, Home_Runs_Metric_1, Home_Runs_Metric_2, Extra_Base_Hits_Metric_0, Extra_Base_Hits_Metric_1, Extra_Base_Hits_Metric_2, Walks_Minus_Strikeouts_Metric_0, Walks_Minus_Strikeouts_Metric_1, Walks_Minus_Strikeouts_Metric_2');

                    
SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2016_2021_WP_BAYES_model');


=======
details
=======
index|           predictor           |   type
-----+-------------------------------+-----------
  0  |          Game_Result          | ResponseI
  1  |     Runs_Scored_Metric_0      |Multinomial
  2  |     Runs_Scored_Metric_1      |Multinomial
  3  |     Runs_Scored_Metric_2      |Multinomial
  4  |     Runs_Scored_Metric_3      |Multinomial
  5  |     Runs_Scored_Metric_4      |Multinomial
  6  |         Hits_Metric_0         |Multinomial
  7  |         Hits_Metric_1         |Multinomial
  8  |         Hits_Metric_2         |Multinomial
  9  |      Home_Runs_Metric_0       |Multinomial
 10  |      Home_Runs_Metric_1       |Multinomial
 11  |      Home_Runs_Metric_2       |Multinomial
 12  |   Extra_Base_Hits_Metric_0    |Multinomial
 13  |   Extra_Base_Hits_Metric_1    |Multinomial
 14  |   Extra_Base_Hits_Metric_2    |Multinomial
 15  |Walks_Minus_Strikeouts_Metric_0|Multinomial
 16  |Walks_Minus_Strikeouts_Metric_1|Multinomial
 17  |Walks_Minus_Strikeouts_Metric_2|Multinomial


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
naive_bayes('public.BRS_2016_2021_WP_BAYES_model', 'BRS_2016_2021_WP_BAYES_input', '"game_result"', 'Runs_Scored_Metric_0, Runs_Scored_Metric_1, Runs_Scored_Metric_2, Runs_Scored_Metric_3, Runs_Scored_Metric_4, Hits_Metric_0, Hits_Metric_1, Hits_Metric_2, Home_Runs_Metric_0, Home_Runs_Metric_1, Home_Runs_Metric_2, Extra_Base_Hits_Metric_0, Extra_Base_Hits_Metric_1, Extra_Base_Hits_Metric_2, Walks_Minus_Strikeouts_Metric_0, Walks_Minus_Strikeouts_Metric_1, Walks_Minus_Strikeouts_Metric_2' USING PARAMETERS exclude_columns='', alpha=1)

=============
multinomial.0
=============
index|probability
-----+-----------
  1  |  0.05588
  2  |  0.07433
  3  |  0.04639
  4  |  0.02267
  5  |  0.00158
  6  |  0.01265
  7  |  0.14128
  8  |  0.04586
  9  |  0.08065
 10  |  0.08224
 11  |  0.03690
 12  |  0.01581
 13  |  0.17501
 14  |  0.00896
 15  |  0.17501
 16  |  0.00422
 17  |  0.02056


=============
multinomial.1
=============
index|probability
-----+-----------
  1  |  0.00362
  2  |  0.01769
  3  |  0.05468
  4  |  0.08645
  5  |  0.03820
  6  |  0.00080
  7  |  0.08082
  8  |  0.11821
  9  |  0.03739
 10  |  0.06433
 11  |  0.09811
 12  |  0.00161
 13  |  0.14877
 14  |  0.04946
 15  |  0.15923
 16  |  0.01287
 17  |  0.02774


===============
Additional Info
===============
       Name       | Value
------------------+--------
      alpha       | 1.00000
accepted_row_count|  870
rejected_row_count|   0

(1 row)