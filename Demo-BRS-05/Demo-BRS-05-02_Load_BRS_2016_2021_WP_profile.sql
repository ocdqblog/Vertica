------------------------------------------------------------------
-- Load data into the profile table: BRS_2016_2021_WP_profile
------------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_WP_profile;

CREATE TABLE BRS_2016_2021_WP_profile (Column_Name varchar(50),
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
                                       most_common_value varchar(100),
                                       least_common_value varchar(100),
                                       min_length int,
                                       max_length int,
                                       format_count int,
                                       most_common_format varchar(100),
                                       least_common_format varchar(100),
                                       pattern_count int,
                                       most_common_pattern varchar(100),
                                       least_common_pattern varchar(100),
                                       ML_datatype varchar(15),
                                       is_null boolean,
                                       is_unique boolean,
                                       is_constant boolean);

INSERT INTO BRS_2016_2021_WP_profile VALUES('Game_Date', 870, 856, 98.39, 0, 0.0, '2016-04-05', '2021-10-03', 'N/A', 'N/A', 'N/A', '2016-05-18 (2)', '2021-10-03 (1)', 10, 10, 1, 'nnnn-nn-nn (870)', 'nnnn-nn-nn (870)', 1, 'date (870)', 'date (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Game_Month', 870, 8, 0.92, 0, 0.0, 'April', 'September', 'N/A', 'N/A', 'N/A', 'August (166)', 'October (6)', 3, 9, 6, 'aaaa (271)', 'aaaaaaa (6)', 2, 'alpha (732)', 'alpha_code (138)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Game_Day_of_Week', 870, 7, 0.8, 0, 0.0, 'Friday', 'Wednesday', 'N/A', 'N/A', 'N/A', 'Saturday (147)', 'Monday (79)', 6, 9, 4, 'aaaaaa (360)', 'aaaaaaaaa (132)', 1, 'alpha (870)', 'alpha (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Team', 870, 1, 0.11, 0, 0.0, 'Boston Red Sox', 'Boston Red Sox', 'N/A', 'N/A', 'N/A', 'Boston Red Sox (870)', 'Boston Red Sox (870)', 14, 14, 1, 'aaaaaabaaabaaa (870)', 'aaaaaabaaabaaa (870)', 1, 'alpha alpha_code alpha_code (870)', 'alpha alpha_code alpha_code (870)', 'Categorical', False, False, True);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Opponent', 870, 29, 3.33, 0, 0.0, 'Arizona Diamondbacks', 'Washington Nationals', 'N/A', 'N/A', 'N/A', 'Toronto Blue Jays (105)', 'Cincinnati Reds (3)', 12, 29, 25, 'aaaaaaaaabaaaaaaa (108)', 'aaaaaaaaaabaaaa (3)', 7, 'alpha alpha (391)', 'period_terminated_alpha alpha alpha (4)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Opponent_Division', 870, 6, 0.69, 0, 0.0, 'American League (AL) Central', 'National League (NL) West', 'N/A', 'N/A', 'N/A', 'American League (AL) East (420)', 'National League (NL) Central (16)', 25, 28, 2, 'aaaaaaaabaaaaaab(aa)baaaa (689)', 'aaaaaaaabaaaaaab(aa)baaaaaaa (181)', 1, 'alpha alpha parenthetical_alpha alpha (870)', 'alpha alpha parenthetical_alpha alpha (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Game_Result', 870, 2, 0.23, 0, 0.0, 0, 1, 0.5678160919540229, 1.0, 0.49566457645564, '1 (494)', '0 (376)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Label', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Runs_Scored', 870, 20, 2.3, 0, 0.0, 0, 20, 5.242528735632184, 5.0, 3.4620790425179013, '5 (116)', '20 (1)', 1, 2, 2, 'n (774)', 'nn (96)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Runs_Scored_Metric', 870, 5, 0.57, 0, 0.0, 'Runs_Scored <= 1', 'Runs_Scored >= 10', 'N/A', 'N/A', 'N/A', 'Runs_Scored > 5 but <= 9 (256)', 'Runs_Scored >= 10 (96)', 16, 24, 4, 'aaaa_aaaaaab=bnbaabn (405)', 'aaaa_aaaaaab>=bnn (96)', 3, 'mixed_alpha_special unknown integer alpha_code integer (405)', 'mixed_alpha_special unknown integer (209)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Hits', 870, 24, 2.76, 0, 0.0, 0, 23, 9.319540229885057, 9.0, 3.6303870041464816, '9 (114)', '23 (1)', 1, 2, 2, 'n (491)', 'nn (379)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Hits_Metric', 870, 3, 0.34, 0, 0.0, 'Hits <= 3', 'Hits >= 10', 'N/A', 'N/A', 'N/A', 'Hits > 3 but <= 9 (467)', 'Hits <= 3 (24)', 9, 17, 3, 'aaaab>bnbaaab<=bn (467)', 'aaaab<=bn (24)', 2, 'alpha special integer alpha_code unknown integer (467)', 'alpha unknown integer (403)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Doubles', 870, 11, 1.26, 0, 0.0, 0, 10, 2.060919540229885, 2.0, 1.631032227457674, '1 (229)', '10 (1)', 1, 2, 2, 'n (869)', 'nn (1)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Triples', 870, 3, 0.34, 0, 0.0, 0, 2, 0.15172413793103448, 0.0, 0.4041960777482787, '0 (753)', '2 (15)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Home_Runs', 870, 7, 0.8, 0, 0.0, 0, 6, 1.2977011494252872, 1.0, 1.1906305696534858, '1 (314)', '6 (5)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Home_Runs_Metric', 870, 3, 0.34, 0, 0.0, 'Home_Runs = 0', 'Home_Runs > 1', 'N/A', 'N/A', 'N/A', 'Home_Runs = 1 (314)', 'Home_Runs = 0 (244)', 13, 13, 2, 'aaaa_aaaab=bn (558)', 'aaaa_aaaab>bn (312)', 2, 'mixed_alpha_special unknown integer (558)', 'mixed_alpha_special special integer (312)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Extra_Base_Hits', 870, 15, 1.72, 0, 0.0, 0, 14, 3.510344827586207, 3.0, 2.152261340963582, '3 (176)', '12 (1)', 1, 2, 2, 'n (858)', 'nn (12)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Extra_Base_Hits_Metric', 870, 3, 0.34, 0, 0.0, 'Extra_Base_Hits = 0', 'Extra_Base_Hits > 5', 'N/A', 'N/A', 'N/A', 'Extra_Base_Hits > 0 but <= 5 (700)', 'Extra_Base_Hits = 0 (32)', 19, 28, 3, 'aaaaa_aaaa_aaaab>bnbaaab<=bn (700)', 'aaaaa_aaaa_aaaab=bn (32)', 3, 'mixed_alpha_special special integer alpha_code unknown integer (700)', 'mixed_alpha_special unknown integer (32)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Walks', 870, 14, 1.61, 0, 0.0, 0, 14, 3.433333333333333, 3.0, 2.073348146231451, '3 (178)', '11 (1)', 1, 2, 2, 'n (862)', 'nn (8)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Strikeouts', 870, 17, 1.95, 0, 0.0, 1, 17, 7.988505747126437, 8.0, 2.8385568744392073, '7 (123)', '16 (1)', 1, 2, 2, 'n (601)', 'nn (269)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Walks_Minus_Strikeouts', 870, 30, 3.45, 0, 0.0, -15, 14, -3.796551724137931, -4.0, 4.398319280312401, '-6 (97)', '7 (1)', 1, 3, 4, '-n (670)', 'nn (15)', 2, 'mixed_numeric_special (726)', 'integer (144)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_WP_profile VALUES('Walks_Minus_Strikeouts_Metric', 870, 3, 0.34, 0, 0.0, 'Strikeouts > Walks', 'Walks > Strikeouts', 'N/A', 'N/A', 'N/A', 'Strikeouts > Walks (726)', 'Walks = Strikeouts (38)', 18, 18, 3, 'aaaaaaaaaab>baaaaa (726)', 'aaaaab=baaaaaaaaaa (38)', 2, 'alpha special alpha (832)', 'alpha unknown alpha (38)', 'Categorical', False, False, False);
