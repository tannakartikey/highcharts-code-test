# Connect to this API with these creds to retrieve sample data

User/Pass  “notrehtad”/“K3GcbhDsq/vgNUo”
https://srv.qryp.to/api/logsummary/825db136-ce87-444c-8b7c-89f6b49a00eb/
options are [ “hour”, “day”, “week”, “month”, “quarter”, “year” ]

Example:
https://srv.qryp.to/api/logsummary/825db136-ce87-444c-8b7c-89f6b49a00eb/hour

# Persist the Data into a model called Stats for each App

User has many Apps
App has many Stats

```
App.openid_client_id = 825db136-ce87-444c-8b7c-89f6b49a00eb
```

Stats Model
```
    {
      client_id: "825db136-ce87-444c-8b7c-89f6b49a00eb",
      period_starting: "2018-08-28T19:00:00.000Z",
      operation_type: "UAF",
      operation: "ALL",
      start_result: "Success",
      finish_result: "Success",
      operations_started: "6",
      operations_finished: "6",
      distinct_identities: "1",
      total_elapsed_time: {
        minutes: 1,
        seconds: 47,
        milliseconds: 641
      },
      average_elapsed_time: {
      seconds: 17,
      milliseconds: 940.167
      }
    }
```

# Create the User Growth Chart

- Take this data and put it 1 graph in Highcharts on /analytics URL
- User growth is a line chart that shows the number of distinct users created over the past 30 days / "month"