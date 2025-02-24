--- Running the load data manually ..

-- Test Selects to review the S3 data pull into snowflake base tables

CALL load_data_from_s3();

USE ROLE ACCOUNTADMIN;
USE RAW_FOOTBALL.BBC_DEV;

SELECT * FROM football_data_json limit 5;

SELECT * FROM PROCESSED_FILES

TRUNCATE TABLE PROCESSED_FILES;

TRUNCATE TABLE football_data_json;

