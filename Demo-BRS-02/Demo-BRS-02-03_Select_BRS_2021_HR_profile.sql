----------------------------------------------
-- Contents of the BRS_2021_HR_profile table 
----------------------------------------------

SELECT * FROM BRS_2021_HR_profile; 

  Column_Name   | value_count | unique_count | unique_percent | null_count | null_percent | min_value  | max_value  | mean_value | median_value |    stdev_value     | most_common_value | least_common_value | min_length | max_length | format_count | most_common_format | least_common_format | pattern_count | most_common_pattern | least_common_pattern | ML_datatype | is_null | is_unique | is_constant
----------------+-------------+--------------+----------------+------------+--------------+------------+------------+------------+--------------+--------------------+-------------------+--------------------+------------+------------+--------------+--------------------+---------------------+---------------+---------------------+----------------------+-------------+---------+-----------+-------------
 Game_Date      |        1000 |          153 |           15.3 |          0 |            0 | 2021-04-03 | 2021-10-03 | N/A        | N/A          | N/A                | 2021-09-24 (41)   | 2021-04-03 (1)     |         10 |         10 |            1 | nnnn-nn-nn (1000)  | nnnn-nn-nn (1000)   |             1 | date (1000)         | date (1000)          | Categorical | f       | f         | f
 Game_Result    |        1000 |            2 |            0.2 |          0 |            0 | 0          | 1          | 0.687      | 1.0          | 0.4639463829433809 | 1 (687)           | 0 (313)            |          1 |          1 |            1 | n (1000)           | n (1000)            |             1 | integer (1000)      | integer (1000)       | Label       | f       | f         | f
 At_Bats        |        1000 |            6 |            0.6 |          0 |            0 | 1          | 6          | 3.915      | 4.0          | 0.9287828797074361 | 4 (488)           | 6 (19)             |          1 |          1 |            1 | n (1000)           | n (1000)            |             1 | integer (1000)      | integer (1000)       | Numerical   | f       | f         | f
 Runs_Scored    |        1000 |            5 |            0.5 |          0 |            0 | 1          | 5          | 1.674      | 2.0          | 0.7295589463890195 | 1 (461)           | 5 (2)              |          1 |          1 |            1 | n (1000)           | n (1000)            |             1 | integer (1000)      | integer (1000)       | Numerical   | f       | f         | f
 Hits           |        1000 |            5 |            0.5 |          0 |            0 | 1          | 5          | 1.927      | 2.0          | 0.8428412551491422 | 2 (436)           | 5 (5)              |          1 |          1 |            1 | n (1000)           | n (1000)            |             1 | integer (1000)      | integer (1000)       | Numerical   | f       | f         | f
 Home_Runs      |        1000 |            3 |            0.3 |          0 |            0 | 1          | 3          | 1.39       | 1.0          | 0.5159129443677162 | 1 (624)           | 3 (14)             |          1 |          1 |            1 | n (1000)           | n (1000)            |             1 | integer (1000)      | integer (1000)       | Numerical   | f       | f         | f
 Runs_Batted_In |        1000 |            8 |            0.8 |          0 |            0 | 1          | 8          | 2.387      | 2.0          | 1.368613935375533  | 1 (310)           | 8 (2)              |          1 |          1 |            1 | n (1000)           | n (1000)            |             1 | integer (1000)      | integer (1000)       | Numerical   | f       | f         | f

(7 rows)