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

