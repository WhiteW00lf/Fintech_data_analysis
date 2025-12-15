
drop TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    emp_title VARCHAR(100) NOT NULL,
    emp_length VARCHAR(50) NOT NULL,
    home_ownership VARCHAR(50) NOT NULL,
    annual_inc FLOAT NOT NULL,
    annual_inc_joint FLOAT,
    verification_status VARCHAR(50)  NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    addr_state varchar(50),
    avg_cur_bal FLOAT,
    tot_cur_bal INT

);