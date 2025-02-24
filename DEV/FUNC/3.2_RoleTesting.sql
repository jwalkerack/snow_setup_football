


USE ROLE DBT_DEV_ROLE;

USE WAREHOUSE FOOTBALL_DEV_DBT_WH;

SELECT * FROM RAW_FOOTBALL.BBC_DEV.FOOTBALL_DATA_JSON LIMIT 5

---- Check and Test PRD_FOOTBALL


USE SCHEMA DEV_FOOTBALL.DEV_FOOTBALL; -- Switch to the correct schema

CREATE OR REPLACE TABLE TEST_GRANTS (
    ID INT AUTOINCREMENT PRIMARY KEY,
    STATUS STRING
);

INSERT INTO TEST_GRANTS (STATUS)
VALUES ('INPROGRESS'), ('INPROGRESS'), ('INPROGRESS');

SELECT * FROM TEST_GRANTS;


SHOW GRANTS ON TABLE DEV_FOOTBALL.DEV_FOOTBALL.TEST_GRANTS;

SHOW GRANTS ON SCHEMA DEV_FOOTBALL.STG_MATCH

SHOW GRANTS ON VIEW DEV_FOOTBALL.STG_MATCH;