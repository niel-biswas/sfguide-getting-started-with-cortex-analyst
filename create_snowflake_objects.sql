USE ROLE sysadmin;

/*--
• database, schema, warehouse and stage creation
--*/

-- create demo database
CREATE OR REPLACE DATABASE cortex_analyst_demo;

-- create schema
CREATE OR REPLACE SCHEMA revenue_timeseries;

-- create warehouse
CREATE OR REPLACE WAREHOUSE cortex_analyst_wh
    WAREHOUSE_SIZE = 'large'
    WAREHOUSE_TYPE = 'standard'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
COMMENT = 'warehouse for cortex analyst demo';


USE WAREHOUSE cortex_analyst_wh;

CREATE STAGE raw_data DIRECTORY = (ENABLE = TRUE);

/*--
• table creation
--*/
CREATE OR REPLACE TABLE CORTEX_ANALYST_DEMO.REVENUE_TIMESERIES.DAILY_REVENUE (
	DATE DATE,
	REVENUE FLOAT,
	COGS FLOAT,
	FORECASTED_REVENUE FLOAT
);

CREATE OR REPLACE TABLE CORTEX_ANALYST_DEMO.REVENUE_TIMESERIES.DAILY_REVENUE_BY_PRODUCT (
	DATE DATE,
	PRODUCT_LINE VARCHAR(16777216),
	REVENUE FLOAT,
	COGS FLOAT,
	FORECASTED_REVENUE FLOAT
);

CREATE OR REPLACE TABLE CORTEX_ANALYST_DEMO.REVENUE_TIMESERIES.DAILY_REVENUE_BY_REGION (
	DATE DATE,
	SALES_REGION VARCHAR(16777216),
	REVENUE FLOAT,
	COGS FLOAT,
	FORECASTED_REVENUE FLOAT
);
