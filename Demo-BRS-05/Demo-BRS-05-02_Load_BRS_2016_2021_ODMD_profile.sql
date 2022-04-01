------------------------------------------------------------------
-- Load data into the profile table: BRS_2016_2021_ODMD_profile
------------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_ODMD_profile;

CREATE TABLE BRS_2016_2021_ODMD_profile (Column_Name varchar(50),
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

INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Game_Date', 870, 856, 98.39, 0, 0.0, '2016-04-05', '2021-10-03', 'N/A', 'N/A', 'N/A', '2016-05-18 (2)', '2021-10-03 (1)', 10, 10, 1, 'nnnn-nn-nn (870)', 'nnnn-nn-nn (870)', 1, 'date (870)', 'date (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Game_Month', 870, 8, 0.92, 0, 0.0, 'April', 'September', 'N/A', 'N/A', 'N/A', 'August (166)', 'October (6)', 3, 9, 6, 'aaaa (271)', 'aaaaaaa (6)', 2, 'alpha (732)', 'alpha_code (138)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Game_Day_of_Week', 870, 7, 0.8, 0, 0.0, 'Friday', 'Wednesday', 'N/A', 'N/A', 'N/A', 'Saturday (147)', 'Monday (79)', 6, 9, 4, 'aaaaaa (360)', 'aaaaaaaaa (132)', 1, 'alpha (870)', 'alpha (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Team', 870, 1, 0.11, 0, 0.0, 'Boston Red Sox', 'Boston Red Sox', 'N/A', 'N/A', 'N/A', 'Boston Red Sox (870)', 'Boston Red Sox (870)', 14, 14, 1, 'aaaaaabaaabaaa (870)', 'aaaaaabaaabaaa (870)', 1, 'alpha alpha_code alpha_code (870)', 'alpha alpha_code alpha_code (870)', 'Categorical', False, False, True);
INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Opponent', 870, 29, 3.33, 0, 0.0, 'Arizona Diamondbacks', 'Washington Nationals', 'N/A', 'N/A', 'N/A', 'Toronto Blue Jays (105)', 'Cincinnati Reds (3)', 12, 29, 25, 'aaaaaaaaabaaaaaaa (108)', 'aaaaaaaaaabaaaa (3)', 7, 'alpha alpha (391)', 'period_terminated_alpha alpha alpha (4)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Opponent_Division', 870, 6, 0.69, 0, 0.0, 'American League (AL) Central', 'National League (NL) West', 'N/A', 'N/A', 'N/A', 'American League (AL) East (420)', 'National League (NL) Central (16)', 25, 28, 2, 'aaaaaaaabaaaaaab(aa)baaaa (689)', 'aaaaaaaabaaaaaab(aa)baaaaaaa (181)', 1, 'alpha alpha parenthetical_alpha alpha (870)', 'alpha alpha parenthetical_alpha alpha (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_ODMD_profile VALUES('Game_Result', 870, 2, 0.23, 0, 0.0, 0, 1, 0.5678160919540229, 1.0, 0.49566457645564, '1 (494)', '0 (376)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Label', False, False, False);
