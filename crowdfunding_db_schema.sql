CREATE SCHEMA crowdfunding_db_schema;

--Create the contacts table 
CREATE TABLE crowdfunding_db_schema.contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255)
);

-- Create the category table
CREATE TABLE crowdfunding_db_schema.category (
    category_id VARCHAR(100) PRIMARY KEY,
    category VARCHAR(100)
);

-- Create the subcategory table
CREATE TABLE crowdfunding_db_schema.subcategory (
    subcategory_id VARCHAR(100) PRIMARY KEY,
    subcategory VARCHAR(100),
    category_id VARCHAR(100) REFERENCES crowdfunding_db_schema.category(category_id)
);

-- Create the campaign table
CREATE TABLE crowdfunding_db_schema.campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INTEGER REFERENCES crowdfunding_db_schema.contacts(contact_id),
    company_name VARCHAR(255),
    description TEXT,
    goal DECIMAL (10,2),
    pledged DECIMAL (10,2),
    outcome VARCHAR(50),
    backers_count INTEGER,
    country VARCHAR(100),
    currency VARCHAR(10),
    launch_date TIMESTAMP,
    end_date TIMESTAMP,
    category_id VARCHAR(100) REFERENCES crowdfunding_db_schema.category(category_id),
    subcategory_id VARCHAR(100) REFERENCES crowdfunding_db_schema.subcategory(subcategory_id)
);

SELECT * FROM crowdfunding_db_schema.contacts;

SELECT * FROM crowdfunding_db_schema.category;

SELECT * FROM crowdfunding_db_schema.subcategory;

SELECT * FROM crowdfunding_db_schema.campaign;
