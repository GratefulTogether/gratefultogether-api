# Grateful Together API


### JSON Contract

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
                "entry": "slept well",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 2,
            "type": "win", 
            "attributes": {
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
                "entry": "slept well",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 2,
            "type": "win", 
            "attributes": {
                "entry": "love my cats",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 3,
            "type": "win", 
            "attributes": {
                "entry": "smelled some rain",
                "created_at": "2023-08-24"
            }
        }, 
        {
            "id": 4,
            "type": "win", 
            "attributes": {
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
    "id": 1, 
    "type": "win",
    "attributes": {
        "user_id": 1,
        "message": "I fed the feral cat tuna, and it made me happy this morning.",     
        "created_at": "2023-08-23", 
        "updated_at": ""
    }
}
```

---

