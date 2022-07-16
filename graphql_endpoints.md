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
    weeklyAverageWaterUsage
    thirtydayAverageShowerTime
    thirtydayAverageWaterUsage
  }
}
```

* Example Response

```
{ "data": {
  "getUser": {
    "username": "Scott Drybread"
    "flowrate": 1.8
    "weeklyAverageShowerTime": 535.0
    "weeklyAverageWaterUsage": 16.05
    "thirtydayAverageShowerTime": 568.0
    "thirtydayAverageWaterUsage": 17.04
  }
  }
}
```

2. getUserDailyRecords(user_id:) *finds all daily records for a scpecific user*

* Example Query

```
{ 
 getUserDailyRecords(userId: "33")
   {
     date
     bagCount
     bottleCount
     strawCount
     showerTime
   }
}
 ```

* Example Response

```
{
  "data": {
      "getUserDailyRecords": [
          {
             "date": "2022-07-07"
             "bagCount": 3
             "bottleCount": 2
             "strawCount": 0
             "userId": 1
             "showerTime": 0
          },
          {
             "date": "2022-07-08"
             "bagCount": 3
             "bottleCount": 2
             "strawCount": 0
             "userId": 1
             "showerTime": 0
          },
          {
             "date": "2022-07-09"
             "bagCount": 3
             "bottleCount": 3
             "strawCount": 2
             "userId": 1
             "showerTime": 500
          },
          {
             "date": "2022-07-10"
             "bagCount": 3
             "bottleCount": 3
             "strawCount": 2
             "userId": 1
             "showerTime": 500
          }
      ]
   }
}
```
3. getUserDailyRecord(user_id:, date:) *finds one daily record for a scpecific user on a given date (String)

* Example Query

```
query {
    getUserDailyRecord(userId: "44", date: "2022-07-09") {
     date
     bagCount
     bottleCount
     strawCount
     userId
     showerTime
    }
  }
```

* Example Response

```
{
    "data": {
        "getUserDailyRecord": [
            {
                "date": "2022-07-09",
                "bagCount": 3,
                "bottleCount": 3,
                "strawCount": 2,
                "userId": 44,
                "showerTime": 692
            }
        ]
    }
}
```
### Mutations

1. createUser(CreateUserInput) *allow users to create account with username and flowrate*

* Example Query

```
mutation {
  createUser(input: {
    username: "new user"
    flowrate: 2.5
    })
  }
}
```

* Example Response

```
{
  "data": {
    "createUser": {
      "userId": 2
      "username": "new user"
      "flowrate": 2.5
    }
  }
}
```

2. updateUser(UpdateUserInput) *allow users to update username and flowrate*

* Example Query

```
mutation {
  updateUser(input: {
     id: 1
     username: "new user name"
     flowrate: 2.5
     })
}
```

* Example Response

```
{
  "data": {
    "updateUser": {
    "username": "new user name",
    "flowrate": 2.5
    }
  }
}
```

3. deleteUser(DeleteUserInput) *delete a user and corresponding daily records*

* Example Query

```
mutation {
    deleteUser(
      input:{
      id: "1" })
      {
      name
    }
}
```

* Example Response

```
{
  "data": {
    "deleteUser": {
    "name": "Scott Drybread"
    }
  }
}
```

4. createDailyRecord(CreateDailyRecordInput) *allow users to create daily record info*

* Example Query

```
mutation {
   createDailyRecord(input: {
      date:"2022-07-10"
      userId: 1
      bagCount: 3
      bottleCount:3
      strawCount:2
      showerTime:500
      })
}
```

* Example Response

```
{
  "data": {
    "createDailyRecord": {
      "date": "2022-07-10",
      "userId": 1,
      "bagCount": 3,
      "bottleCount": 3,
      "strawCount": 2,
      "showerTime": 500
    }
  }
}
```

5. updateDailyRecord(UpdateDailyRecordInput) *allow users to update daily record*

* Example Query

```
mutation {
    updateDailyRecord(input: {
        date:"2022-07-09"
        userId: 1
        bagCount: 5
        bottleCount: 3
        strawCount: 2
        showerTime: 500
        })
}
```

* Example Response

```
{
  "data": {
    "updateDailyRecord": {
      "date": "2022-07-09",
      "userId": 1,
      "bagCount": 5,
      "bottle'Count": 3,
      "strawCount": 2,
      "showerTime": 500
    }
  }
}
```
