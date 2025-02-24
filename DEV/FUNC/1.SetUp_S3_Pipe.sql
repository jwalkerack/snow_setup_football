-- Set the database and schema
-- Set the database and schema
USE DATABASE RAW_FOOTBALL;
USE SCHEMA BBC_DEV;

CREATE OR REPLACE STAGE BBC_DEV.TT
  URL = 's3://datapulledraw/DB_DATA_DEV/'
  STORAGE_INTEGRATION = AMAZON_SNOW_CONNECTION;




-- Step 1: Create File Format for JSON data
CREATE OR REPLACE FILE FORMAT json_format
  TYPE = 'JSON';

-- Step 2: Create Tables
CREATE OR REPLACE TABLE processed_files (
    filename STRING PRIMARY KEY,
    processed_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE TABLE football_data_json (
    games_Json VARIANT,
    uploaded_date TIMESTAMP,
    json_data_file_name STRING
);

-- Step 3: Create Procedure to Load Data
CREATE OR REPLACE PROCEDURE load_data_from_s3()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    -- Step 1: Load data from new files that haven't been processed yet
    INSERT INTO football_data_json (games_Json, uploaded_date, json_data_file_name)
    SELECT
        $1 AS games_Json,
        CURRENT_TIMESTAMP AS uploaded_date,
        METADATA$FILENAME AS json_data_file_name
    FROM @TT (FILE_FORMAT => 'json_format')
    WHERE METADATA$FILENAME NOT IN (SELECT filename FROM processed_files);

    -- Step 2: After successfully loading data, mark those files as processed
    INSERT INTO processed_files (filename)
    SELECT DISTINCT METADATA$FILENAME
    FROM @TT (FILE_FORMAT => 'json_format')
    WHERE METADATA$FILENAME NOT IN (SELECT filename FROM processed_files);

    RETURN 'Data Loaded Successfully';
END;
$$;











