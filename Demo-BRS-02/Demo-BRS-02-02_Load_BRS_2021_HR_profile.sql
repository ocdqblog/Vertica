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

INSERT INTO BRS_2021_HR_profile VALUES('Game_Date', 820, 79, 9.63, 0, 0.0, '2021-04-02', '2021-06-30', 'N/A', 'N/A', 'N/A', '2021-04-14 (20)', '2021-06-30 (9)', 10, 10, 1, 'nnnn-nn-nn (820)', 'nnnn-nn-nn (820)', 1, 'date (820)', 'date (820)', 'Categorical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Game_Result', 820, 2, 0.24, 0, 0.0, 0, 1, 0.624390243902439, 1.0, 0.48457551017083755, '1 (512)', '0 (308)', 1, 1, 1, 'n (820)', 'n (820)', 1, 'integer (820)', 'integer (820)', 'Label', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('At_Bats', 820, 7, 0.85, 0, 0.0, 0, 6, 3.3402439024390245, 4.0, 1.2990425473981075, '4 (333)', '6 (8)', 1, 1, 1, 'n (820)', 'n (820)', 1, 'integer (820)', 'integer (820)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Runs_Scored', 820, 5, 0.61, 0, 0.0, 0, 4, 0.5, 0.0, 0.6962309133739213, '0 (498)', '4 (1)', 1, 1, 1, 'n (820)', 'n (820)', 1, 'integer (820)', 'integer (820)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Hits', 820, 5, 0.61, 0, 0.0, 0, 4, 0.8695121951219512, 1.0, 0.8888385397753898, '0 (337)', '4 (4)', 1, 1, 1, 'n (820)', 'n (820)', 1, 'integer (820)', 'integer (820)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Home_Runs', 820, 4, 0.49, 0, 0.0, 0, 3, 0.12560975609756098, 0.0, 0.35301283951432605, '0 (722)', '3 (1)', 1, 1, 1, 'n (820)', 'n (820)', 1, 'integer (820)', 'integer (820)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_HR_profile VALUES('Runs_Batted_In', 820, 6, 0.73, 0, 0.0, 0, 5, 0.4719512195121951, 0.0, 0.8518849874282284, '0 (571)', '5 (1)', 1, 1, 1, 'n (820)', 'n (820)', 1, 'integer (820)', 'integer (820)', 'Numerical', False, False, False);