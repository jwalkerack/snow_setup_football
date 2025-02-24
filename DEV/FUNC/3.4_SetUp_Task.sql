-- Set Up Task for automatic pull data

CREATE OR REPLACE TASK RAW_FOOTBALL.BBC_DEV.run_data_pipe
WAREHOUSE = COMPUTE_WH
SCHEDULE = 'USING CRON 29 14 * * * UTC'  -- Runs every day at 6 AM UTC
AS
CALL RAW_FOOTBALL.BBC_DEV.load_data_from_s3();

ALTER TASK RAW_FOOTBALL.BBC_DEV.run_data_pipe RESUME;