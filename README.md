# README
![image](https://user-images.githubusercontent.com/97060659/180051493-814ea045-c5b4-4bdb-8f2d-2d6af0ea37ab.png)
# PlanIt Back-End

## Table of Contents

- [Deployed App](#deployed-app)
- [Local Deployment](#local-deployment)
- [Dev Team](#dev-team)
- [Description](#description)
- [Agile Development](#agile-development)
- [Technologies & Architectures](#technologies--architecture)
- [Testing & Performance](#testing--performance)
- [PostgreSQL Schema](#postgresql-schema)
- [GraphQL Endpoints](#graphql-endpoints)
- [Resource Credits](#resource-credits)

## Deployed App

Vist the deployed PlanIt app at [https://planit-earth.netlify.app/](https://planit-earth.netlify.app/)

## Local Deployment

See this [Deployment Guide](local_setup_guide.md) for detailed instructions on how to deploy the app in a local environment.

## Dev Team

PlanIt's Back-End dev team:
 - Kim Guo ([@kg-byte](https://github.com/kg-byte), [LinkedIn](https://www.linkedin.com/in/xiaole-guo-5331b4158/))
 - Craig Cardwell ([@Eagerlearn](https://github.com/Eagerlearn), [LinkedIn](https://www.linkedin.com/in/craiglcardwell/))
 - Chris Romero ([@CLRM1](https://github.com/CLRM1), [LinkedIn](https://www.linkedin.com/in/chris-romero-419702122/))
 - Scott Sullivan ([@ScottSullivanltd](https://github.com/ScottSullivanltd), [LinkedIn](https://linkedin.com/in/scott-sullivan-9394204a/))

PlanIt's Front-End dev team:
 - Olivia Whitehead ([@whiteheadol](https://github.com/whiteheadol), [LinkedIn](https://www.linkedin.com/in/-olivia-whitehead/))
 - Rachel Hill ([@rachellhill](https://github.com/rachellhill), [LinkedIn](https://www.linkedin.com/https://www.linkedin.com/in/hillrachelli/))
 - Nikki Balmoori ([@nbalmoori](https://github.com/nbalmoori), [LinkedIn](https://www.linkedin.com/in/nbalmoori/))
 - Zachary Saile ([@zwsaile](https://github.com/zwsaile), [LinkedIn](https://www.linkedin.com/in/zachary-saile/))

## Description

This repo contains the planit_be, a GraphQL API built with Ruby on Rails and PostgreSQL. It provides data, logic, and other services to a React/Apollo Front-end ([planit-fe](https://github.com/planit-2201/planit_fe)) to record user daily water, straw, bottle, plastic usage and provide a summary report for each category. planit_be was built by a team of students in Turing's Back-End Engineering program in Jul, 2022.

## Agile Development

PlanIt was developed over the course of 15 days using accelerated agile practices. After [an initial proposal was written](https://docs.google.com/presentation/d/1hBv6paUUFhn35rVdWqoev71b5fatHQhRAZT3lOJyUSE/edit?usp=sharing), the team collaboratively participated in an "inception" process. After an initial 'Determine The Relationship' meeting, the team "brain-dumped" all their feature proposals then went through a feature prioritization process in order to determine which would be part of the "minimum viable product" (MVP).

After establishing goals, communication plans, project management conventions, the team decided to use a Miro for project management, and have daily stand-up meetings and weekly retrospective meetings. The team met with a project manager and a project mentor every three days for check-ins and communicated with them regularly via Slack.

## Technologies & Architecture

- Hosting: Netlify (FE) and Heroku (BE)
- Database: PostgreSQL
- Front-end: React
- Back-end: Ruby on Rails
- Testing: Cypress (FE), RSpec (BE)
- GraphQL: Apollo Client (FE) and GraphQL-Ruby (BE)

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

## Resource Credits

- [Technology logos from Worldvectorlogo.com](http://worldvectorlogo.com/)
