-----------------------------------------------------------
-- Load data into the profile table: BRS_2021_HR_profile 
-----------------------------------------------------------

DROP TABLE IF EXISTS BRS_2021_HR_profile;

CREATE TABLE BRS_2021_HR_profile (Column_Name varchar(25), 
                                  value_count int,
                                  unique_count int,
                                  unique_percent float,
                                  null_count int,
                                  null_percent float,
                                  min_value varchar(50),
                                  max_value varchar(50),
                                  mean_value varchar(50),
                                  median_value varchar(50),
                                  stdev_value varchar(50),
                                  most_common_value varchar(50),
                                  least_common_value varchar(50),
                                  min_length int,
                                  max_length int,
                                  format_count int,
                                  most_common_format varchar(50),
                                  least_common_format varchar(50),
                                  pattern_count int,
                                  most_common_pattern varchar(50),
                                  least_common_pattern varchar(50),
                                  ML_datatype varchar(15),
                                  is_null boolean,
                                  is_unique boolean,
                                  is_constant boolean);

INSERT INTO BRS_2021_HR_profile VALUES('Game_Date', 1000, 153, 15.3, 0, 0.0, '2021-04-03', '2021-10-03', 'N/A', 'N/A', 'N/A', '2021-09-24 (41)', '2021-04-03 (1)', 10, 10, 1, 'nnnn-nn-nn (1000)', 'nnnn-nn-nn (1000)', 1, 'date (1000)', 'date (1000)', 'Categorical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Game_Result', 1000, 2, 0.2, 0, 0.0, 0, 1, 0.687, 1.0, 0.4639463829433809, '1 (687)', '0 (313)', 1, 1, 1, 'n (1000)', 'n (1000)', 1, 'integer (1000)', 'integer (1000)', 'Label', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('At_Bats', 1000, 6, 0.6, 0, 0.0, 1, 6, 3.915, 4.0, 0.9287828797074361, '4 (488)', '6 (19)', 1, 1, 1, 'n (1000)', 'n (1000)', 1, 'integer (1000)', 'integer (1000)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Runs_Scored', 1000, 5, 0.5, 0, 0.0, 1, 5, 1.674, 2.0, 0.7295589463890195, '1 (461)', '5 (2)', 1, 1, 1, 'n (1000)', 'n (1000)', 1, 'integer (1000)', 'integer (1000)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Hits', 1000, 5, 0.5, 0, 0.0, 1, 5, 1.927, 2.0, 0.8428412551491422, '2 (436)', '5 (5)', 1, 1, 1, 'n (1000)', 'n (1000)', 1, 'integer (1000)', 'integer (1000)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Home_Runs', 1000, 3, 0.3, 0, 0.0, 1, 3, 1.39, 1.0, 0.5159129443677162, '1 (624)', '3 (14)', 1, 1, 1, 'n (1000)', 'n (1000)', 1, 'integer (1000)', 'integer (1000)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Runs_Batted_In', 1000, 8, 0.8, 0, 0.0, 1, 8, 2.387, 2.0, 1.368613935375533, '1 (310)', '8 (2)', 1, 1, 1, 'n (1000)', 'n (1000)', 1, 'integer (1000)', 'integer (1000)', 'Numerical', False, False, False);
