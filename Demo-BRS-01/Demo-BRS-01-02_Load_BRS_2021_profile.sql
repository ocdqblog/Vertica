--------------------------------------------------------
-- Load data into the profile table: BRS_2021_profile 
--------------------------------------------------------

DROP TABLE IF EXISTS BRS_2021_profile;

CREATE TABLE BRS_2021_profile (Column_Name varchar(25), 
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

INSERT INTO BRS_2021_profile VALUES('Game_Date', 81, 79, 97.53, 0, 0.0, '04-02-2021', '06-30-2021', 'N/A', 'N/A', 'N/A', '04-14-2021 (2)', '06-30-2021 (1)', 10, 10, 1, 'nn-nn-nnnn (81)', 'nn-nn-nnnn (81)', 1, 'date (81)', 'date (81)', 'Categorical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Game_Result', 81, 2, 2.47, 0, 0.0, 0, 1, 0.6172839506172839, 1, 0.4890782461571947, '1 (50)', '0 (31)', 1, 1, 1, 'n (81)', 'n (81)', 1, 'integer (81)', 'integer (81)', 'Label', False, False, False);
INSERT INTO BRS_2021_profile VALUES('At_Bats', 81, 19, 23.46, 0, 0.0, 21, 44, 33.76543209876543, 33, 4.325134694255983, '32 (12)', '37 (1)', 2, 2, 1, 'nn (81)', 'nn (81)', 1, 'integer (81)', 'integer (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Runs_Scored', 81, 14, 17.28, 0, 0.0, 0, 14, 5.061728395061729, 5, 3.3553899885570146, '2 (10)', '14 (1)', 1, 2, 2, 'n (71)', 'nn (10)', 1, 'integer (81)', 'integer (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Hits', 81, 15, 18.52, 0, 0.0, 2, 17, 8.765432098765432, 8, 3.668349782048706, '4 (9)', '3 (1)', 1, 2, 2, 'n (49)', 'nn (32)', 1, 'integer (81)', 'integer (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Runs_Batted_In', 81, 14, 17.28, 0, 0.0, 0, 13, 4.753086419753086, 4, 3.1206203878296814, '2 (12)', '12 (1)', 1, 2, 2, 'n (72)', 'nn (9)', 1, 'integer (81)', 'integer (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Walks', 81, 8, 9.88, 0, 0.0, 0, 7, 2.7777777777777777, 3, 1.6583123951777, '3 (24)', '7 (3)', 1, 1, 1, 'n (81)', 'n (81)', 1, 'integer (81)', 'integer (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Strikeouts', 81, 14, 17.28, 0, 0.0, 3, 17, 8.728395061728396, 8, 2.9538633417907656, '11 (14)', '13 (1)', 1, 2, 2, 'n (46)', 'nn (35)', 1, 'integer (81)', 'integer (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Batting_Average', 81, 58, 71.6, 0, 0.0, 0.069, 0.444, 0.2537283950617284, 0.242, 0.086980315638896, '.133 (5)', '.400 (1)', 4, 4, 1, '.nnn (81)', '.nnn (81)', 1, 'float (81)', 'float (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('On_Base_Percentage', 81, 59, 72.84, 0, 0.0, 0.129, 0.5, 0.3144814814814815, 0.316, 0.08493925934323761, '.333 (5)', '.314 (1)', 4, 4, 1, '.nnn (81)', '.nnn (81)', 1, 'float (81)', 'float (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('Slugging_Percentage', 81, 66, 81.48, 0, 0.0, 0.103, 0.841, 0.43048148148148146, 0.438, 0.16618446912325405, '.500 (5)', '.433 (1)', 4, 4, 1, '.nnn (81)', '.nnn (81)', 1, 'float (81)', 'float (81)', 'Numerical', False, False, False);
INSERT INTO BRS_2021_profile VALUES('OnBase_Plus_Slugging', 81, 80, 98.77, 0, 0.0, 0.232, 1.301, 0.7449876543209877, 0.759, 0.23658743065868695, '.747 (2)', '.814 (1)', 4, 5, 2, '.nnn (69)', 'n.nnn (12)', 1, 'float (81)', 'float (81)', 'Numerical', False, False, False);
