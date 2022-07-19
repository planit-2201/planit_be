# README

# PlanIt Back-End

## Table of Contents

- [Deployed App](#deployed-app)
- [Local Deployment](#local-deployment)
- [Dev Team](#dev-team)
- [Description](#description)
- [Rock & Pebble Feature](#rock--pebble-feature)
- [Agile Development](#agile-development)
- [Technologies & Architectures](#technologies--architecture)
- [React & Redux Tutorial](#react--redux-tutorial)
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

This repo contains the Paired 2.0 Back-end, a GraphQL API built with Ruby on Rails and PostgreSQL. It provides data, logic, and other services to a React/Redux Front-end ([paired-fe](https://github.com/hillstew/paired-fe)), and communicates with a Flask micro-service which handles SMS text notifications ([paired-sms](https://github.com/msimon42/paired-sms)).

Together, these micro-services facilitate paired programming and peer mentoring between [Turing](http://turing.io) students throughout their seven-month immersive program. Students later in the program can create available booking slots, and students earlier in the program can browse those and book paired sessions.

Paired 2.0 was built by a team of students in Turing's Back-End Engineering program. It adds SMS and email notifications of bookings and a user statistics dashboard to the [original Paired app](http://paired.tech) ([front-end repo](https://github.com/hillstew/paired-fe), [back-end repo](https://github.com/dForDeveloper/paired-api)) which was built by Front-end students in April of 2019. They graciously allowed contributions to the app and were helpful throughout this process.

## Rock & Pebble Feature

The Rock & Pebble feature adds the ability for Paired users to offer to be peer mentors, search for and request peer mentors, and manage their mentors/mentees. Building on the previous 2.0 work, it sends descriptive email notifications throughout the process.  By adding this feature we hope to support the grassroots tradition at Turing of upper-module students ("rocks") being partnered with lower-module students ("pebbles") to support their journey.

The Rock & Pebble feature was developed over the course of 2020 by a group of 1909 back-end and front-end graduates, some from the Paired 2.0 dev team and some new contributors. The development took place on forks of the BE and FE repos, which are now archived but can be found [here](https://github.com/PairedStaging/paired-be) and [here](https://github.com/PairedStaging/paired-fe) respectively for future reference.

## Agile Development

Paired 2.0 was developed over the course of 9 days using accelerated agile practices. After [an initial proposal was written](https://gist.github.com/DanielEFrampton/bb6c6ec2cfa0d466642adf0811d85e16) by the project lead, the team collaboratively participated in an "inception" process. After writing [problem and solution statements](https://gist.github.com/DanielEFrampton/fdc8653e042b7f3d7a6feca8767609eb), the team "brain-dumped" all their feature proposals then went through a feature prioritization process in order to determine which would be part of the "minimum viable product" (MVP).

Soon thereafter the team had [a "DTR" meeting](https://gist.github.com/DanielEFrampton/78bc2e980c51af7a98ff3aa422ca8902) to establish goals, communication plans, project management conventions, and more. It was agreed upon that the team would use a Kanban system for project management using [Github Projects](https://github.com/DanielEFrampton/paired-be/projects/1), and have daily stand-up meetings and weekly retrospective meetings. The team met with a project manager every three days for check-ins and communicated with her regularly via Slack.

## Technologies & Architecture

- Hosting: Firebase (FE) and Heroku (BE)
- Database: PostgreSQL
- Front-end: React & Redux
- Back-end: Ruby on Rails
- Testing: Jest (FE), RSpec (BE)
- GraphQL: Apollo Client (FE) and GraphQL-Ruby (BE)
- Background Workers: Sidekiq and Redis

## React & Redux Tutorial

As a team of back-end engineers, stepping into a JavaScript-heavy tech stack was an incredible and bewildering learning experience. To help share that learning with our fellow students in the back-end program, we wrote this tutorial: [Explain It Like I'm a Back-ender: React and Redux](react_redux_guide.md).

## Testing & Performance

![Skylight performance dashboard](https://user-images.githubusercontent.com/40702808/75517976-d8f5c100-59f7-11ea-8304-c67cba74546d.png)

At date of project completion, the Paired 2.0 back-end service has 98% test coverage and all tests passing. Server performance and load times are monitored using Skylight, and at time of writing responses average 37 ms.

## PostgreSQL Schema

| Users | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| name | String |  |
| program | String | |
| pronouns | String | |
| mod | Integer | |
| slack | String | |
| email | String | |
| phone_number | String | |
| firebase_id | String | OAuth Token |

| Pairings | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| pairer_id | Integer | User Foreign Key|
| pairee_id | Integer | User Foreign Key|
| date | String | |
| time | String | |
| notes | String | |

| Skills | Data Type | Keys |
| ----------- | ----------- | ----------- |
| Id | ID | Primary Key |
| name | String | |
| user_id | Integer | User Foreign Key

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

- [Architecture chart created with Lucidchart.com](http://www.lucidchart.com)
- [Technology logos from Worldvectorlogo.com](http://worldvectorlogo.com/)
