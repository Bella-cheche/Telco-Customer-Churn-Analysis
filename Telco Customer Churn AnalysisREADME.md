📊 Telco Customer Churn Analysis

Customer Behaviour, Service Patterns & Retention Analysis Using SQL and Power BI

This project analyzes customer churn within a telecommunications business to understand who is leaving, when they are most likely to leave, and which customer, service, contract, payment, and tenure patterns are associated with churn.

The analysis combines SQL for data exploration, validation, segmentation, and deeper analysis with Power BI for interactive visualization and dashboard development.

The goal was not simply to calculate a churn rate, but to turn customer-level data into actionable retention insights that can support better customer experience and business decisions.


🎯 Project Objective

Customer churn directly affects recurring revenue, customer lifetime value, and the cost of acquiring replacement customers.

The objective of this analysis was to answer questions such as:

* How many customers are currently in the dataset?
* What proportion of customers have churned?
* Which customer segments have the highest churn?
* Does customer tenure influence churn?
* How does contract type affect retention?
* Are particular internet services associated with higher churn?
* Are payment methods associated with different churn patterns?
* How does monthly customer spending relate to churn?
* Which combinations of customer characteristics represent particularly high-risk segments?
* What retention actions could the business consider based on the findings?


🗂️ Dataset Overview

The dataset contains 7,032 customer records and customer-level information covering demographic characteristics, tenure, contract arrangements, payment methods, internet services, monthly charges, and churn status.

Key fields used in the analysis include:

* Customer ID
* Gender
* Senior Citizen
* Partner
* Dependents
* Tenure
* Phone Service
* Internet Service
* Online Security
* Online Backup
* Device Protection
* Tech Support
* Streaming Services
* Contract
* Payment Method
* Monthly Charges
* Total Charges
* Churn

The dataset provided enough customer-level information to examine churn from multiple business perspectives rather than relying on a single overall churn metric.


🛠️ Tools & Technologies

* SQL / MySQL: Data exploration, validation, segmentation and churn analysis

* Power BI: Data visualization and interactive dashboard

* DAX: KPI and calculated metric development

* Excel: Initial data inspection and supporting data preparation

* GitHub: Project documentation and portfolio presentation


🔄 Project Workflow

The project followed a structured analytics process:

Dataset Understanding → Data Cleaning → Data Validation → SQL Analysis → Customer Segmentation → Power BI Visualization → Dashboard Development → Insights → Business Recommendations


1️⃣ Dataset Understanding

I started by examining the structure and contents of the dataset before beginning the analysis.

The initial review focused on:

* Number of records and columns
* Data types
* Categorical and numerical variables
* Missing values
* Potential duplicate records
* Customer tenure distribution
* Churn distribution
* Contract and payment categories
* Monthly and total charges
* Service-related variables

This stage helped establish what each field represented and which variables could potentially explain differences in customer churn.


2️⃣ Data Cleaning & Preparation

Before analysis, I reviewed and prepared the dataset to improve consistency and reliability.

The cleaning process included:

* Checking for missing values
* Reviewing inconsistent or unexpected values
* Checking data types
* Inspecting numerical fields for invalid entries
* Reviewing categorical values for consistency
* Ensuring tenure and charge fields could be used correctly in analysis
* Preparing variables for segmentation and visualization

The purpose of this stage was to ensure that the subsequent SQL calculations and Power BI visuals were based on reliable data.


3️⃣ Data Validation

After cleaning, I validated the dataset and analytical calculations before building the final dashboard.

Validation included checking:

* Total customer count
* Total churned customers
* Overall churn rate
* Customer counts across categories
* Churn rates by contract type
* Churn rates by tenure
* Churn rates by internet service
* Churn rates by payment method
* Monthly charge patterns
* Segmented customer groups

I also cross-checked important SQL results against the Power BI dashboard to ensure that the figures presented visually were consistent with the underlying analysis.


4️⃣ SQL Analysis

SQL was used as the main analytical layer for exploring the dataset and identifying patterns that would later be visualized in Power BI.

The analysis covered:

