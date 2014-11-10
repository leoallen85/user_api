# User API

This is a simple JSON API for creating/reading/deleting a user.

To get the server running on a Mac/Linux PC you should be able to just clone this repository, and then from the parent directory run `bundle` to install all the required Gems. 

To start the server run `rackup` which should then run the server on  http://localhost:9292.

> If you have an issue with Ruby versions you may need to install [rvm](http://rvm.io/) or [rbenv](http://rbenv.org/) as this requires Ruby 2+ to work properly

## Creating a user

This saves a new user to the database.

**Required fields**:

* *username* - This can be any string
* *email* - A valid email address
* *password* - There is no strict validation on passwords, any string is accepted

### Example

**POST */users***

*Request body*:

```
{username: 'test', email: 'test@example.com', password: '123password'}
```

*Response body*:

```
{id: 123, username: 'test', email: 'test@example.com'}
```

## Reading a user's details

This fetches an already saved user from the database.

### Example

**GET */users/123***

*Response body*:

```
{id: 123, username: 'test', email: 'test@example.com'}
```

## Deleting a user

This deletes an already saved user from the database.

> You will need to authenticate in order to do this. Please add to your HTTP request the header **Authorize** with the value of the secret API key.

### Example

**DELETE */users/123***

*Request Header*:

```
Authorize: 12345abc
```

In this instance the server will respond with only a [204 status code](http://httpstatus.es/204) if the user was successfully deleted.
