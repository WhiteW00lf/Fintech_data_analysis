# %%
!pip install psycopg2

# %%
import pandas as pd
import psycopg2
import seaborn as sns
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
engine = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/fintech_db')

# %%
df = pd.read_sql('SELECT * FROM public.master_loan_table', con=engine)   

# %%
df.head()

# %%
df.describe()

# %%
df[df['loan_status'] == 'Charged Off'].groupby('issue_year').size().plot(kind='bar',colormap='viridis', title='Number of Charged Off Loans by Issue Year')

# %%
no_of_loans = df.groupby('issue_year')['loan_id'].nunique().plot(kind='bar', title='Number of Loans Issued by Year',color='teal')

# %%
df['interest_rate_in_decimal'] = df['int_rate'] * 100 
df['interest_rate_in_decimal'].head()

# %%
df[['issue_year','interest_rate_in_decimal']].groupby('issue_year').mean().plot(kind='line', title='Average Interest Rate by Issue Year',color='orange')

# %%
df['loan_amount'].describe(percentiles=[0.25, 0.5, 0.75])

# %%
df['loan_amount'].hist(bins=50, color='skyblue', edgecolor='black')
plt.title('Distribution of Loan Amounts')
plt.xlabel('Loan Amount')   

# %%
sns.boxplot(x=df['loan_amount'])
plt.title('Boxplot of Loan Amounts')

# %%
sns.boxplot(x='issue_year', y='loan_amount', data=df, hue='issue_year',palette='Set3')
plt.title('Loan Amount by Issue Year')
plt.xlabel('Issue Year')
plt.ylabel('Loan Amount')
plt.legend(title='Issue Year', bbox_to_anchor=(1.05, 1), loc='upper left')

# %%
df['funding_rate_in_decimal'] = df['funded_amount'] / df['loan_amount'] * 100
df['funding_rate_in_decimal'].describe()

# %%
df['loan_status'].value_counts(normalize=True) * 100

# %%
def status_check(status):
    if status in ['Fully Paid', 'Current']:
        return 'Good'
    elif status in ['Late (31-120 days)', 'In Grace Period']:
        return 'Bad'
    else:
        return 'Risky'

# %%
df.apply(lambda x: status_check(x['loan_status']), axis=1).value_counts(normalize=True) * 100



