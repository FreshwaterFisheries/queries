/****** Script for SelectTopNRows command from SSMS  ******/
USE [SMALL_LAKES-TEST]
GO

--tables from load lakes
DELETE FROM ffsbc.waterbody_access
DELETE FROM ffsbc.waterbody_dimensions
DELETE FROM ffsbc.waterbody_region
DELETE FROM ffsbc.historical_BEC
DELETE FROM ffsbc.historical_FDIS
DELETE FROM ffsbc.fish_collection_count
DELETE FROM ffsbc.individual_fish
DELETE FROM ffsbc.fish_collection
DELETE FROM ffsbc.waterbody_profile_measurement
DELETE FROM ffsbc.historical_catch_summary
DELETE FROM ffsbc.waterbody_profile
DELETE FROM ffsbc.creel_archived
DELETE FROM ffsbc.creel_fish_count
DELETE FROM ffsbc.creel_survey
DELETE FROM ffsbc.fishing_effort
DELETE FROM ffsbc.project_assessment
DELETE FROM ffsbc.assessment
DELETE FROM ffsbc.waterbody

DBCC CHECKIDENT ('ffsbc.waterbody_access', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.waterbody_dimensions', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.waterbody_region', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.historical_BEC', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.historical_FDIS', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.fish_collection_count', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.fish_collection', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.historical_catch_summary', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.creel_archived', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.creel_fish_count', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.creel_survey', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.individual_fish', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.fishing_effort', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.project_assessment', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.assessment', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.waterbody', RESEED, 0)  
DBCC CHECKIDENT ('ffsbc.waterbody_profile', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.waterbody_profile_measurement', RESEED, 0) 
DBCC CHECKIDENT ('ffsbc.historical_catch_summary', RESEED, 0) 
