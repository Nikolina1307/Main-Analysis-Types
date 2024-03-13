# Funnels

## Description
Funnel analysis is a widely-used technique in product analysis, offering insights into various processes such as e-commerce, sales, conversion, and customer engagement. It visualizes a linear journey or process, particularly in cases where users must navigate clear steps to achieve a goal, such as registration, subscription purchase, or product acquisition.

Primarily focused on the linear progression within a specified process, funnel analysis involves examining each step in the customer journey, assessing click-through and drop-off rates at each stage. Additionally, when comparing multiple funnels, the total conversion rate is a key metric used to evaluate the effectiveness of converting customers towards a specific goal.

## Objectives
- Gain an understanding of what a funnel is.
- Recognize when to use a funnel and the insights it can provide.
- Learn and practice funnel analysis using Google Spreadsheets.

## Project Task
### Task Description
Analyze the data in the raw_events table, familiarizing yourself with the dataset and identifying events captured by users visiting the website. From the unique events table, select relevant data for creating a sales funnel chart, focusing on 4 to 6 types of events. Create a funnel chart with a breakdown by country, highlighting the top 3 countries based on their overall number of events. Provide insights derived from the analysis and explore additional slices for funnel analysis that may offer valuable insights.

### Results & Insights

<img width="585" alt="Screenshot 2024-03-13 at 16 01 33" src="https://github.com/Nikolina1307/Main-Analysis-Types/assets/137876293/1c102e1c-825f-4cc2-82dd-3444df19f481">

- Event Frequency: 
  - The chart shows a funnel-like distribution of events, with 'page_view' at the top, having the highest frequency at 100%. This indicates that all users included in the analysis have viewed a page, which is the starting point of the online customer journey.
  - Subsequents events have progressively fewer occurrences. This is typical for a sales funnel, where not all users who view a page will go on to view an intem, add it to their cart, begin checkout, and finally make a purchase.
- Drop-off Rates:
  - There is significant drop-off rate after 'page_view' to 'view_item', which is only ~ 22.8% (avg. for all three countries) of the 'page_view' events. This suggests that only about a fifth of the customers who view a page go on to view a specific item.
  - The drop-off continues with the following events.
- Conversion Rates:
  - Conversion rates drop significantly as users progress through the funnel, from 'page_view' to 'purchase'.
  - The final step 'purchase' has to lowest percentage and represents the final conversion rate. In this case only ~ 1.66% (avg. for all three countries) page viewers go on to make a purchase.
- Country Differences:
  - User behavior and funnel performance are relatively consistent among the top three countries.

### Recommendations

Based on the insights, the following recommendations are provided:

- User Experience Enhancement: Improve user experience at the "view_item" and "add_to_cart" stages to encourage more users to add items to their cart.
- Checkout Streamlining: Simplify the checkout process to reduce friction, resolve payment issues, and provide a smoother experience.
- Conversion Rate Optimization (CRO): Implement CRO techniques to identify and address pain points in the user journey.
- Cart Abandonment Strategy: Develop strategies to re-engage users who abandoned their carts.
- Payment Experience: Ensure a seamless payment process with multiple payment options.
- Retargeting and Remarketing: Re-engage users who dropped off at different funnel stages.
- A/B Testing: Conduct A/B tests on critical funnel steps to optimize the user journey.
- Customer Support: Provide accessible customer support during checkout.
- Mobile Optimization: Ensure a mobile-friendly website.
- Localized Strategies: Tailor strategies to the specific needs of users in different countries.
- Churn Analysis: Conduct further analysis to understand and address the reasons for user churn at different funnel stages.

By implementing these recommendations and further analyzing user behavior, the aim is to improve conversion rates and user experience on the platform.

---

Feel free to explore the code in this repository for a detailed understanding of cohort analysis, retention, and churn analysis techniques. If you have any questions or suggestions, please don't hesitate to reach out.

Happy analysing! ✌️📊🔍
