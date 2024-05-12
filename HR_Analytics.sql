 --HR Analytics: Unveiling Insights from Employee Data
 -- View the first few rows of the dataset
SELECT *
FROM hr_data
LIMIT 5;

-- Calculate summary statistics for key attributes
SELECT 
    COUNT(*) AS total_employees,
    AVG(Age) AS avg_age,
    MIN(MonthlyIncome) AS min_monthly_income,
    MAX(MonthlyIncome) AS max_monthly_income,
    AVG(PercentSalaryHike) AS avg_percent_salary_hike
FROM hr_data;

-- Explore the distribution of departmental employees
SELECT 
    Department,
    COUNT(*) AS employee_count
FROM hr_data
GROUP BY Department;

-- Calculate attrition rate
SELECT 
    Attrition,
    COUNT(*) AS attrition_count,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_data) AS attrition_rate
FROM hr_data
GROUP BY Attrition;

-- Identify factors contributing to attrition
SELECT 
    Gender,
    MaritalStatus,
    Department,
    AVG(PerformanceRating) AS avg_performance_rating,
    AVG(YearsAtCompany) AS avg_years_at_company
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Gender, MaritalStatus, Department;

-- Analyze employee satisfaction levels
SELECT 
    EnvironmentSatisfaction,
    JobSatisfaction,
    RelationshipSatisfaction,
    COUNT(*) AS employee_count
FROM hr_data
GROUP BY EnvironmentSatisfaction, JobSatisfaction, RelationshipSatisfaction;

-- Examine performance ratings and percent salary hikes
SELECT 
    PerformanceRating,
    AVG(PercentSalaryHike) AS avg_percent_salary_hike
FROM hr_data
GROUP BY PerformanceRating;

-- Analyze promotion trends
SELECT 
    JobRole,
    AVG(YearsSinceLastPromotion) AS avg_years_since_last_promotion
FROM hr_data
GROUP BY JobRole;

-- Forecast future workforce requirements
SELECT 
    Department,
    COUNT(*) AS employee_count,
    AVG(TotalWorkingYears) AS avg_total_working_years
FROM hr_data
GROUP BY Department;
