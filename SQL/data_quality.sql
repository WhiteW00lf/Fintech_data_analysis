
-- Check for NULL values in critical fields of various tables

SELECT *
FROM public.loans
WHERE
    loan_amount IS NULL
    OR loan_status IS NULL
    OR customer_id IS NULL;

SELECT *
FROM public.customers
WHERE
    customer_id IS NULL
    OR emp_title IS NULL
    OR emp_length IS NULL
    OR home_ownership IS NULL
    OR annual_inc IS NULL
    OR verification_status IS NULL
    OR zip_code IS NULL
    OR addr_state IS NULL;

SELECT *
FROM public.loan_regions
WHERE
    loan_id IS NULL
    OR region IS NULL;

select COUNT(*) FROM public.loans WHERE loan_amount < 1;

SELECT COUNT(*) FROM public.loan_purposes WHERE purpose IS NULL;




-- Any NULL data in master loan table for critical fields?

SELECT COUNT(*)
FROM master_loan_table
WHERE
    emp_title = NULL
    OR emp_length = NULL
    OR home_ownership = NULL
    OR annual_inc = NULL
    OR verification_status = NULL
    OR zip_code = NULL
    OR addr_state = NULL;