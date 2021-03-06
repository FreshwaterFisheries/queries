USE [SMALL_LAKES-TEST]
GO
/****** Object:  UserDefinedFunction [db_datawriter].[Create_Creel_Count_View]    Script Date: 9/28/2017 2:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [db_datawriter].[Create_Creel_Count_View]()
--(	
	-- Add the parameters for the function here
	--<@param1, sysname, @p1> <Data_Type_For_Param1, , int>, 
	--<@param2, sysname, @p2> <Data_Type_For_Param2, , char>
--)
RETURNS TABLE 
AS
RETURN 
(
	  SELECT [creel_fish_count_id] AS Creel_Count_ID
	  ,I.creel_survey_id AS Creel_Survey_ID
      ,A.assessment_key As Assessment_Key
      ,W.gazetted_name AS Gazetted_Name
      ,SP.species_code As Species
      ,[number_caught] As Number_Caught
      ,[number_kept] As Number_Kept
  FROM [SMALL_LAKES-TEST].[ffsbc].[creel_fish_count] I
  
  LEFT OUTER JOIN ffsbc.species SP
  ON SP.species_id = I.species_id
  
  LEFT OUTER JOIN ffsbc.creel_survey C
	JOIN ffsbc.assessment A
		JOIN ffsbc.waterbody W
		ON W.waterbody_id = A.waterbody_id
	ON A.assessment_id = C.assessment_id
  ON C.creel_survey_id = I.creel_survey_id
)
