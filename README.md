# Star schema - data warehouse for orders

### Environment:<br>
![Visual Studio](https://img.shields.io/badge/Visual%20Studio-5C2D91.svg?style=for-the-badge&logo=visual-studio&logoColor=white)
![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)

### ETL (Extract, Transform and Load) process

> Star schema database is organized into a central fact table which includes measures of interest and is surrounded by dimension tables that describe the attributes of the measures.

## 1. Transforming / extracting data (SSIS - SQL Server Integration Services 2008)
File: ETL_orders.sln<br>
> Create database (StudentId) and necessary tables (create_tables_orders.sql). Use staging tables (CustomerSt etc) to save informations from the data sources (salesstore.xls). Data is sent to individual tables asynchronously so that changes to individual staging tables can be made (e.g. repeated) independently without damaging the entire solution.<br>
> ❗ Execute SQL task for every staging table after loading it into fact table (it takes also less space - anyway, later we load this historical data to data warehouse)<br>
> TRUNCATE removes all rows from a table, but the table structure and its columns, constraints, indexes, and so on remain (deletes the data inside a table, but not the table itself)
```
truncate table TabelName;
```
      
> Control flow <br> <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/e9454ba3-14a2-423d-8569-063cae20365c" width="500">

> Data flow task <br> (use data conversions -> load into staging) <br>
      <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/489e360c-1c07-46a8-8304-7a01af62dd12" width="500">
      
## 2. Loading dimension and fact tables to data warehouse 
> At this step, we transfer data from staging tables to the data warehouse (one process called initial load).<br>
> <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/fcde9a54-b4cb-490c-a45c-8e106d6c5659" width="900">



## 3. Building cube
File: multidimensional_cube_orders.sln <br>
> <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/4394d9f4-afa6-4d8e-b2d8-6472797c9e6e" width="900"> <br>

> Deploy <br>
> <img src="https://github.com/gapself/data-warehouse-star-schema/assets/38349049/a346a8b1-5034-4603-b433-61fa08a8e54d" width="500">
