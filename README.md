
# Ecommerce-GroupProject

## Technologies

**Client:** JQuery, HTML, CSS, JS, Ajax, Bootstrap, SMTP, Oauth2 Google
<br>
**Server:** Java Servlet, Tomcat 8.5, Lombok, SQL Server




## API Reference

#### Get item

```http
  GET /login-google
```
```
The token returned from Google
```
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `access_token` | `string` | **Required**. Your access_token|
| `expires_in` | `string` | **Required**. Your access_token expires_in |
| `id_token` | `string` | **Required**. Your id_token|
| `token_type` | `string` | **Required**. Your token_type|

```
The account information returned from Google
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `id` | `string` | Google account id|
| `email` | `string` | Google account email |
| `verified_email` | `string` | Google account verified_email|
| `name` | `string` | Google account name|
| `given_name` | `string` | Google account given_name|
| `family_name` | `string` | Google account family_name|
| `picture` | `string` | Google account picture|










## Features

- CRUD data
- Admin Dashboard
- Seller Dashboard
- Online shopping
## Authors

- [@halleluujahh](https://github.com/halleluujahh)

