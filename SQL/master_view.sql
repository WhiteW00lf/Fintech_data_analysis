-- Total amount of loans disbursed

CREATE OR REPLACE VIEW loans_disbursed_till_date AS (
    SELECT SUM(loan_amount)
    FROM public.loans
);

--SELECT * FROM loans_disbursed_till_date;
-- Total amount of loans repaid

CREATE OR REPLACE VIEW loans_repaid_till_date AS (
    SELECT COUNT(*)
    FROM public.loans
    WHERE
        loan_status = 'Fully Paid'
);
--SELECT * FROM loans_repaid_till_date;

-- Master loan table

CREATE OR REPLACE VIEW master_loan_table AS
SELECT
    l.loan_id,
    l.customer_id,
    l.loan_status,
    l.loan_amount,
    l.state        AS loan_state,
    l.funded_amount,
    l.term,
    l.int_rate,
    l.installment,
    l.grade,
    l.issue_date,
    l.issue_year,
    l.pymnt_plan,
    l.type         AS loan_type,
    l.purpose      AS loan_purpose,
    l.description  AS loan_description,
    l.notes        AS loan_notes,
    COALESCE(c.emp_title,'Unknown')::VARCHAR(100) AS emp_title,
    c.emp_length,
    c.home_ownership,
    c.annual_inc,
    c.annual_inc_joint,
    c.verification_status,
    c.zip_code,
    c.addr_state,
    c.avg_cur_bal,
    c.tot_cur_bal,
    r.loan_amount AS region_loan_amount,
    r.region AS loan_region
FROM public.loans l
INNER JOIN public.customers c
    ON l.customer_id = c.customer_id
INNER JOIN public.loan_regions r
     ON l.loan_id = r.loan_id;

