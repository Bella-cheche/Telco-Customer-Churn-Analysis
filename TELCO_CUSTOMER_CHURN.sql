/* Dataset Understanding */

SELECT *
FROM telco_customer_churn;


/* Checking for Duplicate */

SELECT
	customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn,
COUNT(*) AS DuplicateCount
FROM telco_customer_churn
GROUP BY
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn
HAVING COUNT(*) >1;


/* Checking for Missing Values */

SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS Missing_CustomerID,
    SUM(CASE WHEN gender IS NULL OR TRIM(gender) = '' THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN SeniorCitizen IS NULL OR TRIM(SeniorCitizen) = '' THEN 1 ELSE 0 END) AS Missing_SeniorCitizen,
    SUM(CASE WHEN Partner IS NULL OR TRIM(Partner) = '' THEN 1 ELSE 0 END) AS Missing_Partner,
    SUM(CASE WHEN Dependents IS NULL OR TRIM(Dependents) = '' THEN 1 ELSE 0 END) AS Missing_Dependents,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS Missing_tenure,
    SUM(CASE WHEN PhoneService IS NULL OR TRIM(PhoneService) = '' THEN 1 ELSE 0 END) AS Missing_PhoneService,
    SUM(CASE WHEN MultipleLines IS NULL OR TRIM(MultipleLines) = '' THEN 1 ELSE 0 END) AS Missing_MultipleLines,
    SUM(CASE WHEN InternetService IS NULL OR TRIM(InternetService) = '' THEN 1 ELSE 0 END) AS Missing_InternetService,
    SUM(CASE WHEN OnlineSecurity IS NULL OR TRIM(OnlineSecurity) = '' THEN 1 ELSE 0 END) AS Missing_OnlineSecurity,
    SUM(CASE WHEN OnlineBackup IS NULL OR TRIM(OnlineBackup) = '' THEN 1 ELSE 0 END) AS Missing_OnlineBackup,
    SUM(CASE WHEN DeviceProtection IS NULL OR TRIM(DeviceProtection) = '' THEN 1 ELSE 0 END) AS Missing_DeviceProtection,
    SUM(CASE WHEN TechSupport IS NULL OR TRIM(TechSupport) = '' THEN 1 ELSE 0 END) AS Missing_TechSupport,
    SUM(CASE WHEN StreamingTV IS NULL OR TRIM(StreamingTV) = '' THEN 1 ELSE 0 END) AS Missing_StreamingTV,
    SUM(CASE WHEN StreamingMovies IS NULL OR TRIM(StreamingMovies) = '' THEN 1 ELSE 0 END) AS Missing_StreamingMovies,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Missing_Contract,
    SUM(CASE WHEN PaperlessBilling IS NULL OR TRIM(PaperlessBilling) = '' THEN 1 ELSE 0 END) AS Missing_PaperlessBilling,
    SUM(CASE WHEN PaymentMethod IS NULL OR TRIM(PaymentMethod) = '' THEN 1 ELSE 0 END) AS Missing_PaymentMethod,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS Missing_MonthlyCharges,
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS Missing_TotalCharges,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Missing_Churn
FROM telco_customer_churn;


/* Checking the Rate at which Customers Churn */

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn;

    
/* Checking for Churn Based on Contract Types */    

SELECT
    Contract,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;


/* Checking for Churn Based on Tenure */

SELECT
   CASE
        WHEN tenure <= 6 THEN '0–6 Months'
        WHEN tenure <= 12 THEN '7–12 Months'
        WHEN tenure <= 24 THEN '13–24 Months'
        WHEN tenure <= 48 THEN '25–48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN '0–6 Months' THEN 1
        WHEN '7–12 Months' THEN 2
        WHEN '13–24 Months' THEN 3
        WHEN '25–48 Months' THEN 4
        ELSE 5
    END;
    
    
/*Checking for Churn Based on Monthly Charges */

SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(MIN(MonthlyCharges), 2) AS min_monthly_charges,
    ROUND(MAX(MonthlyCharges), 2) AS max_monthly_charges
FROM telco_customer_churn
GROUP BY Churn;


SELECT
    CASE
        WHEN MonthlyCharges < 40 THEN 'Under $40'
        WHEN MonthlyCharges < 70 THEN '$40–$69'
        WHEN MonthlyCharges < 100 THEN '$70–$99'
        ELSE '$100+'
    END AS charge_band,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY charge_band
ORDER BY churn_rate DESC;


/* Checking for Churn Based on Internet Service */

SELECT
    InternetService,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;


/* Checking for Churn Based on Tech Support */

SELECT
    TechSupport,
    COUNT(*) AS customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;


/* Checking for Churn Based on Payment Method */

SELECT
    PaymentMethod,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


/* Customers Segmentation Based on Contract, Tenure, and Churn */

SELECT
    Contract,
    CASE
        WHEN tenure <= 6 THEN '0-6 Months'
        WHEN tenure <= 12 THEN '7-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,

    COUNT(*) AS customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned,

    ROUND(
        100.0 * SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY
    Contract,
    tenure_group
ORDER BY churn_rate DESC;


/* Customers Segmentation Based on Internet Service, Contract, and Churn */

SELECT
    InternetService,
    Contract,

    COUNT(*) AS customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned,

    ROUND(
        100.0 * SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY
    InternetService,
    Contract
ORDER BY churn_rate DESC;


/* Customers Segmentation Based on Tech Support, Contract, and Churn */

SELECT
    TechSupport,
    Contract,

    COUNT(*) AS customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned,

    ROUND(
        100.0 * SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn
GROUP BY
    TechSupport,
    Contract
ORDER BY churn_rate DESC;