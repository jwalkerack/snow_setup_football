Purposes of the Code here is used to set up SNOWFLAKE
Creating the Databases and tables that used to hold data sourced via the S3 Pipe
Creating Roles and granting permission required for a DBT role
Setting up Databases and Schemas for DBT Transformation Process
In the Model there is One Source Database RAW_FOOTBALL , it will hold a BBC_DEV , BBC_PRD schemas
This schemas will be used to create Dev and Production Pipelines. The S3 bucket holds , test
Location for DEV and Prod location for Prod
At the moment the code is SET up for DEV. Setting the PRD version would require manual adjustment of names
To refect PRD as opposed to DEV
The Query Folder , holds some queries that relate to after DBT process has run. Use for santity checking

