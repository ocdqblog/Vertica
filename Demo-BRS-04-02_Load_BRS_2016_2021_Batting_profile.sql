---------------------------------------------------------------------
-- Load data into the profile table: BRS_2016_2021_Batting_profile
---------------------------------------------------------------------

DROP TABLE IF EXISTS BRS_2016_2021_Batting_profile;

CREATE TABLE BRS_2016_2021_Batting_profile (Column_Name varchar(25),
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

INSERT INTO BRS_2016_2021_Batting_profile VALUES('Game_Date', 870, 856, 98.39, 0, 0.0, '2016-04-05', '2021-10-03', 'N/A', 'N/A', 'N/A', '2016-05-18 (2)', '2021-10-03 (1)', 10, 10, 1, 'nnnn-nn-nn (870)', 'nnnn-nn-nn (870)', 1, 'date (870)', 'date (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Team', 870, 1, 0.11, 0, 0.0, 'BOS', 'BOS', 'N/A', 'N/A', 'N/A', 'BOS (870)', 'BOS (870)', 3, 3, 1, 'aaa (870)', 'aaa (870)', 1, 'alpha_code (870)', 'alpha_code (870)', 'Categorical', False, False, True);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Opponent', 870, 29, 3.33, 0, 0.0, 'ARI', 'WSN', 'N/A', 'N/A', 'N/A', 'TOR (105)', 'CIN (3)', 3, 3, 1, 'aaa (870)', 'aaa (870)', 1, 'alpha_code (870)', 'alpha_code (870)', 'Categorical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Game_Result', 870, 2, 0.23, 0, 0.0, 0, 1, 0.5678160919540229, 1.0, 0.49566457645564, '1 (494)', '0 (376)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Label', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('At_Bats', 870, 35, 4.02, 0, 0.0, 21, 67, 34.839080459770116, 34.0, 4.5715726488526265, '34 (98)', '22 (1)', 2, 2, 1, 'nn (870)', 'nn (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Runs_Scored', 870, 20, 2.3, 0, 0.0, 0, 20, 5.242528735632184, 5.0, 3.4620790425179013, '5 (116)', '20 (1)', 1, 2, 2, 'n (774)', 'nn (96)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Hits', 870, 24, 2.76, 0, 0.0, 0, 23, 9.319540229885057, 9.0, 3.6303870041464816, '9 (114)', '23 (1)', 1, 2, 2, 'n (491)', 'nn (379)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Doubles', 870, 11, 1.26, 0, 0.0, 0, 10, 2.060919540229885, 2.0, 1.631032227457674, '1 (229)', '10 (1)', 1, 2, 2, 'n (869)', 'nn (1)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Triples', 870, 3, 0.34, 0, 0.0, 0, 2, 0.15172413793103448, 0.0, 0.4041960777482787, '0 (753)', '2 (15)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Home_Runs', 870, 7, 0.8, 0, 0.0, 0, 6, 1.2977011494252872, 1.0, 1.1906305696534858, '1 (314)', '6 (5)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Runs_Batted_In', 870, 20, 2.3, 0, 0.0, 0, 20, 4.963218390804598, 5.0, 3.3682370314805286, '5 (128)', '20 (1)', 1, 2, 2, 'n (787)', 'nn (83)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Walks', 870, 14, 1.61, 0, 0.0, 0, 14, 3.433333333333333, 3.0, 2.073348146231451, '3 (178)', '11 (1)', 1, 2, 2, 'n (862)', 'nn (8)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Strikeouts', 870, 17, 1.95, 0, 0.0, 1, 17, 7.988505747126437, 8.0, 2.8385568744392073, '7 (123)', '16 (1)', 1, 2, 2, 'n (601)', 'nn (269)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Hit_By_Pitch', 870, 4, 0.46, 0, 0.0, 0, 3, 0.32413793103448274, 0.0, 0.5842122187281343, '0 (638)', '3 (3)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Sacrifice_Hits', 870, 4, 0.46, 0, 0.0, 0, 3, 0.06666666666666667, 0.0, 0.26739448051272297, '0 (815)', '3 (1)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Sacrifice_Flies', 870, 4, 0.46, 0, 0.0, 0, 3, 0.2517241379310345, 0.0, 0.516552720664276, '0 (682)', '3 (3)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Reached_On_Error', 870, 5, 0.57, 0, 0.0, 0, 4, 0.36091954022988504, 0.0, 0.6017535407319576, '0 (605)', '4 (1)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Grounded_into_Double_Play', 870, 6, 0.69, 0, 0.0, 0, 5, 0.7885057471264367, 1.0, 0.8440443608993617, '0 (381)', '5 (1)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Stolen_Bases', 870, 7, 0.8, 0, 0.0, 0, 6, 0.5206896551724138, 0.0, 0.8827248757240136, '0 (570)', '6 (2)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Caught_Stealing', 870, 3, 0.34, 0, 0.0, 0, 2, 0.167816091954023, 0.0, 0.39487343469781433, '0 (731)', '2 (7)', 1, 1, 1, 'n (870)', 'n (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Runners_Left_On_Base', 870, 16, 1.84, 0, 0.0, 1, 17, 6.991954022988506, 7.0, 2.543735661209558, '6 (141)', '16 (1)', 1, 2, 2, 'n (718)', 'nn (152)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Number_of_Players_Used_in_Game', 870, 13, 1.49, 0, 0.0, 9, 21, 10.462068965517242, 10.0, 1.8008591083243024, '9 (320)', '19 (1)', 1, 2, 2, 'nn (550)', 'n (320)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Attendance_in_Tickets_Sold', 870, 782, 89.89, 61, 7.01, 1562, 59659, 30725.31149567367, 34533, 10460.446414114138, '33380 (2)', '33986 (1)', 4, 5, 2, 'nnnnn (761)', 'nnnn (48)', 2, 'zip_code (761)', 'integer (48)', 'Numerical', False, False, False);
INSERT INTO BRS_2016_2021_Batting_profile VALUES('Game_Length_in_Minutes', 870, 144, 16.55, 0, 0.0, 115, 365, 197.4977011494253, 195.0, 30.542307720229882, '205 (20)', '252 (1)', 3, 3, 1, 'nnn (870)', 'nnn (870)', 1, 'integer (870)', 'integer (870)', 'Numerical', False, False, False);
