# Retail Sales SQL Analysis

## 📌 Project Overview
This project analyzes retail transaction data using SQL to uncover key business insights such as revenue trends, customer behavior, product performance, and retention patterns.  
The analysis is designed to be **interview-ready** and includes **24 detailed SQL queries** with sample outputs and interpretation tips.

---

## 📂 Dataset
**Columns:**
- `invoice_no` – Unique transaction ID
- `customer_id` – Unique customer identifier
- `gender` – Customer gender (Male/Female)
- `age` – Age of customer
- `category` – Product category purchased
- `quantity` – Number of units purchased
- `price` – Price per unit
- `payment_method` – Mode of payment (Credit Card, UPI, Cash, etc.)
- `invoice_date` – Date of purchase
- `shopping_mall` – Mall where purchase was made

---

## 📊 Analysis Objectives
The SQL queries answer questions in **four main categories**:

1. **Sales & Revenue**
   - Total revenue, average order value, top categories, payment preferences, seasonal peaks.
2. **Customer Insights**
   - Demographics, spending habits, top customers, gender/category relationships.
3. **Time Trends**
   - Monthly, daily, and seasonal trends, weekend vs weekday sales.
4. **Advanced Business Insights**
   - Pareto analysis, age group preferences, high-value transactions, retention.

---

## 🛠️ Tech Stack
- **Database**: PostgreSQL (queries can be adapted for MySQL 8+ / SQL Server)
- **Optional Visualization**: Power BI / Tableau for charts

---

## 📁 Files in Repository
- `Queries.sql` – All 24 SQL queries
- `schemas.sql` - Schemas and data cleaning
- `README.md` – Project overview (this file)
- `customer_shopping_data.csv` - data

---

## 🚀 How to Run
1. Import the dataset into your database (MySQL/PostgreSQL/SQL Server).
2. Update table name in queries (`sales_data` → your table name).
3. Execute queries in sequence.
4. Record results in the provided **Results on Your Data** section.
5. Use insights for reporting or dashboards.

---

## 📈 Example Insights from Sample Data
- **January** had the highest revenue due to holiday promotions.
- **Females** contributed 20% more revenue than males.
- **Top 20% customers** generated ~60% of total revenue.
- **Weekdays** had 43% higher sales than weekdays.

---

## 📜 License
This project is open-source for learning purposes.  
Feel free to fork and adapt for your own datasets.

---
