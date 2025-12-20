-- An overview of the loan book

SELECT
    SUM(loan_amount) AS total_amount_disbursed,
    COUNT(*) AS total_loans,
    COUNT(DISTINCT customer_id) AS total_customers,
    MIN(loan_amount) AS min_loan_amount,
    MAX(loan_amount) AS max_loan_amount,
    AVG(loan_amount) AS avg_loan_amount
FROM public.master_loan_table
limit 100;

-- Loan status distribution
SELECT loan_status, COUNT(*) AS count
FROM public.master_loan_table
GROUP BY
    loan_status;

-- Loan distribution by customer
SELECT
    customer_id,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount
FROM public.master_loan_table
GROUP BY
    customer_id
HAVING
    COUNT(*) > 1
ORDER BY loan_count DESC

-- Top customers by loan amount

SELECT
    customer_id,
    SUM(loan_amount) AS total_loan_amount,
    dense_rank() OVER (
        ORDER BY SUM(loan_amount) DESC
    ) AS rank
FROM public.master_loan_table
GROUP BY
    customer_id
ORDER BY total_loan_amount DESC;

-- Loan distribution by state
SELECT
    loan_state,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount
FROM public.master_loan_table
GROUP BY
    loan_state
ORDER BY total_loan_amount DESC;

-- Loan distribution by purpose

SELECT
    loan_purpose,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount
FROM public.master_loan_table
GROUP BY
    loan_purpose
ORDER BY total_loan_amount DESC;

-- Loan distribution by year issued
SELECT
    issue_year,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount
FROM public.master_loan_table
GROUP BY
    issue_year;

-- Rank purposes by total loan amount
SELECT
    loan_purpose,
    SUM(loan_amount) AS total_loan_amount,
    dense_rank() OVER (
        ORDER BY SUM(loan_amount) DESC
    ) AS rank
FROM public.master_loan_table
GROUP BY
    loan_purpose
ORDER BY total_loan_amount DESC
LIMIT 3;

-- Total loan amount by employment title
SELECT
    emp_title,
    SUM(loan_amount) AS total_loan_amount,
    COUNT(*) AS loan_count
FROM public.master_loan_table
GROUP BY
    emp_title
ORDER BY total_loan_amount DESC
LIMIT 5;

-- Difference in loan disbursed comapred to previous year
WITH yearly_loans AS (
    SELECT
        issue_year,
        loan_purpose,
        SUM(loan_amount) AS total_loan_amount
    FROM public.master_loan_table
    GROUP BY issue_year, loan_purpose
)
SELECT
    issue_year,
    loan_purpose,
    total_loan_amount,
    ROUND(
        (total_loan_amount
         - LAG(total_loan_amount) OVER (
             PARTITION BY loan_purpose
             ORDER BY issue_year
         ))
        / LAG(total_loan_amount) OVER (
            PARTITION BY loan_purpose
            ORDER BY issue_year
        ) * 100
    , 2) AS pct_change_from_prev_year
FROM yearly_loans
ORDER BY issue_year, loan_purpose;
