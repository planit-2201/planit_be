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

```
{ 
 getUserDailyRecords(userId: #{User.last.id})
   {
     date
     bagCount
     containerCount
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
                "date": "2022-07-07",
                "bagCount": 3,
                "containerCount": 2,
                "strawCount": 0,
                "userId": 1,
                "showerTime": 0
            },
            {
                "date": "2022-07-08",
                "bagCount": 3,
                "containerCount": 2,
                "strawCount": 0,
                "userId": 1,
                "showerTime": 0
            },
            {
                "date": "2022-07-09",
                "bagCount": 3,
                "containerCount": 3,
                "strawCount": 2,
                "userId": 1,
                "showerTime": 500
            },
            {
                "date": "2022-07-10",
                "bagCount": 3,
                "containerCount": 3,
                "strawCount": 2,
                "userId": 1,
                "showerTime": 500
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
  }) {
  username
  flowrate
  }
}
```

* Example Response

```
{
"data": {
  "createUser": {
  "userId": 2
  "username": "new user",
  "flowrate": 2.5
  }
  }
}
```

2. updateUser(CreateUserInput) *allow users to update username and flowrate*

* Example Query

```
mutation {
  updateUser(input: {
  id: 1
  username: "new user name"
  flowrate: 2.5
  }) {
  username
  flowrate
  }
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

3.
