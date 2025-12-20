-- Active: 1766161583536@@127.0.0.1@5432@fintech_db

drop TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    emp_title VARCHAR(100),
    emp_length VARCHAR(50) NOT NULL,
    home_ownership VARCHAR(50) NOT NULL,
    annual_inc FLOAT NOT NULL,
    annual_inc_joint FLOAT,
    verification_status VARCHAR(50)  NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    addr_state varchar(50),
    avg_cur_bal FLOAT,
    tot_cur_bal NUMERIC

);

DROP TABLE IF EXISTS countofloans;
CREATE TABLE countofloans (
    issue_year FLOAT,
    loan_count INT
);
DROP TABLE IF EXISTS loan_purposes;
CREATE TABLE loan_purposes (
    purpose VARCHAR(100)
);

DROP TABLE IF EXISTS loans;
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_status VARCHAR(50),
    loan_amount DECIMAL(15,2),
    state VARCHAR(50),
    funded_amount DECIMAL(15,2),
    term VARCHAR(20),
    int_rate DECIMAL(5,4),
    installment DECIMAL(10,2),
    grade VARCHAR(10),
    issue_date DATE,
    issue_year INT,
    pymnt_plan VARCHAR(10),
    type VARCHAR(50),
    purpose VARCHAR(100),
    description TEXT,
    notes TEXT
);


DROP TABLE IF EXISTS loan_regions;
CREATE TABLE loan_regions (
    loan_id INT,
    loan_amount INT,
    region VARCHAR(50)
);