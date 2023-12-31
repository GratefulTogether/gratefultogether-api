# Grateful Together API
[![GratefulTogether](https://circleci.com/gh/GratefulTogether/gratefultogether-api.svg?style=shield)](https://app.circleci.com/pipelines/github/GratefulTogether/gratefultogether-api)
## Description: 
This is the Backend API for the [Grateful Together App](https://gratefultogether.vercel.app/). Grateful Together is an application that allows groups of people to keep a central, easy to use, daily gratitude journal. This was a collaborative capstone fullstack project for Mod 4 of Turing School of Software and Design.

### Application Links:
[Grateful Together App](https://gratefultogether.vercel.app/)

[Front End Repo](https://github.com/GratefulTogether/gratefultogether-ui) 

[Back End API (Deployed via Heroku)](https://gratefultogether-api-49ea7cf50543.herokuapp.com/api/v1/wins)

### Tech Stack
- Ruby, Rails, WebSockets, ActiveRecord, PostgreSQL, Action-Cable-Testing, SimpleCov, RSpec, CI/CD with CircleCI

<div align="center">  
    <a href="https://www.postgresql.org/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/postgresql-original-wordmark.svg" alt="PostgreSQL" height="50" /></a>  
    <a href="https://rubyonrails.org/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/rails-original-wordmark.svg" alt="Rails" height="50" /></a>  
    <a href="https://www.ruby-lang.org/en/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/ruby-original-wordmark.svg" alt="CSS3" height="50" /></a>   
    <a href="https://redis.io/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/redis-original-wordmark.svg" alt="CSS3" height="50" /></a>   
    <a href="https://guides.rubyonrails.org/action_cable_overview.html" target="_blank"><img style="margin: 10px" src="https://logodix.com/logo/1825959.png" alt="CSS3" height="50" /></a>   
    <a href="https://circleci.com/" target="_blank"><img style="margin: 10px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Circleci-icon-logo.svg/1200px-Circleci-icon-logo.svg.png" alt="CSS3" height="50" /></a>   
</div>

## Usage

#### Installation Instructions
In order to run this application on your local machine, you'll need to have Ruby version 3.2.2, Rails 7.0.2.2 and PostgreSQL 14. 

1. Clone this repo by executing: 
```
git clone git@github.com:GratefulTogether/gratefultogether-api.git 
```
    
2. Install Gems:
``` 
bundle install 
```

3. Create and seed the development database:
``` 
rails db:{create,migrate,seed} 
```

#### Endpoints
Returns all gratitude entries for today: 
```
GET /api/v1/wins
```
If no entries have yet been recorded, this endpoint will return an empty array, thus:
```
{
  data: []
}
``` 

Returns all gratitude entries for a specific date (add the date in query parameters):
```
GET /api/v1/wins?date=2023-08-31
```
If no entries are recorded for a day, this endpoint will return an empty array, thus:
```
{
  data: []
}
``` 

Post a new gratitude entry: 
```
POST /api/v1/wins
```
If a POST request contains an invalid date or no entry, this will throw an "unprocessable_entity" error.


#### JSON Contract

Request all wins for today: 

GET {{domain}}/api/v1/wins

Example response: 

```
{
    "data": [
        {
            "id": 1,
            "type": "win", 
            "attributes": {
                "user_name": "Neato",
                "entry": "slept well",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 2,
            "type": "win", 
            "attributes": {
                "user_name": "Circe",
                "entry": "love my cats",
                "created_at": "2023-08-24"
            }
        }  
    ]
}
```
---

Request wins for a single date: 

GET {{domain}}/api/v1/wins?date=2023-08-24

Example response: 

```
{
    "data": [
        {
            "id": 1,
            "type": "win", 
            "attributes": {
                "user_name": "Wolfie",
                "entry": "slept well",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 2,
            "type": "win", 
            "attributes": {
                "user_name": "Squeaky",
                "entry": "love my cats",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 3,
            "type": "win", 
            "attributes": {
                "user_name": "Maggie",
                "entry": "smelled some rain",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 4,
            "type": "win", 
            "attributes": {
                "user_name": "Ink-Jet Printer",
                "entry": "grateful for coffee",
                "created_at": "2023-08-24"
            }
        } 
    ]
}
```

---

Request to post a new win

POST {{domain}}/api/v1/wins

JSON Body: 

``` 
{
    "user_id": 1, 
    "message": "I fed the feral cat tuna, and it made me happy this morning."
}
```

Response: 

``` 
{
    "data": {
        "id": "42",
        "type": "win",
        "attributes": {
            "user_name": "Wolfie",
            "entry": "I fed the feral cat tuna, and it made me happy this morning.",
            "created_at": "2023-08-29T19:16:04.580Z"
        }
    }
}
```
### Learning Goals:

Develop a fullstack application in collaboration with a frontend team. Specifically, the backend team was tasked with creating a RESTful API service for the Grateful Together application, implementing at least one new technology. Our team also learned and executed an agile process from planning to development, through production, as well as a CI/CD process using CircleCI. 

New Technologies implemented:
- ActionCable
- WebSockets
- Action-Cable-Testing
- CI/CD with CircleCI

---
### Contributors
Kailey Kaes: <a href="https://github.com/kaileykaes"> Github, <a href="https://linkedin.com/in/kaileykaes"> LinkedIn </a>
    
Jesse Sorman: <a href="https://github.com/jesse193"> Github, <a href="https://www.linkedin.com/in/jesse-sorman/"> LinkedIn </a>
    
K.D. Hubbard: <a href="https://github.com/kdhubb">Github, <a href="https://www.linkedin.com/in/k-d-hubbard/" >LinkedIn </a>
    
Steven Stackhouse: <a href="https://github.com/stackmm">Github, <a href="https://www.linkedin.com/in/steven-stackhouse/" >LinkedIn </a>
  


