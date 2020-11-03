# Adam Mansell's fight_club Friday Project

### Ruby, HTML, JS & CSS Friday Project for Epicodus, 10/30/2020

## **By Adam Mansell**

## Description
This is a Ruby/Rails API project where we created an api that could handle basic calls.

## Setup

You should have Ruby installed in your machine.

Clone the repository from github:
```
> git clone https://github.com/AdamMansell/fight_club.git
```
Then `cd` into the repository:
```
> cd mario_food
```

Next, install the project dependencies:

```
bundle install
```

Create and populate the database with seed data:

```
> bundle exec rails db:setup
```

Run the Rails server:

```
bundle exec rails s
```

Visit: `http://localhost:3000` to see the application in action!

## End Points:

This application supports the following endpoints:

1. `GET /fighters`
This endpoint returns all the fighters present in the database. The response code is 200 OK.

2. `GET /fighters/:id`
This endpoint returns the fighter object with the matching `:id` param if it finds the fighter obejct with the params[:id] in the database. The response code is 200 OK.
If the fighter is not present in the database, it returns a 404 Not Found response.

3. `POST /fighters`
This endpoint allows the user to create a new fighter. The following parameters has to be sent in the body of the POST request in order to create the fighter successfully:

- fighter[name]
- fighter[age]
- fighter[weight]
- fighter[height]
- fighter[type_of_fighter]

All the attributes has to be present under the `fighter` key in the params so the backend can permit and whitelist the incoming attribute values correctly using Rails strong paramteres. Here is an example screenshot of the POST request:
  <screenshot_image>

 The endpoint returns the fighter object if the POST request is successful and the response code is 200 OK. 
 If the request is not successful, the API returns the error messages in the response body. In this case, the response code is 422 unprocessable entity.

4. `PUT /fighters/:id`
This endpoint allows the user to update a fighter object with the matching `:id` param. The new attribute values can be sent in the body of the `PUT` request. The following params are available to be updated:

- fighter[name]
- fighter[age]
- fighter[weight]
- fighter[height]
- fighter[type_of_fighter]

The user can send one or more param in order to update the fighter.

 The endpoint returns the updated fighter object if the PUT request is successful and the response code is 200 OK. 
 If the request is not successful, the API returns the error messages in the response body. In this case, the response code is 422 unprocessable entity.

5. `DELETE /fighters/:id`
This endpoint allows the user to delete a fighter object with the matching `:id` param.


## Technologies Used
For this exercise I used Ruby, HTML, JS & CSS.

## Legal
_Copyright (c) 2020 Adam Mansell_


_This software is licensed under the MIT license._