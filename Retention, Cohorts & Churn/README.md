# Retention, Cohorts & Churn Analysis

## Description
This project focuses on understanding and analyzing user engagement, retention, and churn through cohort analysis. Cohort analysis groups users into cohorts based on shared characteristics or behaviors, providing deeper insights than overall metrics like Monthly Active Users (MAU) or Daily Active Users (DAU). By analyzing cohorts, we gain a better understanding of user behavior over time and can identify trends and patterns that drive user retention and churn.

## Objectives
- Learn about cohort analysis and its benefits compared to conventional methods of understanding customers.
- Understand the concepts of retention and churn analysis and their significance in web, e-commerce, and subscription-based businesses.
- Explore different types of retention and churn analyses and when to use each.
- Practice conducting retention and churn analysis using spreadsheets and SQL.

## Sprint Objectives
- Understand the fundamentals of cohort analysis.
- Learn about the benefits of cohort analysis compared to other methods of understanding customers.
- Gain knowledge of retention and churn analysis, including different types and use cases.
- Practice conducting retention and churn analysis in spreadsheets and SQL.

## Project Overview
### Task Description
For this project, I will be analyzing subscription churn on a weekly retention basis. My objective is to provide statistics on how subscription churn looks on a weekly retention standpoint. Aim is to show the number of subscribers who started their subscription in a particular week and how many remain active in the following 6 weeks.

### Data Source
I will use the `turing_data_analytics.subscriptions` table to answer this question. 

### Analysis Approach
I will conduct cohort analysis to group subscribers based on their subscription start week and track their retention over the subsequent 6 weeks. The analysis will be performed on the dataset available as of 2021-02-07.

## Analysis Steps
1. Retrieve data from the `subscriptions` table.
2. Group subscribers into cohorts based on their subscription start week.
3. Calculate retention rates for each cohort from week 0 to week 6.
4. Visualize the weekly retention cohorts to identify trends and patterns.

By following these steps, my aim is to provide insights into subscription churn and retention dynamics on a weekly basis.

## Results, Conclusions, and Insights

- Upon analyzing the cohort, it becomes evident that subscribers who initiated their subscription in November exhibit a higher tendency to unsubscribe from our services during the second week.

- Delving into the December dataset, we observe that subscribers from that period display lower rates of subscription cancellation over a six-week period. This suggests that a more engaged customer segment may have been targeted during this timeframe. It's crucial to compare these findings with the marketing strategies implemented to gauge their effectiveness in customer retention.

- Towards the end of January 2021, there was a notable decline in the number of new customer subscriptions to our services.

<img width="914" alt="Screenshot 2024-03-13 at 14 22 42" src="https://github.com/Nikolina1307/Main-Analysis-Types/assets/137876293/c5f4f091-1557-4642-98d8-9587f0de582a">
     
<p>&nbsp;</p> 
      
<img width="916" alt="Screenshot 2024-03-13 at 14 21 00" src="https://github.com/Nikolina1307/Main-Analysis-Types/assets/137876293/01973003-ea4e-4eb4-84aa-106c59a08539">

---

Feel free to explore the code in this repository for a detailed understanding of cohort analysis, retention, and churn analysis techniques. If you have any questions or suggestions, please don't hesitate to reach out.

Happy analysing! ✌️📊🔍
