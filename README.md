# Grateful Together API

## Abstract: 
This is the Backend API for the [Grateful Together App](https://www.FIX-THIS.com). Grateful Together is an application that allows groups of people to keep a central, easy to use, daily gratitude journal.

### Preview of App:
Live Deployment link
[Frontend Repo](https://github.com/GratefulTogether/gratefultogether-ui) 

Add GIF here

### Context:
Collaborative capstone fullstack project for Mod 4 of Turing School of Software and Design.

### Contributors
<table>
  <tr>
    <td> Kailey Kaes: <a href="https://github.com/kaileykaes">Github</td>
    <td> Jesse Sorman: <a href="https://github.com/jesse193">Github</td>
    <td> K.D. Hubbard: <a href="https://github.com/kdhubb">Github</td>
    <td> Steven Stackhouse: <a href="https://github.com/stackmm">Github</td>
  </tr>
</table>

### Learning Goals:

Develop a fullstack application in collaboration with a frontend team. Specifically, the backend team was tasked with creating a RESTful API service for the Grateful Together application, implementing at least one new technology. Our team also learned and executed an agile process from planning to development, through production, as well as a CI/CD process using CircleCI. 

New Technologies implemented:
- ActionCable
- WebSockets
- Action-Cable-Testing
- CI/CD with CircleCI

### Tech Stack
- Ruby, Rails, WebSockets, ActiveRecord, PostgreSQL, Action-Cable-Testing, SimpleCov, RSpec, CI/CD with CircleCI

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

Returns all gratitude entries for a specific date (add the date in query parameters):
```
GET /api/v1/wins?date=2023-08-31
```

Post a new gratitude entry: 
```
POST /api/v1/wins
```

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


