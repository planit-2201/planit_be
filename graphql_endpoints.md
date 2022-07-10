## GraphQL

Our GraphQL endpoints have two categories: queries and mutations.

### Queries

1. getUser(id: ID) *finds a specific user in the Database*

* Example Query

```
{
  getUser(id: "1") {
    id
    username
    flowrate
    weeklyAverageShowerTime
  }
}
```

* Example Response

```
{ "data": {
  "getUser": {
    "username": "Scott Drybread"
    "flowrate": 1.8
    "weeklyAverageShowerTime": 125.0
  }
  }
}
```

2. getUserDailyRecords(user_id:) *finds daily records for a scpecific user*

* Example Query


