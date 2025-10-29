 README for GitHub Repository: JSON_ETL_Project

 Project Title:

ETL Pipeline: JSON Data to MySQL using Python and Pandas



 Overview

This project demonstrates how to build an ETL (Extract, Transform, Load) pipeline in Python using Pandas to process JSON data and load it into a structured MySQL database.

The dataset used is fetched dynamically from a free public API — JSONPlaceholder — which provides mock user data in JSON format.



 Project Workflow

1. Extract
	•	Data was fetched using the requests library from the JSONPlaceholder API endpoint.
	•	The API returned structured JSON data containing user profiles, addresses, and company details.

2. Transform
	•	The JSON data was flattened using pandas.json_normalize() to access nested fields such as:
	•	address.street, address.city, company.name, etc.
	•	Performed data cleaning and validation:
	•	Removed duplicates and null values.
	•	Created a new column valid_email to validate email formats using Regular Expressions (RegEx).
	•	Extracted zip_only from complex zip code strings.
	•	Checked for proper data types and ensured datetime and boolean consistency.

3. Load
	•	Connected to a MySQL database using mysql.connector.
	•	Automatically created a database named json_etl_db and loaded the cleaned DataFrame into a table called users_data.
	•	Renamed complex column names (like address.geo.lat) to readable SQL-friendly names (address_latitude, etc.).
	•	Executed additional SQL operations such as:
	•	Creating indexes and views
	•	Running stored procedures
	•	Using subqueries, CTEs, and window functions

 Database Summary

Database: json_etl_db
Table: users_data

Key Columns:
	•	id, name, username, email, address_city, company_name, valid_email, zip_only

Data Operations Included:
	•	Cleaning, Normalization, Indexing, Stored Procedures, Views, Subqueries, and CTEs



 Skills Demonstrated
	•	Python (Pandas, JSON handling)
	•	SQL (MySQL – queries, joins, CTEs, views, stored procedures)
	•	Data Cleaning & Transformation
	•	ETL Best Practices
	•	Database Design & Automation



 Tools & Technologies
	•	Python: pandas, requests, mysql.connector
	•	Database: MySQL
	•	Environment: PyCharm / Jupyter Notebook



 Results

This project highlights the full data engineering workflow — transforming raw JSON API data into a structured SQL database for analysis, using real-world data-cleaning and automation techniques.


 Future Improvements
	•	Automate daily ETL runs using Airflow or cron jobs
	•	Visualize results using Power BI or Tableau
	•	Integrate multiple JSON APIs for richer datasets



 Author

Isaac Arthur
Data Enthusiast | Aspiring Data Engineer