-------------------------------------------------------
-- Classification using Support Vector Machine (SVM) 
-------------------------------------------------------

DROP MODEL IF EXISTS BRS_2021_SupportVectorMachineModel;

SELECT SVM_CLASSIFIER ('BRS_2021_SupportVectorMachineModel', 
                       'BRS_2021_predictor', 
                       'Game_Result', 
                       'Predictor_Value');


SELECT GET_MODEL_SUMMARY(USING PARAMETERS model_name='BRS_2021_SupportVectorMachineModel');


=======
details
=======
   predictor   |coefficient
---------------+-----------
   Intercept   | -1.20548
predictor_value|  0.34063


===========
call_string
===========
SELECT svm_classifier('public.BRS_2021_SupportVectorMachineModel', 'BRS_2021_predictor', '"game_result"', 'Predictor_Value'
USING PARAMETERS class_weights='none', C=1, max_iterations=100, intercept_mode='regularized', intercept_scaling=1, epsilon=0.001);

===============
Additional Info
===============
       Name       |Value
------------------+-----
accepted_row_count| 81
rejected_row_count|  0
 iteration_count  |  6

(1 row)