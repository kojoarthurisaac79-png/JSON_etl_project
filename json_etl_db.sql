USE json_etl_db;
SHOW TABLES;

USE json_etl_db;

ALTER TABLE users_data
CHANGE COLUMN `address.street` address_street VARCHAR(150),
CHANGE COLUMN `address.suite` address_suite VARCHAR(100),
CHANGE COLUMN `address.city` address_city VARCHAR(100),
CHANGE COLUMN `address.zipcode` address_zipcode VARCHAR(50),
CHANGE COLUMN `address.geo.lat` address_latitude VARCHAR(50),
CHANGE COLUMN `address.geo.lng` address_longitude VARCHAR(50),
CHANGE COLUMN `company.name` company_name VARCHAR(150),
CHANGE COLUMN `company.catchPhrase` company_catchphrase VARCHAR(255),
CHANGE COLUMN `company.bs` company_bs VARCHAR(255);

ALTER TABLE users_data
MODIFY COLUMN valid_email BOOLEAN;

 SELECT * FROM users_data;
 
 SELECT name,username,email FROM users_data;
 
 SELECT COUNT(*) AS total_users FROM users_data;
 
 SELECT * FROM users_data WHERE valid_email=TRUE;
 
 SELECT DISTINCT address_city FROM users_data;
 
 SELECT name,email FROM users_data WHERE address_city ="South Christy";
 
 SELECT company_name, COUNT(*) AS  total_users
 FROM users_data GROUP BY company_name;
 
 SELECT name, username FROM users_data ORDER BY name DESC;
 
 SELECT * FROM users_data WHERE address_zipcode IS NULL;
 
 SELECT name, email, address_city FROM users_data
 WHERE valid_email=TRUE AND address_city IS NOT NULL;
 
 SELECT address_city, COUNT(*) AS total_users FROM users_data
 GROUP BY address_city ORDER BY total_users DESC;
 
  SELECT company_name, COUNT(*) AS num_employees FROM users_data
 GROUP BY company_name HAVING COUNT(*) >1;
 
 CREATE VIEW valid_user_view AS SELECT id,name,email,
 address_city FROM users_data WHERE valid_email=TRUE;
 
 SELECT * FROM valid_user_view;
 
 SELECT * FROM users_data WHERE address_city LIKE "S%";
 
 SELECT * FROM users_data WHERE zip_only IS NOT NULL 
 AND company_catchphrase LIKE "M%";
 
 CREATE INDEX idx_address ON users_data
 (address_street,address_suite,website(50));
 
SELECT address_street,address_suite,website FROM users_data;

SELECT name,company_name FROM users_data WHERE
company_name=(
SELECT company_name FROM users_data
WHERE name="Leanne Graham"
);
 
 SET SQL_SAFE_UPDATES=0;
 
 UPDATE users_data SET zip_only	=address_zipcode
 WHERE zip_only IS NULL;
 
 SELECT zip_only FROM users_data;
 
 DELETE FROM  users_data WHERE valid_email=FALSE;
 
 SELECT COUNT(*) FROM users_data;
 
 WITH company_count AS (
    SELECT company_name, COUNT(*) AS total_users
    FROM users_data
    GROUP BY company_name
)
SELECT * FROM company_count;

SELECT name, address_city,
       ROW_NUMBER() OVER (PARTITION BY address_city ORDER BY name) AS city_rank
FROM users_data;

DELIMITER //
CREATE PROCEDURE GetUsersByCompany(IN comp VARCHAR(100))
BEGIN
    SELECT name, email, company_name
    FROM users_data
    WHERE company_name = comp;
END //
DELIMITER ;
 
 CALL GetUsersByCompany('Romaguera-Crona');
 
 SELECT company_name, address_city, COUNT(*) AS shared_users
FROM users_data
GROUP BY company_name, address_city
HAVING COUNT(*) > 1;

CREATE VIEW company_summary AS
SELECT company_name, COUNT(*) AS total_employees
FROM users_data
GROUP BY company_name;

SELECT * FROM company_summary;

DROP VIEW company_summary;

SELECT address_city, AVG(valid_email) AS avg_validity
FROM users_data
GROUP BY address_city
HAVING AVG(valid_email) > 0.5;

SELECT name, address_city, address_latitude
FROM users_data
ORDER BY CAST(address_latitude AS DECIMAL(10,5)) ASC;

CREATE TABLE valid_users AS
SELECT * FROM users_data WHERE valid_email = TRUE;

SELECT * FROM valid_users;

 
 
 
 
 
 








