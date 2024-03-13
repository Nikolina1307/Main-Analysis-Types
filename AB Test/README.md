# A/B Test

A/B testing, also known as split testing, is a method used to compare two versions of a webpage or app against each other to determine which one performs better. It's a widely used tool in product analysis and is crucial for data-driven decision-making in companies.

## Description

Nowadays, A/B testing is one of the most widely used tools to scientifically quantify the effect of changes implemented in various aspects such as marketing campaigns or product features. This module provides an introduction to A/B testing, focusing on running A/B tests for binomial metrics where there may only be two outcomes (e.g., clicked or not clicked). It covers key concepts, benefits, statistical significance, common misinterpretations, and mistakes in A/B testing.

### Objectives

- Learn key concepts and keywords related to A/B testing
- Understand benefits of running A/B tests
- Gain understanding about the most common misinterpretations and mistakes
- Learn how sample size impacts binomial distribution
- Learn how number of conversions impact binomial distribution
- Learn to interpret A/B tests based on different Confidence Intervals (CI)

## Project Task

You have a follow-up task from your marketing manager to estimate the number of users who clicked on marketing campaign banners from the "NewYear" and "BlackFriday" campaigns. This task involves:

1. Preparing a SQL query to estimate if different variants of marketing campaigns had significantly better clickthrough rates.
2. Using website tracking data to calculate unique users who had at least one page view as an alternative to estimating the number of clicks on banners.
3. Running A/B testing on the results obtained from the query.
4. Optionally creating a custom A/B testing approach for the exercise.
5. Adding visualizations to illustrate A/B testing results.

### Introduction
In this A/B testing analysis, we evaluate the performance of two sets of marketing campaigns: NewYear and BlackFriday. The NewYear campaigns were conducted in January 2021, and the BlackFriday campaigns took place in November 2020. The aim is to determine if there is a significant difference in the performance metrics between these campaigns.

### Data Sources
For this analysis, we utilize two primary tables:

tc-da-1.turing_data_analytics.raw_events: This table contains raw data related to user interactions and events during the campaigns.

tc-da-1.turing_data_analytics.adsense_monthly: This table provides insights into the monthly AdSense data, which is valuable for assessing the effectiveness of the campaigns.

### Results
#### NewYear Campaign:
Null Hypothesis (H0): There is no statistically significant difference between NewYear_V1 and NewYear_V2.

Alternative Hypothesis (H1): There is a statistically significant difference between NewYear_V1 and NewYear_V2.

- The alternative hypothesis (H1) was confirmed.
- The performance metrics for NewYear_V1 and NewYear_V2 demonstrated statistically significant differences.

![image](https://github.com/Nikolina1307/Main-Analysis-Types/assets/137876293/d244f4e1-0489-4455-a2ee-226ddfcc3c2c)

According to the findings, there is a significant difference observed between the two groups, with a confidence level of 95% (α = 0.05). The p-value of 1 exceeds the alpha threshold, indicating a substantial deviation. With an observed uplift of around -80 percent between the groups, we have sufficient evidence to reject the null hypothesis (H0), which suggests no distinction between the two groups. Instead, we favor the alternative hypothesis (H1), confirming a significant difference between the two groups.

#### BlackFriday Campaign:
Null Hypothesis (H0): There is no statistically significant difference between BlackFriday_V1 and BlackFriday_V2.

Alternative Hypothesis (H1): There is a statistically significant difference between BlackFriday_V1 and BlackFriday_V2.

- The null hypothesis (H0) was confirmed.
- The performance metrics for BlackFriday_V1 and BlackFriday_V2 demonstrated no statistically significant difference.

![image](https://github.com/Nikolina1307/Main-Analysis-Types/assets/137876293/8f44bae3-5a8c-420e-aac5-2b5b930ffde2)

The analysis reveals that there is no statistically significant difference between campaigns BlackFriday_V1 and BlackFriday_V2, regardless of the confidence level set at either 95% or 99%. With a p-value of 0.4846 and a Z-score of 0.04, both confidence levels (α = 0.05 or α = 0.01) exceed the chosen thresholds. Thus, we cannot reject the null hypothesis (H0), suggesting there is no statictically significant difference between the two groups.

## Recommendations
Based on the results, here are the following recommendations:
### NewYear Campaign (H1 was confirmed):
- Leverage Successful Aspects:
  - Recognize that both NewYear_V1 and NewYear_V2 had their strengths and weaknesses. Analyze the specific factors that contributed to the success of each campaign and consider integrating these successful elements into future marketing strategies.
- Iterative Testing and Optimization:
  - Continue to conduct A/B testing for marketing campaigns to identify and refine effective strategies. Regular testing allows for ongoing optimization and improvement of campaign performance.
- Budget Reallocation:
  - Adjust the marketing budget based on the performance of individual campaigns. Allocate resources to campaigns that have demonstrated success, as indicated by the significant differences observed in this A/B test.
- Audience Segmentation:
  - Explore the possibility of segmenting the audience to tailor campaigns to specific user groups. The differences in performance may be related to variations in audience preferences, so targeting campaigns accordingly could lead to better results.
### BlackFriday Campaign (H0 was confirmed):  
- Maintain Current Strategy:
  - Since there is no significant difference between BlackFriday_V1 and BlackFriday_V2, it may be prudent to maintain the current marketing strategy and continue with what has been working effectively.
- Monitor and Refine:
  - Although the current strategies are similar in performance, it's essential to continually monitor the campaigns, analyze audience behavior, and make adjustments as needed for ongoing success.

These recommendations are tailored to the specific results of each A/B test and aim to enhance marketing strategies accordingly.

---

Feel free to explore the code in this repository for a detailed understanding of A/B testing techniques. If you have any questions or suggestions, please don't hesitate to reach out.

Happy analysing!✌️📊🔍

