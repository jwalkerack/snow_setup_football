Project Overview
This repository contains the infrastructure setup for key elements in Snowflake, focusing on the foundational components required for data processing and transformation.

While the primary transformations occur in the DBT repository, this code is responsible for configuring the necessary databases, tables, roles, tasks, and other infrastructure components.

Key Components
The setup consists of two main aspects:

Data Pipeline Setup

Establishes the ingestion pipeline from Amazon S3 into Snowflake.
Transformation Process

The transformation logic is managed within DBT, leveraging the ingested data.
Environments
This repository currently contains development code, but the logic remains the same for production, with only the environment references differing.

Development (DEV)
Source Data: S3/DATA_DEV/
Raw Layer: RAW_FOOTBALL.BBC_DEV
Transformed Data: DEV_FOOTBALL.DEV_FOOTBALL
Production (PRD)
Source Data: S3/DATA/
Raw Layer: RAW_FOOTBALL.BBC_PRD
Transformed Data: PRD_FOOTBALL.PRD_FOOTBALL
Directory Structure
/queries → Contains SQL queries for data validation after the DBT transformation process.
/func → Infrastructure setup scripts for configuring Snowflake components.

Notes
The development and production codebases are identical, except for environment references (DEV vs. PRD).
The data pipeline ensures ingestion from S3 into Snowflake, and DBT takes care of transformation logic.
