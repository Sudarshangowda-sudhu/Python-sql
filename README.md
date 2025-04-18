🐍 Kaggle to MySQL ETL Pipeline with Python
This project demonstrates an end-to-end ETL (Extract-Transform-Load) pipeline that processes sales data from a Kaggle dataset. The workflow involves transforming raw CSV data using Python, loading it into a MySQL database, and performing analytical queries using SQL.

📖 Overview
Data Source: Sales data from Kaggle in a compressed CSV format.

Transformation: Performed using Python's Pandas library to clean, enrich, and format the data.

Storage: Loaded into a MySQL database for structured querying and analysis.

Analysis: Insights were extracted using advanced SQL queries, including use of window functions and date-based grouping.

📊 Architecture
Extract: The zipped CSV file is uncompressed and read into a Pandas DataFrame.

Transform:

Standardizes column names and formats.

Calculates new fields: discount, sale value, and profit.

Converts date fields into appropriate datetime formats.

Load: The transformed data is inserted into a MySQL database table.

Analyze: SQL queries are executed on the database to uncover business insights.

🛠️ Tech Stack
Python (Pandas, SQLAlchemy, PyMySQL)

MySQL

Jupyter Notebook / Python Script

SQL for analytics

Draw.io for architecture diagram

🚀 How to Run
Unzip and read the dataset into a DataFrame.

Clean and transform the data using Pandas.

Establish a MySQL connection and load the data into a database.

Run SQL queries to perform business analysis.

📈 SQL Analytics
Key analyses performed on the dataset:

Top 10 revenue-generating products based on total sales value.

Top 5 best-selling products per region using SQL window functions.

Month-over-month sales comparison between 2022 and 2023 to observe trends.

Highest-grossing month per category, useful for seasonal or demand-based planning.

Sub-category with highest profit growth between two years to assess business expansion areas.

📌 Sample Insights
Products in the Technology category consistently drive high revenue.

Some sub-categories had significant YoY profit growth, signaling scaling opportunities.

Certain regions show dominance in specific product types, hinting at geographic preferences.

Sales spikes during particular months offer insights into seasonal buying behaviors.

