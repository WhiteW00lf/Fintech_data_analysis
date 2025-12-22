# Loan Portfolio Health & Risk Analysis (Fintech)

This project analyzes a micro-lending loan portfolio to evaluate **portfolio health, funding behavior, customer concentration risk, and regional exposure**.  
The objective is to translate raw loan-level data into **decision-ready insights** relevant to credit, risk, and growth teams in a fintech environment.

---

## Business Context

Fintech lending businesses must scale responsibly while managing:
- Credit risk  
- Geographic concentration risk  
- Capital exposure at loan origination  

This analysis provides a structured assessment of these risks using historical loan data.

---

## Objectives

The analysis focuses on:

1. Evaluating overall loan portfolio health  
2. Assessing funding behavior at loan issuance  
3. Identifying customer concentration risk  
4. Measuring regional exposure and concentration  
5. Providing actionable recommendations for risk-aware growth

---

## Tools & Technologies

- **Python (Pandas)** – data cleaning and analysis  
- **Jupyter Notebook** – exploratory analysis workflow  
- **SQL (analytical concepts)** – aggregations and segmentation  
- **Descriptive statistics** – portfolio-level metrics

---

## Dataset Overview

The dataset contains loan-level records with attributes such as:
- Loan ID and customer ID  
- Loan amount and funding details  
- Loan status  
- Region  
- Issue date and tenure  

(Exact schema and transformations are documented in the analysis notebook.)

---

## Key Analyses & Findings

### 1. Funding Ratio Analysis

**Finding:**  
All loans in the dataset were **fully funded (100%)** at issuance.

**Interpretation:**  
This indicates no partial disbursement or liquidity constraints during loan origination.

**Business Implication:**  
Capital exposure is fully realized upfront, increasing the importance of strong underwriting controls.

---

### 2. Loan Status Health Check

Loan statuses were analyzed to assess overall portfolio performance.

**Interpretation:**  
The distribution of loan statuses provides insight into repayment health and emerging credit risk.

**Business Implication:**  
Regular monitoring of status transitions can help detect early signs of portfolio deterioration.

---

### 3. Customer Concentration Risk

Customer-level aggregation revealed that **each customer holds only one loan**.

**Interpretation:**  
There is **no customer concentration risk**, and exposure is well-distributed across borrowers.

**Business Implication:**  
The portfolio is protected from outsized losses due to individual borrower defaults.

---

### 4. Regional Concentration Analysis

Loan disbursements are **heavily concentrated in the South region**.

**Interpretation:**  
This suggests strong regional demand or more aggressive underwriting in that geography.

**Business Implication:**  
High geographic concentration increases vulnerability to regional economic or regulatory shocks.

---

## Recommendations

1. **Reduce geographic concentration** by gradually expanding disbursements to under-represented regions  
2. **Implement vintage analysis** to track loan performance by issue year  
3. **Monitor regional default trends** before accelerating growth in high-exposure areas  

---

## Business Impact

This analysis highlights both strengths (diversified borrower exposure) and risks (regional concentration) within the loan portfolio.  
The findings support more informed decisions around underwriting strategy, geographic expansion, and risk monitoring.

---


---

## Scope & Limitations

- The analysis is descriptive and diagnostic in nature  
- No predictive modeling or credit scoring was performed  
- Results are based on the available historical dataset  



## Author

Surya  
GitHub: https://github.com/WhiteW00lf  

This project reflects a **business-first approach to data analysis**, emphasizing interpretability, risk awareness, and decision relevance.
