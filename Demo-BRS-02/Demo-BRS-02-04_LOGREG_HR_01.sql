-------------------------------------------------------
-- Classification using Logistic Regression (LOGREG) 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2021_HR_LogisticRegressionModel;

SELECT LOGISTIC_REG('BRS_2021_HR_LogisticRegressionModel', 
                    'BRS_2021_HR_input', 
                    'Game_Result', 
                    'Home_Runs');

SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2021_HR_LogisticRegressionModel');

=======
details
=======
predictor|coefficient|std_err |z_value |p_value
---------+-----------+--------+--------+--------
Intercept|  0.10887  | 0.19882| 0.54758| 0.58398
home_runs|  0.49642  | 0.13949| 3.55890| 0.00037


==============
regularization
==============
type| lambda
----+--------
none| 1.00000


===========
call_string
===========
logistic_reg('public.BRS_2021_HR_LogisticRegressionModel', 'BRS_2021_HR_input', '"game_result"', 'Home_Runs'
USING PARAMETERS optimizer='newton', epsilon=1e-06, max_iterations=100, regularization='none', lambda=1, alpha=0.5)

===============
Additional Info
===============
       Name       |Value
------------------+-----
 iteration_count  |  3
rejected_row_count|  0
accepted_row_count|1000

(1 row)