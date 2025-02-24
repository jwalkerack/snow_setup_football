The Purpose of the Code here to be used to set up the key elements in snowflake
The main transformation is being preformed in the DBT repo

Contain here are the aspects that relate to the infrasture that needs to be set up in relation to databases , tables , roles , task ETC

There are two main aspects to this 
Firstly setting up the data pipeline from S3 into Snowfkale
Secondly setting up Transformation Process Driven by DBT

This code Currently has the Development code. But in reality this is the same code for Production. With PRD being referenced instead of DEV

DEV : S3/DATA_DEV/ -- Would be stored in RAW_FOOTBALL.BBC_DEV and transformed data stored in DEV_FOOTBALL.DEV_FOOTBALL
PRD : S3/DATA/ -- Would be stored in RAW_FOOTBALL.BBC_PRD and transformed data stored in PRD_FOOTBALL.PRD_FOOTBALL

The Query folder contains queries used for checks on the data after the DBT process has finshed