Customer Churn Overview

The dataset contains 7,032 customers, with approximately 26.58% classified as churned customers.

This means roughly 1 in 4 customers in the dataset had churned.

Churn by Tenure

Customers were grouped into tenure ranges to identify when customers were most vulnerable to leaving.

The analysis showed a clear relationship between customer tenure and churn exposure:

* 0–6 months: 53.33% churn
* 49+ months: 9.51% churn

This indicates that the early customer lifecycle requires particular attention.

Churn by Contract Type

Contract duration was another important dimension.

The analysis showed:

* Month-to-month: 42.71% churn
* One-year: 11.28% churn
* Two-year: 2.85% churn

The difference across contract groups was substantial and made contract type one of the strongest segmentation variables in the analysis.

Churn by Internet Service

The analysis also examined churn across internet service types.

* Fiber optic: 41.89% churn
* DSL: 19% churn
* No internet service: 7% churn

The relatively high churn among fiber-optic customers does not by itself establish why they leave, so the dashboard treats this as an area requiring further investigation rather than assuming a specific cause.

Churn by Payment Method

Payment behaviour revealed another notable pattern:

* Electronic check: 45.29% churn
* Mailed check: 19%
* Bank transfer: 17%
* Credit card: 15%

This suggested that the electronic-check customer journey deserved additional investigation.


5️⃣ Customer Segmentation

Rather than looking at individual variables independently, I also examined combinations of customer characteristics to identify higher-risk groups.

Some of the strongest combinations identified were:

Month-to-month + 0–6 months tenure

55.20% churn

This segment combines short customer tenure with the most flexible contract structure.

Fiber optic + month-to-month

54.61% churn

This combination showed substantially higher churn than the overall customer population.

Month-to-month + no technical support

50.37% churn

This highlighted the potential importance of support availability within a high-risk contract segment.

These combinations helped move the analysis beyond simply saying “month-to-month customers churn more” and toward identifying specific customer groups that could be monitored for retention risk.


📊 Power BI Dashboard

<img width="485" height="326" alt="Telco Customer Churn Dashboard" src="https://github.com/user-attachments/assets/11540c84-a495-48ab-a87f-dc4a49490c10" />


The final Power BI dashboard was designed as an interactive Telco Customer Churn Analysis report.

The dashboard focuses on:

Customer Behaviour • Churn Patterns • Service Usage • Contract Structure • Payment Behaviour • Customer Tenure

Key Dashboard KPIs

The dashboard provides a high-level view of the customer base:

* Total Customers: Approximately 7000

* Churned Customers: Approximately 2000

* Churn Rate: Approximately 27%

* Average Monthly Charges: $64.76


These KPIs provide an immediate understanding of the scale of the customer base and the overall retention challenge.


📈 Churn Rate by Payment Method

The dashboard compares churn across payment methods.

Electronic check recorded the highest churn at 45.29%, considerably higher than the other payment categories.

This pattern does not prove that the payment method itself causes churn, but it identifies the electronic-check customer journey as an area where the business could investigate:

* Billing friction
* Payment failures
* Customer experience
* Payment convenience
* Opportunities to encourage alternative payment methods


📄 Churn Rate by Contract Type

Contract type produced one of the clearest differences in the analysis.

* Month-to-month: 42.71%
* One-year: 11.28%
* Two-year: 2.85%

The dashboard makes this difference visually clear.

Month-to-month customers represent a significantly higher-churn segment, while customers on longer-term contracts show considerably lower churn.

This makes contract structure an important variable for customer retention analysis.


🌐 Churn Rate by Internet Service

The dashboard shows:

* Fiber optic: 41.89%
* DSL: 19%
* No internet service: 7%

Fiber-optic customers therefore appear as an important group for further investigation.

However, the analysis does not assume that the service itself causes churn. Possible contributing factors could include pricing, network reliability, installation experience, technical support, or customer expectations.


⏳ Churn Rate by Customer Tenure

Tenure was one of the strongest patterns identified.

The dashboard shows churn decreasing as customers remain with the company longer.

