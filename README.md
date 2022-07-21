# README
![image](https://user-images.githubusercontent.com/97060659/180051493-814ea045-c5b4-4bdb-8f2d-2d6af0ea37ab.png)
# PlanIt Back-End

## Table of Contents

- [Deployed App](#deployed-app)
- [Local Deployment](#local-deployment)
- [Dev Team](#dev-team)
- [Description](#description)
- [Testing & Performance](#testing--performance)
- [PostgreSQL Schema](#postgresql-schema)
- [GraphQL Endpoints](#graphql-endpoints)

## Deployed App

Vist the deployed PlanIt app at [https://planit-earth.netlify.app/](https://planit-earth.netlify.app/)

## Local Deployment

See this [Local Setup Guide](local_setup_guide.md) for detailed instructions on how to deploy the app in a local environment.

## Dev Team

 - Kim Guo ([@kg-byte](https://github.com/kg-byte), [LinkedIn](https://www.linkedin.com/in/xiaole-guo-5331b4158/))
 - Craig Cardwell ([@Eagerlearn](https://github.com/Eagerlearn), [LinkedIn](https://www.linkedin.com/in/craiglcardwell/))
 - Chris Romero ([@CLRM1](https://github.com/CLRM1), [LinkedIn](https://www.linkedin.com/in/chris-romero-419702122/))
 - Scott Sullivan ([@ScottSullivanltd](https://github.com/ScottSullivanltd), [LinkedIn](https://linkedin.com/in/scott-sullivan-9394204a/))


## Description

This repo contains the planit_be, a GraphQL API built with Ruby on Rails and PostgreSQL. It provides data, logic, and other services to a React/Apollo Front-end ([planit-fe](https://github.com/planit-2201/planit_fe)) to record user daily water, straw, bottle, plastic usage and provide a summary report for each category. planit_be was built by a team of students in Turing's Back-End Engineering program in Jul, 2022.

## Testing & Performance

At date of project completion, the PlanIt back-end service has 99.85% test coverage and all tests passing. 

## PostgreSQL Schema

| Users | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| username | String |  |
| flowrate | float | |


| DailyRecords | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| user_id | Integer | User Foreign Key|
| bag_count | Integer | |
| bottle_count | Integer | |
| starw_count | Integer | |
| shower_time | Integer | |


## GraphQL Endpoints

Our GraphQL endpoints fall into two categories: queries and mutations. For detailed examples of all the endpoints and example responses, see our [GraphQL Endpoints Guide](graphql_endpoints.md) or click the specific query or mutation below to go its section.

To make live queries to the GraphQL endpoint and see live schema information, setup the back-end using the [local deployment instructions](local_setup_guide.md).

- Queries
  - [getUser](graphql_endpoints.md#get-user)
  - [getUserDailyRecords](graphql_endpoints.md#get-user-daily-records)
  - [getUserDailyRecord](graphql_endpoints.md#get-user-daily-record)
  - [getAppData](graphql_endpoints.md#get-app-data)
- Mutations
  - [createUser](graphql_endpoints.md#create-user)
  - [updateUser](graphql_endpoints.md#update-user)
  - [deleteUser](graphql_endpoints.md#delete-user)
  - [createDailyRecord](graphql_endpoints.md#create-daily-record)
  - [updateDailyRecord](graphql_endpoints.md#update-daily-record)

