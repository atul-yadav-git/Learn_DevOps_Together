# AWS Cost Management Notes

## Introduction
These notes provide insights into AWS Cost Management, including the use of the AWS CLI and Cost Explorer API. 

### Daily Manual AWS Cost Management Routine
```
Every day involves connecting to the AWS account, navigating to the AWS Cost Management
And manually checking daily unblended cost, current monthly cost, forecasted month-end cost, and services incurring charges.
```
### Desired Automation
```
-  The goal is to automate this manual process using AWS CLI, eliminating the need for logging in and navigating through the AWS console.
-  We can use the AWS CLI to retrieve cost and billing information for our AWS account without having to log in to the AWS Management Console. 
-  To get the details, we can use the AWS Cost Explorer API, specifically the get-cost-and-usage and get-cost-forecast operations.
```
---
*Note :*
```
AWS CLI queries to AWS API may incur charges

For each query to the AWS Cost Explorer API for programmatic access, there is a charge of 0.01 USD per request. 

It's essential to be mindful of these charges and use resources judiciously until the cost structure is fully understood.
```
---

## Cost Usage AWS CLI Queries using cost explorer API

### Get cost and usage details
```
aws ce get-cost-and-usage --time-period Start=$(date -I -d '1 day ago'),End=$(date -I) --granularity DAILY --output json
```

### Get Unblended Cost and usage details
```
aws ce get-cost-and-usage \
  --time-period Start=$(date -I -d '1 day ago'),End=$(date -I) \
  --granularity DAILY \
  --metrics UnblendedCost \
  --output json | jq -r '.ResultsByTime[] | {StartDate: .TimePeriod.Start, EndDate: .TimePeriod.End, Metric: "UnblendedCost", Cost: (.Total.UnblendedCost.Amount + " " + .Total.UnblendedCost.Unit)}'
```

### Get cost forecast

```
aws ce get-cost-forecast --time-period Start=$(date -I),End=$(date -I -d '+1 month') --granularity MONTHLY --output json
```

### Get unblended cost forecast

```
aws ce get-cost-forecast --time-period Start=$(date -I),End=$(date -I -d '+1 month') --granularity MONTHLY --metric UNBLENDED_COST --output json | jq -r '.ForecastResultsByTime[] | {StartDate: .TimePeriod.Start, EndDate: .TimePeriod.End, Metric: "UNBLENDED_COST", Cost: (.MeanValue + " " + .Total.Unit)}'
```
### Understanding AWS API Responses
```
-  When interacting with the AWS API, the response is in JSON format. 
-  To better understand and utilize the data, parsing the JSON response is necessary, enabling a more desired representation.
```
## In AWS Cost Explorer, you can retrieve various types of cost metrics to gain insights into your AWS spending. 
1. Unblended Cost:
```
-  Unblended cost is often used for a straightforward, raw view of the total cost without considering Reserved Instances or Savings Plans.
-  It gives a clear picture of the actual monetary impact of AWS resource usage.
```
2.  Blended Cost:
```
-  Blended cost is commonly used when organizations want to understand the overall cost impact, considering any upfront commitments or discounts from Reserved Instances or Savings Plans.
-  It provides a more holistic view that includes discounted and on-demand costs.
```
3.  Amortized Cost:
```
-  Amortized cost is valuable when analyzing the average cost of resources over the term of a Reserved Instance or Savings Plan.
-  It helps in assessing the long-term cost-effectiveness of reserved capacity.
```
4.  Normalized Usage Amount (NUA):
```
-  NUA is beneficial when you want a normalized view of resource consumption, allowing for accurate cost comparisons.
-  It's useful for understanding cost efficiency regardless of variations in resource types or sizes.
```
5.  Usage Quantity:
```
-  Usage quantity is used when you need to measure resource consumption in terms of specific units.
-  It provides insights into the volume of resources used, helping in capacity planning.
```

## Important Notes
```
-  Ensure AWS CLI is configured with proper credentials.
-  Necessary IAM permissions are required for accessing billing and cost information.
-  Date formats in commands may need adjustment based on the shell and operating system.
-  AWS Cost Explorer API data may have a slight delay.
```

## Recommendations
Consider using AWS Cost Explorer with the billing dashboard.
Set up budget alerts for effective cost management.

## Automated Cost Retrieval Script : Python Script with Boto3
- We can create a Python script using the Boto3 library to retrieve cost details for each service over the last month and each day. 
- Crontab can be used to schedule the script for execution at a particular fixed time daily, creating an output file for that date.

---

### AWS CLI Limitations
While normal AWS CLI commands allow getting unblended cost per day, fetching service-specific costs requires a programmatic approach. 
The AWS CLI is suitable for basic commands, and for more detailed information, programmatic solutions are recommended.