The highest-risk period is concentrated among newer customers, while long-tenured customers show substantially lower churn.

This supports the idea of paying particular attention to the early customer lifecycle, especially during the first several months after acquisition.


💳 Churn and Monthly Charges

The analysis also examined customer spending.

Churned customers had an average monthly charge of approximately $74.44, compared with $61.31 among retained customers.

This indicates that customers who churned tended to have higher average monthly charges.

However, the relationship was not perfectly linear across every charge group, meaning price alone does not explain churn.

The finding suggests that the business should consider value perception, service experience, pricing structure, and customer expectations together rather than treating higher charges as a direct cause of churn.


🔎 Key Insights

1. Churn represents a significant retention challenge

Approximately 26.58% of the 7,032 customers in the dataset had churned, meaning roughly one in four customers had left.

2. Early-tenure customers are the highest-risk group

Customers within their first six months recorded 53.33% churn, compared with only 9.51% among customers with 49+ months of tenure.

3. Month-to-month customers show substantially higher churn

Month-to-month customers recorded 42.71% churn, compared with 11.28% for one-year contracts and 2.85% for two-year contracts.

4. Risk becomes more pronounced when customer characteristics overlap

Some combinations produced particularly high churn:

* Month-to-month + 0–6 months: 55.20%
* Fiber optic + month-to-month: 54.61%
* Month-to-month + no technical support: 50.37%

5. Service and payment patterns are associated with churn

Fiber-optic customers recorded 41.89% churn, customers without technical support recorded 41.65%, and electronic-check users recorded 45.29%.

6. Higher-paying customers show greater churn exposure

Churned customers averaged $74.44 in monthly charges, compared with $61.31 among retained customers.

However, because churn did not increase consistently across every charge band, pricing should be investigated alongside service experience and perceived value.


💼 Business Recommendations

1. Prioritize early-tenure retention

Develop a structured first-six-month customer journey involving:

* Strong onboarding
* Proactive customer check-ins
* Service education
* Early issue resolution
* Customer satisfaction monitoring

2. Target high-risk customer combinations

Use customer segmentation to identify groups such as:

* Month-to-month + 0–6 months
* Fiber optic + month-to-month
* Month-to-month + no technical support

These customers could receive proactive engagement before churn occurs.

3. Strengthen month-to-month retention

Investigate retention strategies such as:

* Loyalty benefits
* Service bundles
* Contract-upgrade incentives
* Additional customer benefits

while still maintaining flexibility for customers who prefer shorter commitments.

4. Investigate the fiber customer experience

The high churn among fiber customers warrants further investigation into:

* Pricing
* Network reliability
* Installation experience
* Service quality
* Technical support

The analysis identifies the pattern; additional operational data would be needed to determine the underlying cause.

5. Improve technical support accessibility

Increase awareness and accessibility of technical support, particularly among high-risk customers, and monitor whether greater support engagement is associated with improved retention.

6. Review the electronic-check payment journey

Investigate whether electronic-check customers experience:

* Payment friction
* Billing issues
* Failed transactions
* Confusing payment processes

Convenient automatic payment options could also be explored where appropriate.

7. Improve value perception among higher-charge customers

Review whether customers paying higher monthly charges are receiving and understanding sufficient value through:

* Service bundles
* Customer benefits
* Pricing structure
* Service quality
* Overall customer experience


🚀 Conclusion

This project demonstrates how customer-level data can be transformed into a clearer understanding of customer retention, churn patterns, and potential areas for intervention.

The analysis shows that churn is not evenly distributed across the customer base. Tenure, contract type, internet service, payment method, technical support, and combinations of these characteristics are associated with substantially different churn rates.

The most important analytical takeaway is that identifying who is churning is only the first step. The next step is understanding why those customers are leaving and using additional operational, service-quality, billing, and customer-experience data to validate the underlying causes.


👩🏽‍💻 Author

Mabel Enyi
Data Analyst | SQL | Power BI | Excel

I enjoy turning raw data into clear insights that help businesses understand performance, identify patterns, and make better-informed decisions.
