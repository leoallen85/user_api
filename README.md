# User API

This is a simple JSON API for creating/reading/deleting a user.

## Requests

### Creating a user

This saves a new user to the database

**Required fields**:

* *username* - This can be any string
* *email* - A valid email address
* *password* - There is no strict validation on passwords, any string is accepted

#### Example

URI: **POST /users**

```json
{username: 'test', email: 'test@example.com', password: '123password'}
```

**Response**:

```json
{id: 123, username: 'test', email: 'test@example.com'}
```

### Reading a user's details

This fetches an already saved user from the database

#### Example

URI: **GET /users/123**

**Response**:

```json
{id: 123, username: 'test', email: 'test@example.com'}

### Deleting a user

This deletes an already saved user from the database.

> You will need to authenticate in order to do this. Please add to your HTTP request the header **Authorize** with the value of the secret API key

#### Example

URI: **DELETE /users/123**
Request Header: **Authorize: 12345abc**

In this instance if successful the server will respond only with a [204 code](http://httpstatus.es/204) to indicate that the user was successfully deleted