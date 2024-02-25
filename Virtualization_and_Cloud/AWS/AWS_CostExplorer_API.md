# AWS Cost Management Notes

## Introduction
These notes provide insights into AWS Cost Management, including the use of the AWS CLI and Cost Explorer API. 

## Daily Manual AWS Cost Management Routine
Every day involves connecting to the AWS account, navigating to the AWS Cost Management
And manually checking daily unblended cost, current monthly cost, forecasted month-end cost, and services incurring charges.

## Desired Automation
The goal is to automate this manual process using AWS CLI, eliminating the need for logging in and navigating through the AWS console.

## Automated Cost Retrieval Script

### Python Script with Boto3
We can create a Python script using the Boto3 library to retrieve cost details for each service over the last month and each day. 
Crontab can be used to schedule the script for execution every morning at 8:30 AM, creating an output file for that date.
---

### AWS CLI Limitations
While normal AWS CLI commands allow getting unblended cost per day, fetching service-specific costs requires a programmatic approach. 
The AWS CLI is suitable for basic commands, and for more detailed information, programmatic solutions are recommended.

### Understanding AWS API Responses
When interacting with the AWS API, the response is in JSON format. 
To better understand and utilize the data, parsing the JSON response is necessary, enabling a more desired representation.

### Cost of AWS API Requests
For each query to the AWS Cost Explorer API for programmatic access, there is a charge of 0.01 USD per request. 
It's essential to be mindful of these charges and use resources judiciously until the cost structure is fully understood.

---

## Cost Usage AWS CLI Queries using cost explorer api

### Retrieving Daily Unblended Cost
```
aws ce get-cost-and-usage \
  --time-period Start=$(date -I -d '1 day ago'),End=$(date -I) \
  --granularity DAILY \
  --metrics UnblendedCost \
  --output json | jq -r '.ResultsByTime[] | {StartDate: .TimePeriod.Start, EndDate: .TimePeriod.End, Metric: "UnblendedCost", Cost: (.Total.UnblendedCost.Amount + " " + .Total.UnblendedCost.Unit)}'
```

## Get cost forecast
```
aws ce get-cost-forecast --time-period Start=$(date -I),End=$(date -I -d '+1 month') --granularity MONTHLY --metric UNBLENDED_COST --output json | jq -r '.ForecastResultsByTime[] | {StartDate: .TimePeriod.Start, EndDate: .TimePeriod.End, Metric: "UNBLENDED_COST", Cost: (.MeanValue + " " + .Total.Unit)}'
```

---

## Important Considerations
AWS CLI queries to AWS API may incur charges.
The AWS Cost Explorer API data might have a slight delay.
Ensure proper AWS CLI configuration and IAM permissions.
AWS CLI Commands for Cost Retrieval
Retrieve Cost and Billing Information


# Get cost and usage details
aws ce get-cost-and-usage --time-period Start=$(date -I -d '1 day ago'),End=$(date -I) --granularity DAILY --output json

# Get cost forecast
aws ce get-cost-forecast --time-period Start=$(date -I),End=$(date -I -d '+1 month') --granularity MONTHLY --output json
Important Notes
Ensure AWS CLI is configured with proper credentials.
Necessary IAM permissions are required for accessing billing and cost information.
Date formats in commands may need adjustment based on the shell and operating system.
AWS Cost Explorer API data may have a slight delay.

Recommendations
Consider using AWS Cost Explorer with the billing dashboard.
Set up budget alerts for effective cost management.


