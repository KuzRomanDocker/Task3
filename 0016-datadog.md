# Choosing the most economical option between Enhanced and Native

## Context and Problem Statement

We want to decide to use Enhanced monitoring with Lambda functions or use the datadog agent in EC2.

## Considered Options

* If we choose "Enhanced Installation", we must enable "Enable enhanced Monitoring for Your RDS Instance". It is recommended to select 15 for the monitoring detail level. But an AWS Lambda is required to submit the metrics to Datadog. The higher granularity and additional required services may result in additional AWS charges.
* For example:

|Number of requests per function|
| --- |
|15 per second * (60 seconds in a minute x 60 minutes in an hour x 730 hours in a month) = 39420000 per month|

|Pricing calculations|
| --- |
|1 functions x 8 metrics per function = 8.00 Lambda insights metrics|
|Tiered price for: 8.000 metrics|
|8 metrics x 0.3000000000 USD = 2.40 USD|
|Total tier cost = 2.40 USD (Metrics cost)|
|1 functions x 39,420,000 requests = 39,420,000.00 Log events|
|39,420,000.00 log events x 1.1 average KB per log event = 43,362,000.00 KB for Log events|
|43,362,000.00 KB / 1024 KB per MB / 1024 MB per GB = 41.353 GB for Log events|
|41.353 GB x 0.50 USD per GB = 20.677 USD for log events|
|2.40 USD + 20.677 USD = 23.077 USD|
| Monitoring with Lambda Insights cost (monthly): 23.077 USD|

* [Amazon CloudWatch pricing](https://aws.amazon.com/cloudwatch/pricing/)

* If we choose "Native", we will need to select EC2 and configure the data agent on EC2. Enabling more integrations may increase Agent resource consumption.
* For example:

|Instance Types| Average CPU usage per month| Billing Option | Monthly Cost|
| --- | --- | --- | --- |
| c5.xlarge | ~20 | On-Demand | ~ $ 24.99 |

* [Amazon EC2 pricing](https://aws.amazon.com/ec2/pricing/)
* [Basic Agent Usage](https://docs.datadoghq.com/agent/basic_agent_usage/?tab=httpcompressionlevel6)

## Decision Outcome

* To choose Enhanced or Native, we need to know how many metrics there will be, how many bases there will be, how often logs need to be processed


