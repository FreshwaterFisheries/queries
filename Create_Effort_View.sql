USE [SMALL_LAKES-TEST]
GO
/****** Object:  UserDefinedFunction [db_datawriter].[Create_Effort_View]    Script Date: 9/28/2017 2:35:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [db_datawriter].[Create_Effort_View]()
--(	
	-- Add the parameters for the function here
	--<@param1, sysname, @p1> <Data_Type_For_Param1, , int>, 
	--<@param2, sysname, @p2> <Data_Type_For_Param2, , char>
--)
RETURNS TABLE 
AS
RETURN 
(
SELECT [fishing_effort_id] AS Effort_ID
      ,W.MOF_waterbody_id AS WBID
      ,[camera_or_lake_location] AS Name
      ,CAST(I.date AS Date) AS Date
      ,CAST(I.time AS Time(0)) AS Time
      ,L1.method_code AS Method
      ,L2.weather AS Weather
      ,L3.lake_condition AS Lake_Condition
      ,[boats_1angler] AS Boats_1Anglers
      ,[boats_2anglers] AS Boats_2Anglers
      ,[boats_3anglers] AS Boats_3Anglers
      ,[boats_4anglers] AS Boats_4Anglers
      ,[boats_5anglers] AS Boats_5Anglers
      ,[boats_unknown] AS Boats_Unknown
      ,[boats_not_fishing] AS Boats_NOT_Fishing
      ,[shore_ice_anglers] AS Shore_Ice_Anglers
      ,[shore_ice_not_fishing] AS Shore_Ice_NOT_Fishing
      ,[shore_ice_unknown] AS Shore_Ice_Unknown
      ,[ice_fishing_tents_1angler] AS Ice_Fishing_Tents_1Angler
      ,[ice_fishing_tents_2anglers] AS Ice_Fishing_Tents_2Anglers
      ,[ice_fishing_tents_unknown] AS Ice_Fishing_Tents_Unknown
      ,L5.image_quality AS Image_Quality
      ,L4.camera_type AS Camera_Type
      ,[percent_visibility] AS Percent_Visibility
      ,[portion_of_lake_seen] AS Portion_of_Lake_Seen
      ,[picture_name] AS Picture_Name
      ,[folder_name] AS Folder_Name
      ,[sampler] AS Sampler
      ,[page_ID] AS Page_ID
      ,[time_arrive] AS Time_Arrive
      ,[time_leave] AS Time_Leave
      ,I.[date_added] AS Date_Added
      ,I.[comments] AS Comments
  FROM [SMALL_LAKES-TEST].[ffsbc].[fishing_effort] I
  
  LEFT OUTER JOIN ffsbc.lookup_method L1
  ON L1.lookup_method_id = I.lookup_method_id
  
  LEFT OUTER JOIN ffsbc.lookup_weather L2
  ON L2.lookup_weather_id = I.lookup_weather_id
  
  LEFT OUTER JOIN ffsbc.lookup_lake_condition L3
  ON L3.lookup_lake_condition_id = I.lookup_lake_condition_id
  
  LEFT OUTER JOIN ffsbc.lookup_camera_type L4
  ON L4.lookup_camera_type_id = I.lookup_camera_type_id
  
  LEFT OUTER JOIN ffsbc.lookup_image_quality L5
  ON L5.lookup_image_quality_id = I.lookup_image_quality_id
  
  LEFT OUTER JOIN ffsbc.assessment A
		JOIN ffsbc.waterbody W
		ON A.waterbody_id = W.waterbody_id
		
  ON A.assessment_id = I.assessment_id
  
)
