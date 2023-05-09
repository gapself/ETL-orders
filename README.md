# Star schema - data warehouse

### ETL (Extract, Transform and Load) process

Star schema database is organized into a central fact table which includes measures of interest and is surrounded by dimension tables that describe the attributes of the measures.

## Loading data (SQL Server Integration Services 2008)
File: ETL_orders.sln<br>
1. Create database (StudentId) and necessary tables. Use staging tables (CustomerSt etc) to save informations from the data sources (salesstore.xls). Data is sent to individual tables asynchronously so that changes to individual staging tables can be made (e.g. repeated) independently without damaging the entire solution.

      ❗ Execute SQL task for every staging table after loading it into fact table (it takes also less space - anyway, later we load this historical data to data warehouse)<br>
      TRUNCATE removes all rows from a table, but the table structure and its columns, constraints, indexes, and so on remain (deletes the data inside a table, but not the table itself)
      ```
      truncate table TabelName;
      ```
      
      #### Control flow <br>
      <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/e9454ba3-14a2-423d-8569-063cae20365c" width="500">

      #### Data flow task <br> (use data conversions -> load into staging)
      <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/489e360c-1c07-46a8-8304-7a01af62dd12" width="500">

2. At this step, we transfer data from staging tables to the data warehouse (one process called initial load).

      <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/fcde9a54-b4cb-490c-a45c-8e106d6c5659" width="900">



## Loading dimension and fact tables to data warehouse (SQL Server Integration Services 2008)
File: multidimensional_cube_orders.sln <br>
1. Build cube

      <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/4394d9f4-afa6-4d8e-b2d8-6472797c9e6e" width="900">

2. Deploy

      <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/a346a8b1-5034-4603-b433-61fa08a8e54d" width="500">
