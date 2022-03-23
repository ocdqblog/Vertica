-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG)  
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2016_2021_LOGREGModel;

SELECT LOGISTIC_REG ('BRS_2016_2021_LOGREGModel', 
                     'BRS_2016_2021_encoded', 
                     'Game_Result',
                     'Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28' USING PARAMETERS optimizer='BFGS');

                    
SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2016_2021_LOGREGModel'); 


=======
details
=======
 predictor |coefficient|std_err |z_value |p_value
-----------+-----------+--------+--------+--------
 Intercept |  1.16369  | 1.35900| 0.85628| 0.39184
opponent_0 | -0.46207  | 1.36067|-0.33959| 0.73417
opponent_1 | -0.54170  | 1.41065|-0.38400| 0.70098
opponent_2 | -0.63748  | 1.37191|-0.46467| 0.64217
opponent_3 | -0.48246  | 1.46434|-0.32947| 0.74180
opponent_4 | -0.87997  | 1.36456|-0.64487| 0.51901
opponent_5 |  6.57229  |12.12269| 0.54215| 0.58772
opponent_6 | -0.91046  | 1.36121|-0.66886| 0.50358
opponent_7 | -0.24204  | 1.38455|-0.17482| 0.86122
opponent_8 | -1.10242  | 1.36646|-0.80677| 0.41980
opponent_9 | -1.40062  | 1.38830|-1.00887| 0.31304
opponent_10| -0.69834  | 1.37928|-0.50631| 0.61264
opponent_11| -0.78568  | 1.35707|-0.57896| 0.56262
opponent_12| -1.91308  | 1.67992|-1.13879| 0.25479
opponent_13|  1.00674  | 1.58220| 0.63629| 0.52459
opponent_14| -1.86137  | 1.75286|-1.06191| 0.28828
opponent_15| -0.68158  | 1.36319|-0.49998| 0.61709
opponent_16| -0.15867  | 1.35813|-0.11683| 0.90699
opponent_17| -1.45120  | 1.36810|-1.06074| 0.28881
opponent_18| -1.03486  | 1.36718|-0.75693| 0.44909
opponent_19| -0.97965  | 1.42656|-0.68672| 0.49226
opponent_20|  6.57229  |12.12269| 0.54215| 0.58772
opponent_21| -0.46207  | 1.36067|-0.33959| 0.73417
opponent_22| -0.89966  | 1.46091|-0.61582| 0.53801
opponent_23| -0.92615  | 1.36012|-0.68093| 0.49592
opponent_24|  7.19309  |12.86590| 0.55908| 0.57611
opponent_25| -1.18280  | 1.37615|-0.85950| 0.39006
opponent_26| -0.60626  | 1.36936|-0.44273| 0.65796
opponent_27| -0.75826  | 1.37572|-0.55118| 0.58151
opponent_28|  0.87811  | 1.58658| 0.55346| 0.57995


==============
regularization
==============
type| lambda
----+--------
none| 1.00000


===========
call_string
===========
logistic_reg('public.BRS_2016_2021_LOGREGModel', 'BRS_2016_2021_encoded', '"game_result"', 'Opponent_0, Opponent_1, Opponent_2, Opponent_3, Opponent_4, Opponent_5, Opponent_6, Opponent_7, Opponent_8, Opponent_9, Opponent_10, Opponent_11, Opponent_12, Opponent_13, Opponent_14, Opponent_15, Opponent_16, Opponent_17, Opponent_18, Opponent_19, Opponent_20, Opponent_21, Opponent_22, Opponent_23, Opponent_24, Opponent_25, Opponent_26, Opponent_27, Opponent_28'
USING PARAMETERS optimizer='bfgs', epsilon=1e-06, max_iterations=100, regularization='none', lambda=1, alpha=0.5)

===============
Additional Info
===============
       Name       |Value
------------------+-----
 iteration_count  | 90
rejected_row_count|  0
accepted_row_count| 870

(1 row)