USE [SMALL_LAKES-TEST]
GO
/****** Object:  UserDefinedFunction [db_datawriter].[Create_Creel_View]    Script Date: 9/28/2017 10:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [db_datawriter].[Create_Creel_View]()
--(	
	-- Add the parameters for the function here
	--<@param1, sysname, @p1> <Data_Type_For_Param1, , int>, 
	--<@param2, sysname, @p2> <Data_Type_For_Param2, , char>
--)
RETURNS TABLE 
AS
RETURN 
(
SELECT [creel_survey_id] As Creel_Survey_ID
      ,A.assessment_key As Assessment_Key
      ,W.gazetted_name As Gazetted_Name
      ,L1.method_code As Method
      ,[LL_id] As Large_Lakes_ID
      ,CAST([date_of_interview] AS datetime) AS Date_Of_Interview
      ,CAST([time_of_interview] AS datetime) AS Time_Of_Interview
      ,[launch_or_fishing_location] AS Launch_Or_Fishing_Location
      ,[boat_shore] AS Boat_Shore
      ,[party_no] AS Party_No
      ,[person_no] AS Person_No
      ,[no_anglers] AS No_Anglers
      ,[no_rods] AS No_Rods
      ,SP1.species_code AS Target_Species_1
      ,[hours_fished] AS Hours_Fished
      ,SP2.species_code AS Target_Species_2
      ,[hours_fished_2] AS Hours_Fished_2
      ,[no_expected_to_catch] AS No_Expected_to_Catch
      ,[no_expected_to_keep] AS No_Expected_to_Keep
      ,[length_weight_measured] AS Length_Weight_Measured
      ,[fishing_experience_today] AS Fishing_Experience_Today
      ,[days_freshwater_BC_current_year] AS Days_FW_BC_Current_Year
      ,[years_freshwater_fishing_BC] AS Years_FW_Fishing_BC
      ,[days_freshwater_BC_prev_two_years] AS Days_FW_BC_Prev_Two_Years
      ,[days_ice_BC_prev_two_years] AS Days_Ice_BC_Prev_Two_Years
      ,[no_of_licences_purchased_in_last_5_years] AS No_of_licenses_purchased_in_last_5_years
      ,[previous_survey_this_year] AS Previous_Survey_this_Year
      ,LT.licence_type AS Type_Of_Licence
      ,AG.age_group AS Age_Group 
      ,[age] AS Age
      ,[gender] AS Gender
      ,[hometown_postal_code_first_3_digits] AS Hometown_Postal_Code_First_3_digits
      ,[mother_country] AS Mother_Country
      ,[phone_number_last_4_digits] AS Phone_number_last_4_digits
      ,[time_travelled_to_lake] AS Time_Travelled_to_Lake
      ,[aware_of_stocking] AS Aware_of_stocking
      ,[terminal_gear_type] AS Terminal_Gear_Type
      ,[interviewer] AS Interviewer
      ,[DNA] AS DNA_ID
      ,[days_freshwater_ice_salt_last_2_years] AS Days_Freshwater_Ice_Salt_Last_Two_Years
      ,[percent_days_fished_KO] AS Percent_Days_Fished_KO
      ,[boat_type] AS Boat_Type
      ,[percent_increase_in_fishing_days_past_2_years] AS Percent_Increase_in_fishing_days_past_2_years
      ,[how_many_days_were_overnight_fishing_trips_in_2_years] AS How_many_days_were_overnight_fishing_trips_in_2_years
      ,[where_staying_tonight] AS Where_staying_tonight
      ,[how_many_days_in_current_trip] AS How_many_days_in_current_trip
      ,[how_many_days_of_trip_will_you_fish_this_lake_or_other_lakes] AS How_many_days_of_trip_will_you_fish_this_lake_or_other_lakes
      ,[prefer_to_catch_lots_small_1_or_few_large_7] AS Prefer_to_catch_lots_small_1_or_few_large_7
      ,[cost_gas_for_this_trip] AS Cost_Gas_for_this_trip
      ,[cost_lodging_for_this_trip] AS Cost_Lodging_for_this_trip
      ,[cost_food_for_this_trip] AS Cost_Food_for_this_trip
      ,[spend_annually_on_tackle_rods_or_reels] AS Spend_annually_on_tackle_rods_or_reels
      ,[spend_annually_on_boats_motors_or_equipment] AS Spend_annually_on_boats_motors_or_equipment
      ,[motivation_method] AS Motivation_Method
      ,[motivation_to_catch_fish_for_eating] AS Motivation_To_Catch_Fish_for_Eating
      ,[motivation_to_catch_large_fish] AS Motivation_To_Catch_Large_Fish
      ,[motivation_to_catch_many_fish] AS Motivation_To_Catch_Many_Fish
      ,[motivation_challenge] AS Motivation_Challenge
      ,[motivation_to_get_away] AS Motivation_To_Get_Away
      ,[motivation_relaxation] AS Motivation_Relaxation
      ,[motivation_family_closer_together] AS Motivation_Family_Closer_Together
      ,[motivation_companionship] AS Motivation_Companionship
      ,[motivation_improve_skills] AS Motivation_Improve_Skills
      ,[motivation_close_to_nature] AS Motivation_Close_to_Nature
      ,[top_waterbodies_waterbody_1] AS Top_Waterbodies_Waterbody_1
      ,[top_waterbodies_rank_1] AS Top_Waterbodies_Rank_1
      ,[top_waterbodies_waterbody_2] AS Top_Waterbodies_Waterbody_2 
      ,[top_waterbodies_rank_2] AS Top_Waterbodies_Rank_2
      ,[top_waterbodies_waterbody_3] AS Top_Waterbodies_Waterbody_3
      ,[top_waterbodies_rank_3] AS Top_Waterbodies_Rank_3
      ,I.[date_added] AS Date_Added
      ,I.[comments] AS Comments
  FROM [SMALL_LAKES-TEST].[ffsbc].[creel_survey] I
  
  LEFT OUTER JOIN ffsbc.species SP1
  ON SP1.species_id = I.lookup_target_species_id
  
  LEFT OUTER JOIN ffsbc.species SP2
  ON SP2.species_id = I.lookup_target_species_id

  LEFT OUTER JOIN ffsbc.lookup_age_group AG
  ON AG.lookup_age_group_id = I.lookup_age_group_id

  LEFT OUTER JOIN ffsbc.lookup_licence_type LT
  ON LT.lookup_licence_type_id = I.lookup_licence_type_id

  LEFT OUTER JOIN ffsbc.lookup_method L1
  ON L1.lookup_method_id = I.lookup_method_id
  
  LEFT OUTER JOIN ffsbc.assessment A
		JOIN ffsbc.waterbody W
		ON A.waterbody_id = W.waterbody_id
  ON A.assessment_id = I.assessment_id
)
