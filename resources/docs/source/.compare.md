---
title: API Reference

language_tabs:
- bash
- javascript

includes:

search: true

toc_footers:
- <a href='http://github.com/mpociot/documentarian'>Documentation Powered by Documentarian</a>
---
<!-- START_INFO -->
# Info

Welcome to the generated API reference.
[Get Postman Collection](http://localhost/docs/collection.json)

<!-- END_INFO -->

#Cabang SDM


API untuk manajemen SDM di Cabang
<!-- START_d0edd76393463d1953c3bb91dac50fc4 -->
## api/slave/user/register
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/user/register" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/user/register"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/user/register`


<!-- END_d0edd76393463d1953c3bb91dac50fc4 -->

<!-- START_34b0bdbf30e0cdcd3e1e9564bbccebf9 -->
## api/slave/user/update/{userid}
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/user/update/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/user/update/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/user/update/{userid}`


<!-- END_34b0bdbf30e0cdcd3e1e9564bbccebf9 -->

<!-- START_50ae3876adda9e76137044b48c108ae8 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/user/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/user/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/user/{userid}`


<!-- END_50ae3876adda9e76137044b48c108ae8 -->

#general


<!-- START_9dacb83a000873f5644fac30130aa46f -->
## The action to show widget output via ajax.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/arrilot/load-widget" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/arrilot/load-widget"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET arrilot/load-widget`


<!-- END_9dacb83a000873f5644fac30130aa46f -->

<!-- START_4dfafe7f87ec132be3c8990dd1fa9078 -->
## Return an empty response simply to trigger the storage of the CSRF cookie in the browser.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/sanctum/csrf-cookie" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/sanctum/csrf-cookie"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET sanctum/csrf-cookie`


<!-- END_4dfafe7f87ec132be3c8990dd1fa9078 -->

<!-- START_0c068b4037fb2e47e71bd44bd36e3e2a -->
## Authorize a client to access the user&#039;s account.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/oauth/authorize" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/authorize"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET oauth/authorize`


<!-- END_0c068b4037fb2e47e71bd44bd36e3e2a -->

<!-- START_e48cc6a0b45dd21b7076ab2c03908687 -->
## Approve the authorization request.

> Example request:

```bash
curl -X POST \
    "http://localhost/oauth/authorize" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/authorize"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/authorize`


<!-- END_e48cc6a0b45dd21b7076ab2c03908687 -->

<!-- START_de5d7581ef1275fce2a229b6b6eaad9c -->
## Deny the authorization request.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/oauth/authorize" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/authorize"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/authorize`


<!-- END_de5d7581ef1275fce2a229b6b6eaad9c -->

<!-- START_a09d20357336aa979ecd8e3972ac9168 -->
## Authorize a client to access the user&#039;s account.

> Example request:

```bash
curl -X POST \
    "http://localhost/oauth/token" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/token"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/token`


<!-- END_a09d20357336aa979ecd8e3972ac9168 -->

<!-- START_d6a56149547e03307199e39e03e12d1c -->
## Get all of the authorized tokens for the authenticated user.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/oauth/tokens" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/tokens"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET oauth/tokens`


<!-- END_d6a56149547e03307199e39e03e12d1c -->

<!-- START_a9a802c25737cca5324125e5f60b72a5 -->
## Delete the given token.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/oauth/tokens/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/tokens/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/tokens/{token_id}`


<!-- END_a9a802c25737cca5324125e5f60b72a5 -->

<!-- START_abe905e69f5d002aa7d26f433676d623 -->
## Get a fresh transient token cookie for the authenticated user.

> Example request:

```bash
curl -X POST \
    "http://localhost/oauth/token/refresh" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/token/refresh"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/token/refresh`


<!-- END_abe905e69f5d002aa7d26f433676d623 -->

<!-- START_babcfe12d87b8708f5985e9d39ba8f2c -->
## Get all of the clients for the authenticated user.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/oauth/clients" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/clients"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET oauth/clients`


<!-- END_babcfe12d87b8708f5985e9d39ba8f2c -->

<!-- START_9eabf8d6e4ab449c24c503fcb42fba82 -->
## Store a new client.

> Example request:

```bash
curl -X POST \
    "http://localhost/oauth/clients" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/clients"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/clients`


<!-- END_9eabf8d6e4ab449c24c503fcb42fba82 -->

<!-- START_784aec390a455073fc7464335c1defa1 -->
## Update the given client.

> Example request:

```bash
curl -X PUT \
    "http://localhost/oauth/clients/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/clients/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT oauth/clients/{client_id}`


<!-- END_784aec390a455073fc7464335c1defa1 -->

<!-- START_1f65a511dd86ba0541d7ba13ca57e364 -->
## Delete the given client.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/oauth/clients/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/clients/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/clients/{client_id}`


<!-- END_1f65a511dd86ba0541d7ba13ca57e364 -->

<!-- START_9e281bd3a1eb1d9eb63190c8effb607c -->
## Get all of the available scopes for the application.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/oauth/scopes" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/scopes"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET oauth/scopes`


<!-- END_9e281bd3a1eb1d9eb63190c8effb607c -->

<!-- START_9b2a7699ce6214a79e0fd8107f8b1c9e -->
## Get all of the personal access tokens for the authenticated user.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/oauth/personal-access-tokens" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/personal-access-tokens"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET oauth/personal-access-tokens`


<!-- END_9b2a7699ce6214a79e0fd8107f8b1c9e -->

<!-- START_a8dd9c0a5583742e671711f9bb3ee406 -->
## Create a new personal access token for the user.

> Example request:

```bash
curl -X POST \
    "http://localhost/oauth/personal-access-tokens" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/personal-access-tokens"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/personal-access-tokens`


<!-- END_a8dd9c0a5583742e671711f9bb3ee406 -->

<!-- START_bae65df80fd9d72a01439241a9ea20d0 -->
## Delete the given token.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/oauth/personal-access-tokens/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/oauth/personal-access-tokens/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/personal-access-tokens/{token_id}`


<!-- END_bae65df80fd9d72a01439241a9ea20d0 -->

<!-- START_03a76d7b7a89853a08696bfe71bbbba7 -->
## admin/login
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/login" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/login"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
null
```

### HTTP Request
`GET admin/login`


<!-- END_03a76d7b7a89853a08696bfe71bbbba7 -->

<!-- START_fe5fe3a14f04e5648848f1a59ea3da82 -->
## admin/login
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/login" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/login"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/login`


<!-- END_fe5fe3a14f04e5648848f1a59ea3da82 -->

<!-- START_e40bc60a458a9740730202aaec04f818 -->
## admin
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin`


<!-- END_e40bc60a458a9740730202aaec04f818 -->

<!-- START_d31bd86158f6a5a775c92ea5b5554af9 -->
## admin/logout
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/logout" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/logout"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/logout`


<!-- END_d31bd86158f6a5a775c92ea5b5554af9 -->

<!-- START_576736063b80c937d4f6d7cf23dc713c -->
## admin/upload
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/upload" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/upload"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/upload`


<!-- END_576736063b80c937d4f6d7cf23dc713c -->

<!-- START_2b573e6e1d43c73d7cca65562a4e5b27 -->
## admin/profile
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/profile" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/profile"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/profile`


<!-- END_2b573e6e1d43c73d7cca65562a4e5b27 -->

<!-- START_e63b2f0bdbfc13b04a6e95ae794396e1 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users/order`


<!-- END_e63b2f0bdbfc13b04a6e95ae794396e1 -->

<!-- START_3a1e6967e6fc6e75b206a116be6990c3 -->
## admin/users/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/users/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/users/action`


<!-- END_3a1e6967e6fc6e75b206a116be6990c3 -->

<!-- START_565aba9d8c16a122c48e9e43bfd74d39 -->
## admin/users/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/users/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/users/order`


<!-- END_565aba9d8c16a122c48e9e43bfd74d39 -->

<!-- START_75a91fccfa4b95106e7a8d363cebf5fa -->
## admin/users/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users/{id}/restore`


<!-- END_75a91fccfa4b95106e7a8d363cebf5fa -->

<!-- START_581a493db08a1fee3478950d342176b3 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users/relation`


<!-- END_581a493db08a1fee3478950d342176b3 -->

<!-- START_966aef287a2e493cadea71f52b022ceb -->
## admin/users/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/users/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/users/remove`


<!-- END_966aef287a2e493cadea71f52b022ceb -->

<!-- START_7614490a3eef5fbcba402080d0369e6a -->
## admin/users
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users`


<!-- END_7614490a3eef5fbcba402080d0369e6a -->

<!-- START_5480f74e868e50a30ac924242a423503 -->
## admin/users/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users/create`


<!-- END_5480f74e868e50a30ac924242a423503 -->

<!-- START_84cdb3581c8df106c62233f1ebb35d8b -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/users" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/users`


<!-- END_84cdb3581c8df106c62233f1ebb35d8b -->

<!-- START_07a2c34e3cc7acee537fdaad0c2c19d9 -->
## admin/users/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users/{id}`


<!-- END_07a2c34e3cc7acee537fdaad0c2c19d9 -->

<!-- START_e23c0a400f599b52984393daa4e11454 -->
## admin/users/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/users/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/users/{id}/edit`


<!-- END_e23c0a400f599b52984393daa4e11454 -->

<!-- START_0649f27323a52bd8dbf471efe62f14da -->
## admin/users/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/users/{id}`

`PATCH admin/users/{id}`


<!-- END_0649f27323a52bd8dbf471efe62f14da -->

<!-- START_ff0c8890a029256daf70dac0fed732ec -->
## admin/users/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/users/{id}`


<!-- END_ff0c8890a029256daf70dac0fed732ec -->

<!-- START_d33d20eb4b2146eabfbfc25696c0f1bc -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/order`


<!-- END_d33d20eb4b2146eabfbfc25696c0f1bc -->

<!-- START_5d01b72ada2ff1d9d4b29d15a504d55f -->
## admin/menus/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/menus/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/menus/action`


<!-- END_5d01b72ada2ff1d9d4b29d15a504d55f -->

<!-- START_67cd26259e818cdf5671de42660cf592 -->
## admin/menus/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/menus/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/menus/order`


<!-- END_67cd26259e818cdf5671de42660cf592 -->

<!-- START_69d1eed77c0cfb78139c587c1b8ee8d1 -->
## admin/menus/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/{id}/restore`


<!-- END_69d1eed77c0cfb78139c587c1b8ee8d1 -->

<!-- START_d041193c8cda3598ee88c01cb4eb7d6f -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/relation`


<!-- END_d041193c8cda3598ee88c01cb4eb7d6f -->

<!-- START_ab85cc3a7ac21476439a36e859a12321 -->
## admin/menus/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/menus/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/menus/remove`


<!-- END_ab85cc3a7ac21476439a36e859a12321 -->

<!-- START_7a00d6c45032c03f4ae7d3beec00bb0e -->
## admin/menus
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus`


<!-- END_7a00d6c45032c03f4ae7d3beec00bb0e -->

<!-- START_e1fe606f36d5e0b828b7aa722d401ef1 -->
## admin/menus/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/create`


<!-- END_e1fe606f36d5e0b828b7aa722d401ef1 -->

<!-- START_3ed1f4443877ce5c80a9f8ffdaa4e19c -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/menus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/menus`


<!-- END_3ed1f4443877ce5c80a9f8ffdaa4e19c -->

<!-- START_a97b68d9a3f29d1334f0de6f90398afa -->
## admin/menus/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/{id}`


<!-- END_a97b68d9a3f29d1334f0de6f90398afa -->

<!-- START_b745e1012d2f428285f538392b1dc5a9 -->
## admin/menus/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/{id}/edit`


<!-- END_b745e1012d2f428285f538392b1dc5a9 -->

<!-- START_8e628da752bf59497c7d35988c0facf4 -->
## admin/menus/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/menus/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/menus/{id}`

`PATCH admin/menus/{id}`


<!-- END_8e628da752bf59497c7d35988c0facf4 -->

<!-- START_f0f3c2e9719e8f93368d070159d0da8e -->
## admin/menus/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/menus/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/menus/{id}`


<!-- END_f0f3c2e9719e8f93368d070159d0da8e -->

<!-- START_7028d468d28c67da726de2b6abbf0251 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles/order`


<!-- END_7028d468d28c67da726de2b6abbf0251 -->

<!-- START_a842e0d52349702c38488c7bd5eef6de -->
## admin/roles/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/roles/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/roles/action`


<!-- END_a842e0d52349702c38488c7bd5eef6de -->

<!-- START_11400608993f2d581f446024f1456f47 -->
## admin/roles/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/roles/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/roles/order`


<!-- END_11400608993f2d581f446024f1456f47 -->

<!-- START_4fda3e50934366eb4620d3d26faa6686 -->
## admin/roles/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles/{id}/restore`


<!-- END_4fda3e50934366eb4620d3d26faa6686 -->

<!-- START_fd6ce61c53bbc29b087e7e6bbb5cffa5 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles/relation`


<!-- END_fd6ce61c53bbc29b087e7e6bbb5cffa5 -->

<!-- START_1b4990c9ddbcbb4462d6ad2ec61e6042 -->
## admin/roles/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/roles/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/roles/remove`


<!-- END_1b4990c9ddbcbb4462d6ad2ec61e6042 -->

<!-- START_879622c0ac94a4a0f4d364d46a42bc7e -->
## admin/roles
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles`


<!-- END_879622c0ac94a4a0f4d364d46a42bc7e -->

<!-- START_d29246d3a43660bb5210bf9aff91c85a -->
## admin/roles/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles/create`


<!-- END_d29246d3a43660bb5210bf9aff91c85a -->

<!-- START_9117e54780cf55c5071dfb91b33aaef6 -->
## admin/roles
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/roles" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/roles`


<!-- END_9117e54780cf55c5071dfb91b33aaef6 -->

<!-- START_3b265543f99369ce1b886ee0b82b0e27 -->
## admin/roles/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles/{id}`


<!-- END_3b265543f99369ce1b886ee0b82b0e27 -->

<!-- START_f875aac60c5c2c67509c4dd8539e30e3 -->
## admin/roles/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/roles/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/roles/{id}/edit`


<!-- END_f875aac60c5c2c67509c4dd8539e30e3 -->

<!-- START_f26dde20558dc643e224cc43dece4226 -->
## admin/roles/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/roles/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/roles/{id}`

`PATCH admin/roles/{id}`


<!-- END_f26dde20558dc643e224cc43dece4226 -->

<!-- START_fe440d0352457bb6a8a128df35351378 -->
## admin/roles/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/roles/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/roles/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/roles/{id}`


<!-- END_fe440d0352457bb6a8a128df35351378 -->

<!-- START_f6fe93a819260240ceb28a36fb903412 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories/order`


<!-- END_f6fe93a819260240ceb28a36fb903412 -->

<!-- START_cd3fa62a78fd13928be34bc6ad94228d -->
## admin/categories/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/categories/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/categories/action`


<!-- END_cd3fa62a78fd13928be34bc6ad94228d -->

<!-- START_4cc09f271de71024b055b45b283d916b -->
## admin/categories/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/categories/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/categories/order`


<!-- END_4cc09f271de71024b055b45b283d916b -->

<!-- START_38c925476b5efdcfa882167c1ed89903 -->
## admin/categories/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories/{id}/restore`


<!-- END_38c925476b5efdcfa882167c1ed89903 -->

<!-- START_19f7514a18df9d0339724e46df712a44 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories/relation`


<!-- END_19f7514a18df9d0339724e46df712a44 -->

<!-- START_37017a97de77e630e2870c5cad41a06c -->
## admin/categories/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/categories/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/categories/remove`


<!-- END_37017a97de77e630e2870c5cad41a06c -->

<!-- START_9ad08f5d810e5c0f73cfd7c7179bcb08 -->
## admin/categories
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories`


<!-- END_9ad08f5d810e5c0f73cfd7c7179bcb08 -->

<!-- START_ce2c6d94fb61a4bb262563b97e5f7aa3 -->
## admin/categories/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories/create`


<!-- END_ce2c6d94fb61a4bb262563b97e5f7aa3 -->

<!-- START_1c760aaf6fa8dfeb072fd2bcda7b6502 -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/categories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/categories`


<!-- END_1c760aaf6fa8dfeb072fd2bcda7b6502 -->

<!-- START_0b809d5eb7c0a44ab050044daed48a08 -->
## admin/categories/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories/{id}`


<!-- END_0b809d5eb7c0a44ab050044daed48a08 -->

<!-- START_478100670bef0a10c62d1d4a2dfe9523 -->
## admin/categories/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/categories/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/categories/{id}/edit`


<!-- END_478100670bef0a10c62d1d4a2dfe9523 -->

<!-- START_564341106d7e7249e03c9d6aa1a033ed -->
## admin/categories/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/categories/{id}`

`PATCH admin/categories/{id}`


<!-- END_564341106d7e7249e03c9d6aa1a033ed -->

<!-- START_3b11481f809f13f64d566b9586d928df -->
## admin/categories/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/categories/{id}`


<!-- END_3b11481f809f13f64d566b9586d928df -->

<!-- START_806e79f28f4e79d82482745b96823bcb -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts/order`


<!-- END_806e79f28f4e79d82482745b96823bcb -->

<!-- START_7272370bfb7cf903ff8cb5cb3c48006b -->
## admin/posts/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/posts/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/posts/action`


<!-- END_7272370bfb7cf903ff8cb5cb3c48006b -->

<!-- START_55a12aecb37d36c12d9c4ef402409a49 -->
## admin/posts/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/posts/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/posts/order`


<!-- END_55a12aecb37d36c12d9c4ef402409a49 -->

<!-- START_b49dc999e16bd5893e8166904186c1d6 -->
## admin/posts/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts/{id}/restore`


<!-- END_b49dc999e16bd5893e8166904186c1d6 -->

<!-- START_7ee0590d04a6bb82d83da94a45dca5ad -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts/relation`


<!-- END_7ee0590d04a6bb82d83da94a45dca5ad -->

<!-- START_b7506c5f241a4b12efba78709947cbff -->
## admin/posts/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/posts/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/posts/remove`


<!-- END_b7506c5f241a4b12efba78709947cbff -->

<!-- START_a8ef477b5c348c0f4b24b4f9b3bc90ad -->
## admin/posts
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts`


<!-- END_a8ef477b5c348c0f4b24b4f9b3bc90ad -->

<!-- START_2e37c90d67a96143863923ff5859c905 -->
## admin/posts/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts/create`


<!-- END_2e37c90d67a96143863923ff5859c905 -->

<!-- START_a67af5ec5245a6f896bb7a6169c39d6b -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/posts" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/posts`


<!-- END_a67af5ec5245a6f896bb7a6169c39d6b -->

<!-- START_b141df4ed559deb94966037436088ebb -->
## admin/posts/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts/{id}`


<!-- END_b141df4ed559deb94966037436088ebb -->

<!-- START_0591fea2405e3fa8918e8fd626c0c450 -->
## admin/posts/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/posts/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/posts/{id}/edit`


<!-- END_0591fea2405e3fa8918e8fd626c0c450 -->

<!-- START_e3c2f4c5c26610041a0a68a56d115961 -->
## admin/posts/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/posts/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/posts/{id}`

`PATCH admin/posts/{id}`


<!-- END_e3c2f4c5c26610041a0a68a56d115961 -->

<!-- START_2ee30c3ced66d90419deffc67aec4d9a -->
## admin/posts/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/posts/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/posts/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/posts/{id}`


<!-- END_2ee30c3ced66d90419deffc67aec4d9a -->

<!-- START_77d950f312fbca2be890889021efc719 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages/order`


<!-- END_77d950f312fbca2be890889021efc719 -->

<!-- START_989b2145f1ae3f6380707e06c954d67b -->
## admin/pages/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/pages/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/pages/action`


<!-- END_989b2145f1ae3f6380707e06c954d67b -->

<!-- START_053a328e886cb9830518007350d79514 -->
## admin/pages/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/pages/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/pages/order`


<!-- END_053a328e886cb9830518007350d79514 -->

<!-- START_1eb89aa90d3347fd0ad686cdc4f94184 -->
## admin/pages/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages/{id}/restore`


<!-- END_1eb89aa90d3347fd0ad686cdc4f94184 -->

<!-- START_76330a12ad5c9cb20251863e2c4c3a2b -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages/relation`


<!-- END_76330a12ad5c9cb20251863e2c4c3a2b -->

<!-- START_a773beac91e2e51193479b36a7fb71ba -->
## admin/pages/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/pages/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/pages/remove`


<!-- END_a773beac91e2e51193479b36a7fb71ba -->

<!-- START_2b8d58f02e5e057ffba2714632ecd581 -->
## admin/pages
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages`


<!-- END_2b8d58f02e5e057ffba2714632ecd581 -->

<!-- START_921e2da8f946b8f15f0970be0f47a7ef -->
## admin/pages/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages/create`


<!-- END_921e2da8f946b8f15f0970be0f47a7ef -->

<!-- START_0ca67d533bf3350a25d26582ab610e2a -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/pages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/pages`


<!-- END_0ca67d533bf3350a25d26582ab610e2a -->

<!-- START_9aef9a0e869193c949a58b61801916ab -->
## admin/pages/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages/{id}`


<!-- END_9aef9a0e869193c949a58b61801916ab -->

<!-- START_15588927eb502056711d51f9e27f37db -->
## admin/pages/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/pages/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/pages/{id}/edit`


<!-- END_15588927eb502056711d51f9e27f37db -->

<!-- START_acf11c8b15e04d0669d7644e6e1eb46c -->
## admin/pages/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/pages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/pages/{id}`

`PATCH admin/pages/{id}`


<!-- END_acf11c8b15e04d0669d7644e6e1eb46c -->

<!-- START_904f242f7e727f39a66c41ab4ec67ee6 -->
## admin/pages/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/pages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/pages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/pages/{id}`


<!-- END_904f242f7e727f39a66c41ab4ec67ee6 -->

<!-- START_11ea58afa245165d2c589f51c7464092 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops/order`


<!-- END_11ea58afa245165d2c589f51c7464092 -->

<!-- START_a83de6ba3b8be9eeeb2a6d3370decc3d -->
## admin/shops/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/shops/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/shops/action`


<!-- END_a83de6ba3b8be9eeeb2a6d3370decc3d -->

<!-- START_f16dcae6e32e4d4c465bfe08e55d2657 -->
## admin/shops/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/shops/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/shops/order`


<!-- END_f16dcae6e32e4d4c465bfe08e55d2657 -->

<!-- START_fe5982833b3999b4cfac1a4af5ababf5 -->
## admin/shops/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops/{id}/restore`


<!-- END_fe5982833b3999b4cfac1a4af5ababf5 -->

<!-- START_3f9ded7bdd377f72876c303fe8440fb0 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops/relation`


<!-- END_3f9ded7bdd377f72876c303fe8440fb0 -->

<!-- START_dfdf6f1febf4c611b97e7dc751352fdc -->
## admin/shops/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/shops/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/shops/remove`


<!-- END_dfdf6f1febf4c611b97e7dc751352fdc -->

<!-- START_f3b9c1427536d1b69d47aebf1384d27d -->
## admin/shops
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops`


<!-- END_f3b9c1427536d1b69d47aebf1384d27d -->

<!-- START_331a6a17fe226bab492dc002fc302a86 -->
## admin/shops/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops/create`


<!-- END_331a6a17fe226bab492dc002fc302a86 -->

<!-- START_198b2350615283b4acaca1e9c9e8b32b -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/shops" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/shops`


<!-- END_198b2350615283b4acaca1e9c9e8b32b -->

<!-- START_ba18b79c9a04155201993014c267d5db -->
## admin/shops/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops/{id}`


<!-- END_ba18b79c9a04155201993014c267d5db -->

<!-- START_f69d7aaf8d9e237af0362b56cd4ab022 -->
## admin/shops/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/shops/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/shops/{id}/edit`


<!-- END_f69d7aaf8d9e237af0362b56cd4ab022 -->

<!-- START_c765d270ff8a0316edab4c8f33f1d056 -->
## admin/shops/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/shops/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/shops/{id}`

`PATCH admin/shops/{id}`


<!-- END_c765d270ff8a0316edab4c8f33f1d056 -->

<!-- START_e8df90f0171a7b101d6c540641c325c5 -->
## admin/shops/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/shops/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/shops/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/shops/{id}`


<!-- END_e8df90f0171a7b101d6c540641c325c5 -->

<!-- START_06967865f9ebf8db1733f82cacec7fd7 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages/order`


<!-- END_06967865f9ebf8db1733f82cacec7fd7 -->

<!-- START_0eb07a688930f922c36b57223ea26323 -->
## admin/packages/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/packages/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/packages/action`


<!-- END_0eb07a688930f922c36b57223ea26323 -->

<!-- START_c89718bcf99f566e2858857edfa9efff -->
## admin/packages/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/packages/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/packages/order`


<!-- END_c89718bcf99f566e2858857edfa9efff -->

<!-- START_b4af3b9f99df44cc3f531cde939a54b2 -->
## admin/packages/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages/{id}/restore`


<!-- END_b4af3b9f99df44cc3f531cde939a54b2 -->

<!-- START_b9057d775c2fb7a7fcc273024b97dfe1 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages/relation`


<!-- END_b9057d775c2fb7a7fcc273024b97dfe1 -->

<!-- START_7caa5c1bb65d4a48c5d3987229bff7ff -->
## admin/packages/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/packages/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/packages/remove`


<!-- END_7caa5c1bb65d4a48c5d3987229bff7ff -->

<!-- START_a139a66b1a1c59ce3ef1e5b51ca67391 -->
## admin/packages
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages`


<!-- END_a139a66b1a1c59ce3ef1e5b51ca67391 -->

<!-- START_ca7f3ed3f0f7d4c496a80ebf0bd00d94 -->
## admin/packages/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages/create`


<!-- END_ca7f3ed3f0f7d4c496a80ebf0bd00d94 -->

<!-- START_f2848f56301279e4ca244cd17660699b -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/packages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/packages`


<!-- END_f2848f56301279e4ca244cd17660699b -->

<!-- START_e281c116dbeb6edcd42327a5621561ae -->
## admin/packages/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages/{id}`


<!-- END_e281c116dbeb6edcd42327a5621561ae -->

<!-- START_963538cbe3c5e96ef0e5faf58283686d -->
## admin/packages/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/packages/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/packages/{id}/edit`


<!-- END_963538cbe3c5e96ef0e5faf58283686d -->

<!-- START_e371e95b4d70f25f8ce00ffac6e7377b -->
## admin/packages/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/packages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/packages/{id}`

`PATCH admin/packages/{id}`


<!-- END_e371e95b4d70f25f8ce00ffac6e7377b -->

<!-- START_decb0089527d44f5f9b8cedad8ec2b4a -->
## admin/packages/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/packages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/packages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/packages/{id}`


<!-- END_decb0089527d44f5f9b8cedad8ec2b4a -->

<!-- START_3fe0c08972a35f84fb58d7c49467beac -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users/order`


<!-- END_3fe0c08972a35f84fb58d7c49467beac -->

<!-- START_3bfecacaa096e0e68d89480f3ea9cc3e -->
## admin/package-users/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/package-users/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/package-users/action`


<!-- END_3bfecacaa096e0e68d89480f3ea9cc3e -->

<!-- START_1aea36956fbd24041fa33976f2356b64 -->
## admin/package-users/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/package-users/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/package-users/order`


<!-- END_1aea36956fbd24041fa33976f2356b64 -->

<!-- START_3c011451eb0fa529de4b14974c681bc4 -->
## admin/package-users/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users/{id}/restore`


<!-- END_3c011451eb0fa529de4b14974c681bc4 -->

<!-- START_69d4cacaa73f88e5f9ade0810baac002 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users/relation`


<!-- END_69d4cacaa73f88e5f9ade0810baac002 -->

<!-- START_db78ab5861a168ce85bd73ab1092a1b0 -->
## admin/package-users/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/package-users/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/package-users/remove`


<!-- END_db78ab5861a168ce85bd73ab1092a1b0 -->

<!-- START_acfb65b575459018f06ff16b53d44ce6 -->
## admin/package-users
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users`


<!-- END_acfb65b575459018f06ff16b53d44ce6 -->

<!-- START_4d1962a8b69b8db9af21278dbbf4ca67 -->
## admin/package-users/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users/create`


<!-- END_4d1962a8b69b8db9af21278dbbf4ca67 -->

<!-- START_4cbef59a9d8c1ff81015e62173d35183 -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/package-users" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/package-users`


<!-- END_4cbef59a9d8c1ff81015e62173d35183 -->

<!-- START_d80008577c77df81410d16b011bf6d35 -->
## admin/package-users/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users/{id}`


<!-- END_d80008577c77df81410d16b011bf6d35 -->

<!-- START_604a09f39bc709ab4f5bf27a1e000371 -->
## admin/package-users/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/package-users/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/package-users/{id}/edit`


<!-- END_604a09f39bc709ab4f5bf27a1e000371 -->

<!-- START_c4cc7c608a766a9c6cba44db002de016 -->
## admin/package-users/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/package-users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/package-users/{id}`

`PATCH admin/package-users/{id}`


<!-- END_c4cc7c608a766a9c6cba44db002de016 -->

<!-- START_75f097e92ee2e2b4a4594c0881798b77 -->
## admin/package-users/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/package-users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/package-users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/package-users/{id}`


<!-- END_75f097e92ee2e2b4a4594c0881798b77 -->

<!-- START_bdbc169c35fbe60afa463007d611ec05 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches/order`


<!-- END_bdbc169c35fbe60afa463007d611ec05 -->

<!-- START_9fd0b5c57fce7654a09d1b0fac5be777 -->
## admin/branches/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/branches/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/branches/action`


<!-- END_9fd0b5c57fce7654a09d1b0fac5be777 -->

<!-- START_e6c212a00315e8ef86b16a541adec18b -->
## admin/branches/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/branches/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/branches/order`


<!-- END_e6c212a00315e8ef86b16a541adec18b -->

<!-- START_2a8fd095f66cf3b379b40677d5f98814 -->
## admin/branches/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches/{id}/restore`


<!-- END_2a8fd095f66cf3b379b40677d5f98814 -->

<!-- START_d43a57763fcc27b1697977a46c817131 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches/relation`


<!-- END_d43a57763fcc27b1697977a46c817131 -->

<!-- START_212cc412327f2e5f6a4e6883b55f0c96 -->
## admin/branches/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/branches/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/branches/remove`


<!-- END_212cc412327f2e5f6a4e6883b55f0c96 -->

<!-- START_981ef60280b13838275b2f6db67eda00 -->
## admin/branches
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches`


<!-- END_981ef60280b13838275b2f6db67eda00 -->

<!-- START_90f2fd750bcaed4117b6fa5248168252 -->
## admin/branches/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches/create`


<!-- END_90f2fd750bcaed4117b6fa5248168252 -->

<!-- START_f1e0dc698dae823218a09e7807af6508 -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/branches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/branches`


<!-- END_f1e0dc698dae823218a09e7807af6508 -->

<!-- START_0a533f12d2a13b91c7bbde7a4d4e5ed5 -->
## admin/branches/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches/{id}`


<!-- END_0a533f12d2a13b91c7bbde7a4d4e5ed5 -->

<!-- START_de6941d2d5fabcf3357b38848cfede35 -->
## admin/branches/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/branches/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/branches/{id}/edit`


<!-- END_de6941d2d5fabcf3357b38848cfede35 -->

<!-- START_66294fe784ba62e1388e230f0970f332 -->
## admin/branches/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/branches/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/branches/{id}`

`PATCH admin/branches/{id}`


<!-- END_66294fe784ba62e1388e230f0970f332 -->

<!-- START_a2a71535715c6f58442782f606e38f86 -->
## admin/branches/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/branches/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/branches/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/branches/{id}`


<!-- END_a2a71535715c6f58442782f606e38f86 -->

<!-- START_9bef74198a8cc38b491b96c5ef410789 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services/order`


<!-- END_9bef74198a8cc38b491b96c5ef410789 -->

<!-- START_1153399fabcfcc580705ad13ae554929 -->
## admin/services/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/services/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/services/action`


<!-- END_1153399fabcfcc580705ad13ae554929 -->

<!-- START_fc6de4e12eab0f6322ac47bba2e2ccb9 -->
## admin/services/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/services/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/services/order`


<!-- END_fc6de4e12eab0f6322ac47bba2e2ccb9 -->

<!-- START_8bf05c5ff6ca2aadaecbee1230e26c73 -->
## admin/services/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services/{id}/restore`


<!-- END_8bf05c5ff6ca2aadaecbee1230e26c73 -->

<!-- START_682a1102fb7e1170af679d9b6ee362e2 -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services/relation`


<!-- END_682a1102fb7e1170af679d9b6ee362e2 -->

<!-- START_cebfbe7696b6472c6067dde98ee9da0f -->
## admin/services/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/services/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/services/remove`


<!-- END_cebfbe7696b6472c6067dde98ee9da0f -->

<!-- START_e003c8a20dc72f8b87bbb685788d0847 -->
## admin/services
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services`


<!-- END_e003c8a20dc72f8b87bbb685788d0847 -->

<!-- START_d3942a4a6dae3b56c3397fbe21f00469 -->
## admin/services/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services/create`


<!-- END_d3942a4a6dae3b56c3397fbe21f00469 -->

<!-- START_057c73f66497cdf9342552efa21dec65 -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/services" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/services`


<!-- END_057c73f66497cdf9342552efa21dec65 -->

<!-- START_49eec0c5134e582ce7dbb966ad01ae0b -->
## admin/services/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services/{id}`


<!-- END_49eec0c5134e582ce7dbb966ad01ae0b -->

<!-- START_a4818c1f4d9327377fc0e84bc2a8bf77 -->
## admin/services/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/services/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/services/{id}/edit`


<!-- END_a4818c1f4d9327377fc0e84bc2a8bf77 -->

<!-- START_bb55c9deb9e0cce9bbceceaf1bd5c9af -->
## admin/services/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/services/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/services/{id}`

`PATCH admin/services/{id}`


<!-- END_bb55c9deb9e0cce9bbceceaf1bd5c9af -->

<!-- START_2f0eb766cf5dd64958eb16a477e1c90d -->
## admin/services/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/services/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/services/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/services/{id}`


<!-- END_2f0eb766cf5dd64958eb16a477e1c90d -->

<!-- START_d2a730fbe9d5d828363d7138b5a2c31b -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories/order`


<!-- END_d2a730fbe9d5d828363d7138b5a2c31b -->

<!-- START_d873a67f22270f132df8a443ee4c45a6 -->
## admin/service-categories/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/service-categories/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/service-categories/action`


<!-- END_d873a67f22270f132df8a443ee4c45a6 -->

<!-- START_c8ee325a805855a9b9dd84d263f25970 -->
## admin/service-categories/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/service-categories/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/service-categories/order`


<!-- END_c8ee325a805855a9b9dd84d263f25970 -->

<!-- START_c71587a54be4c8920554702315a846a7 -->
## admin/service-categories/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories/{id}/restore`


<!-- END_c71587a54be4c8920554702315a846a7 -->

<!-- START_f77bb8e2ada24169b384c59c00a3019a -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories/relation`


<!-- END_f77bb8e2ada24169b384c59c00a3019a -->

<!-- START_e0754f2dc50458bfb85ebec0a21e2a02 -->
## admin/service-categories/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/service-categories/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/service-categories/remove`


<!-- END_e0754f2dc50458bfb85ebec0a21e2a02 -->

<!-- START_12a8d38e0460e2c8fded4b4cf30b1e39 -->
## admin/service-categories
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories`


<!-- END_12a8d38e0460e2c8fded4b4cf30b1e39 -->

<!-- START_69244e355981190c9a47630d99a3c96f -->
## admin/service-categories/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories/create`


<!-- END_69244e355981190c9a47630d99a3c96f -->

<!-- START_5c647967956132f9e32658d92a0b86a8 -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/service-categories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/service-categories`


<!-- END_5c647967956132f9e32658d92a0b86a8 -->

<!-- START_c4fb9c2ef4127c505e062da41b8fa63e -->
## admin/service-categories/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories/{id}`


<!-- END_c4fb9c2ef4127c505e062da41b8fa63e -->

<!-- START_0e04e2ef9c670b0e0913c9db6abbf0ad -->
## admin/service-categories/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/service-categories/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/service-categories/{id}/edit`


<!-- END_0e04e2ef9c670b0e0913c9db6abbf0ad -->

<!-- START_da014e2f15b137d27b019c2ebb58e0f6 -->
## admin/service-categories/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/service-categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/service-categories/{id}`

`PATCH admin/service-categories/{id}`


<!-- END_da014e2f15b137d27b019c2ebb58e0f6 -->

<!-- START_8ff1d766536b94ecafcee345ce90c095 -->
## admin/service-categories/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/service-categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/service-categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/service-categories/{id}`


<!-- END_8ff1d766536b94ecafcee345ce90c095 -->

<!-- START_5ede107c9358f63ce37110bb5056fa85 -->
## Order BREAD items.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders/order`


<!-- END_5ede107c9358f63ce37110bb5056fa85 -->

<!-- START_33aebab35258d6390cee35d7d1749144 -->
## admin/orders/action
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/orders/action" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/action"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/orders/action`


<!-- END_33aebab35258d6390cee35d7d1749144 -->

<!-- START_72e4a3940ae29709b6034d11b9eff782 -->
## admin/orders/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/orders/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/orders/order`


<!-- END_72e4a3940ae29709b6034d11b9eff782 -->

<!-- START_052b3d19240b95317b6e5336f728266c -->
## admin/orders/{id}/restore
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders/1/restore" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/1/restore"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders/{id}/restore`


<!-- END_052b3d19240b95317b6e5336f728266c -->

<!-- START_2e4e2b30a2b356df7907cf2643c3eace -->
## Get BREAD relations data.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders/relation" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/relation"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders/relation`


<!-- END_2e4e2b30a2b356df7907cf2643c3eace -->

<!-- START_c1ae9033166903caa8867c3a5528e9fd -->
## admin/orders/remove
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/orders/remove" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/remove"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/orders/remove`


<!-- END_c1ae9033166903caa8867c3a5528e9fd -->

<!-- START_ef74fc88219ad75b0acc28af7b662090 -->
## admin/orders
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders`


<!-- END_ef74fc88219ad75b0acc28af7b662090 -->

<!-- START_86d42efe50fecfeaa256fd0df15fa59f -->
## admin/orders/create
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders/create`


<!-- END_86d42efe50fecfeaa256fd0df15fa59f -->

<!-- START_bcfc7f86622b0198b5cf2056c3c6cdd7 -->
## POST BRE(A)D - Store data.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/orders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/orders`


<!-- END_bcfc7f86622b0198b5cf2056c3c6cdd7 -->

<!-- START_5477d13a483c4e02bccb479c0bf730f4 -->
## admin/orders/{id}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders/{id}`


<!-- END_5477d13a483c4e02bccb479c0bf730f4 -->

<!-- START_5e79b5e22410e6c3691800692d372ed7 -->
## admin/orders/{id}/edit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/orders/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/orders/{id}/edit`


<!-- END_5e79b5e22410e6c3691800692d372ed7 -->

<!-- START_745a83c511b7400a3db847c6f3a7fc68 -->
## admin/orders/{id}
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/orders/{id}`

`PATCH admin/orders/{id}`


<!-- END_745a83c511b7400a3db847c6f3a7fc68 -->

<!-- START_723f9ccd208d3cf4e69143cd8ebd91f0 -->
## admin/orders/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/orders/{id}`


<!-- END_723f9ccd208d3cf4e69143cd8ebd91f0 -->

<!-- START_ac435d45ee5407d2fdccbca88267dcbd -->
## admin/menus/{menu}/builder
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/menus/1/builder" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/builder"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/menus/{menu}/builder`


<!-- END_ac435d45ee5407d2fdccbca88267dcbd -->

<!-- START_5856165be043e948232bc2f197b0793e -->
## admin/menus/{menu}/order
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/menus/1/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/menus/{menu}/order`


<!-- END_5856165be043e948232bc2f197b0793e -->

<!-- START_4bfd90bde1365e61894a8540ac98a254 -->
## admin/menus/{menu}/item/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/menus/1/item/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/item/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/menus/{menu}/item/{id}`


<!-- END_4bfd90bde1365e61894a8540ac98a254 -->

<!-- START_2be02546bd540da5155ba0e0dbf8c113 -->
## admin/menus/{menu}/item
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/menus/1/item" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/item"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/menus/{menu}/item`


<!-- END_2be02546bd540da5155ba0e0dbf8c113 -->

<!-- START_d21b9fa978200b00c673801429975965 -->
## admin/menus/{menu}/item
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/menus/1/item" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/menus/1/item"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/menus/{menu}/item`


<!-- END_d21b9fa978200b00c673801429975965 -->

<!-- START_56195363f828f4391ab90cab97490d06 -->
## admin/settings
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/settings`


<!-- END_56195363f828f4391ab90cab97490d06 -->

<!-- START_dbe0c0df09e7e235b9b689cb9fcae29d -->
## admin/settings
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/settings`


<!-- END_dbe0c0df09e7e235b9b689cb9fcae29d -->

<!-- START_1982c6133076517feb5c960d3a668ad3 -->
## admin/settings
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/settings`


<!-- END_1982c6133076517feb5c960d3a668ad3 -->

<!-- START_3e89dd8d1c7ef761119e2e4d1ffbf58d -->
## admin/settings/{id}
> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/settings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/settings/{id}`


<!-- END_3e89dd8d1c7ef761119e2e4d1ffbf58d -->

<!-- START_a92e1c75e6f1f7e5bfc7e8f9af7bfa8a -->
## admin/settings/{id}/move_up
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/settings/1/move_up" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings/1/move_up"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/settings/{id}/move_up`


<!-- END_a92e1c75e6f1f7e5bfc7e8f9af7bfa8a -->

<!-- START_966203d204987e656790f588ae269fab -->
## admin/settings/{id}/move_down
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/settings/1/move_down" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings/1/move_down"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/settings/{id}/move_down`


<!-- END_966203d204987e656790f588ae269fab -->

<!-- START_f2808f0fe68c171b71bbc620c53c9814 -->
## admin/settings/{id}/delete_value
> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/settings/1/delete_value" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/settings/1/delete_value"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/settings/{id}/delete_value`


<!-- END_f2808f0fe68c171b71bbc620c53c9814 -->

<!-- START_8535e162b521fec6ac2854e0b45b0865 -->
## admin/media
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/media" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/media`


<!-- END_8535e162b521fec6ac2854e0b45b0865 -->

<!-- START_b9bfa3e54948328fe9e640713ffbb8ac -->
## admin/media/files
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/files" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/files"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/files`


<!-- END_b9bfa3e54948328fe9e640713ffbb8ac -->

<!-- START_732712e0f9183c0a58b257957c42a646 -->
## admin/media/new_folder
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/new_folder" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/new_folder"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/new_folder`


<!-- END_732712e0f9183c0a58b257957c42a646 -->

<!-- START_f0238327580fef0d49dc4d3f252e2296 -->
## admin/media/delete_file_folder
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/delete_file_folder" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/delete_file_folder"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/delete_file_folder`


<!-- END_f0238327580fef0d49dc4d3f252e2296 -->

<!-- START_0a9c8a4cfde0499377a310965635a256 -->
## admin/media/move_file
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/move_file" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/move_file"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/move_file`


<!-- END_0a9c8a4cfde0499377a310965635a256 -->

<!-- START_549f6358b83f1994b056587ba821e84c -->
## admin/media/rename_file
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/rename_file" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/rename_file"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/rename_file`


<!-- END_549f6358b83f1994b056587ba821e84c -->

<!-- START_db32070506fe9f0d1e93032c76683518 -->
## admin/media/upload
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/upload" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/upload"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/upload`


<!-- END_db32070506fe9f0d1e93032c76683518 -->

<!-- START_65f31e29983c7311498c341756abadbc -->
## admin/media/crop
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/media/crop" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/media/crop"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/media/crop`


<!-- END_65f31e29983c7311498c341756abadbc -->

<!-- START_6d01b2e192e7acf2bd66a19221e71e8b -->
## admin/bread
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/bread" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/bread`


<!-- END_6d01b2e192e7acf2bd66a19221e71e8b -->

<!-- START_fe750dce50adc03bce6ca5c32c18c555 -->
## Create BREAD.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/bread/1/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread/1/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/bread/{table}/create`


<!-- END_fe750dce50adc03bce6ca5c32c18c555 -->

<!-- START_80678edaf586a13044e3fc4f2efcf842 -->
## Store BREAD.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/bread" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/bread`


<!-- END_80678edaf586a13044e3fc4f2efcf842 -->

<!-- START_ee4aae2eec925b7340c9ccd28a961cdb -->
## Edit BREAD.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/bread/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/bread/{table}/edit`


<!-- END_ee4aae2eec925b7340c9ccd28a961cdb -->

<!-- START_95876b46e11e16b75bfd3ee0d5c1985d -->
## Update BREAD.

> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/bread/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/bread/{id}`


<!-- END_95876b46e11e16b75bfd3ee0d5c1985d -->

<!-- START_c2414cf3144da6f70492b6a4d7dd9a6d -->
## Delete BREAD.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/bread/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/bread/{id}`


<!-- END_c2414cf3144da6f70492b6a4d7dd9a6d -->

<!-- START_9a48d0467832bca5077b94b831a3824d -->
## Add Relationship.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/bread/relationship" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread/relationship"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/bread/relationship`


<!-- END_9a48d0467832bca5077b94b831a3824d -->

<!-- START_4120860e469ee34d870163fb232e4ef5 -->
## Delete Relationship.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/bread/delete_relationship/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/bread/delete_relationship/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/bread/delete_relationship/{id}`


<!-- END_4120860e469ee34d870163fb232e4ef5 -->

<!-- START_1ed560c8752fd0a83f683505d15c8174 -->
## admin/database
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/database" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/database`


<!-- END_1ed560c8752fd0a83f683505d15c8174 -->

<!-- START_1864a4a7a1cb48a8bd933ae196e239d4 -->
## Create database table.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/database/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/database/create`


<!-- END_1864a4a7a1cb48a8bd933ae196e239d4 -->

<!-- START_b260cb184bed3d655fdff4d3e7fad87b -->
## Store new database table.

> Example request:

```bash
curl -X POST \
    "http://localhost/admin/database" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/database`


<!-- END_b260cb184bed3d655fdff4d3e7fad87b -->

<!-- START_9c8aa3a06542eda4f36959ec8136a6a4 -->
## Show table.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/database/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/database/{database}`


<!-- END_9c8aa3a06542eda4f36959ec8136a6a4 -->

<!-- START_758e5f292cb134d0fc806839e3802bd8 -->
## Edit database table.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/database/1/edit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database/1/edit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/database/{database}/edit`


<!-- END_758e5f292cb134d0fc806839e3802bd8 -->

<!-- START_72b9abf607fd326a9041578c4d3a2eaa -->
## Update database table.

> Example request:

```bash
curl -X PUT \
    "http://localhost/admin/database/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT admin/database/{database}`

`PATCH admin/database/{database}`


<!-- END_72b9abf607fd326a9041578c4d3a2eaa -->

<!-- START_32e253d3d95d0cd173cbe86372c32d7d -->
## Destroy table.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/admin/database/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/database/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE admin/database/{database}`


<!-- END_32e253d3d95d0cd173cbe86372c32d7d -->

<!-- START_5eb3e5d8b71d7f55cdba8200e55279ff -->
## admin/compass
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/compass" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/compass"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (302):

```json
null
```

### HTTP Request
`GET admin/compass`


<!-- END_5eb3e5d8b71d7f55cdba8200e55279ff -->

<!-- START_7c23f251af6f7d8aaa6a897cd2e34067 -->
## admin/compass
> Example request:

```bash
curl -X POST \
    "http://localhost/admin/compass" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/compass"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/compass`


<!-- END_7c23f251af6f7d8aaa6a897cd2e34067 -->

<!-- START_5f55435a12cc0885d93f73a26bae6d37 -->
## admin/voyager-assets
> Example request:

```bash
curl -X GET \
    -G "http://localhost/admin/voyager-assets" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/admin/voyager-assets"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET admin/voyager-assets`


<!-- END_5f55435a12cc0885d93f73a26bae6d37 -->

<!-- START_38ddd49a23e26b775708c9577ed9a12b -->
## api/master/user
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/user" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/user"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/master/user`


<!-- END_38ddd49a23e26b775708c9577ed9a12b -->

<!-- START_8f5dab13057c77ae9186c0aa02bd8889 -->
## api/master/totalorders
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/totalorders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/totalorders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/totalorders`


<!-- END_8f5dab13057c77ae9186c0aa02bd8889 -->

<!-- START_0bd78d53dc8fb0d81256df882a370e54 -->
## api/master/profit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/profit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/profit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/profit`


<!-- END_0bd78d53dc8fb0d81256df882a370e54 -->

<!-- START_5b86b94ae175ed84ba9227a5b4654ac6 -->
## api/master/growth
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/growth" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/growth"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/growth`


<!-- END_5b86b94ae175ed84ba9227a5b4654ac6 -->

<!-- START_00fb41950720f8f62daf19f016bfb87a -->
## api/master/ordercountbymonths
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/ordercountbymonths" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/ordercountbymonths"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/ordercountbymonths`


<!-- END_00fb41950720f8f62daf19f016bfb87a -->

<!-- START_419a9f5f99de6ff5770354bc03c1b1a0 -->
## api/master/ordercountbranchbymonth/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/ordercountbranchbymonth/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/ordercountbranchbymonth/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "orders": 72,
        "time_period": "Oct 2021",
        "year": 2021,
        "month": 10,
        "total_sum": 0,
        "paid_sum": 0
    },
    {
        "orders": 5,
        "time_period": "Dec 2021",
        "year": 2021,
        "month": 12,
        "total_sum": 0,
        "paid_sum": 0
    },
    {
        "orders": 22,
        "time_period": "Jan 2022",
        "year": 2022,
        "month": 1,
        "total_sum": 0,
        "paid_sum": 0
    }
]
```

### HTTP Request
`GET api/master/ordercountbranchbymonth/{shopid}`


<!-- END_419a9f5f99de6ff5770354bc03c1b1a0 -->

<!-- START_d56687c79f9e5a26810c5883f61c71e7 -->
## api/master/paymentcountbymonths
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/paymentcountbymonths" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/paymentcountbymonths"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/paymentcountbymonths`


<!-- END_d56687c79f9e5a26810c5883f61c71e7 -->

<!-- START_b003913596df6709330b24cb2073790d -->
## api/master/branchpaymentcountbymonth/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branchpaymentcountbymonth/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branchpaymentcountbymonth/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "total": "500000",
        "time_period": null,
        "year": null,
        "month": null
    },
    {
        "total": "21635000",
        "time_period": "Oct 2021",
        "year": 2021,
        "month": 10
    },
    {
        "total": "0",
        "time_period": "Dec 2021",
        "year": 2021,
        "month": 12
    },
    {
        "total": "80000",
        "time_period": "Jan 2022",
        "year": 2022,
        "month": 1
    }
]
```

### HTTP Request
`GET api/master/branchpaymentcountbymonth/{shopid}`


<!-- END_b003913596df6709330b24cb2073790d -->

<!-- START_7e9598e23bdfb9cf44818d9ba4815134 -->
## api/master/ordercountbymonthseachbranches
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/ordercountbymonthseachbranches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/ordercountbymonthseachbranches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/ordercountbymonthseachbranches`


<!-- END_7e9598e23bdfb9cf44818d9ba4815134 -->

<!-- START_2e3d24b862433f08918707802dcc9af2 -->
## api/master/paymentcountbymonthseachbranches
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/paymentcountbymonthseachbranches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/paymentcountbymonthseachbranches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/paymentcountbymonthseachbranches`


<!-- END_2e3d24b862433f08918707802dcc9af2 -->

<!-- START_983fe63a56f32d8dda063fe155e06e54 -->
## api/master/getsubscribestatus
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/getsubscribestatus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/getsubscribestatus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/getsubscribestatus`


<!-- END_983fe63a56f32d8dda063fe155e06e54 -->

<!-- START_0b81b6dfa254d786c8212bd1c737342c -->
## api/master/slaves
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/slaves" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/slaves"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/slaves`


<!-- END_0b81b6dfa254d786c8212bd1c737342c -->

<!-- START_7d2411ced64cff1b66965a8156bc34bb -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/shops" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/shops"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "user_id": 3,
        "name": "Laundry Sukses",
        "description": "Laundry di Gunungpati",
        "created_at": "2021-09-30T23:15:46.000000Z",
        "updated_at": "2021-09-30T23:15:46.000000Z",
        "user": {
            "id": 3,
            "role_id": 4,
            "name": "Slave 1",
            "email": "slave1@slave1.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-09-30T23:15:20.000000Z",
            "updated_at": "2021-09-30T23:15:20.000000Z",
            "home_address": null,
            "contact_number": null
        }
    },
    {
        "id": 14,
        "user_id": 54,
        "name": "Laundry maju jaya",
        "description": "toko cabang baru",
        "created_at": "2021-12-31T11:58:40.000000Z",
        "updated_at": "2021-12-31T11:58:40.000000Z",
        "user": {
            "id": 54,
            "role_id": 4,
            "name": "Slave2",
            "email": "slave2@slave2.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-12-31T11:58:40.000000Z",
            "updated_at": "2021-12-31T11:58:40.000000Z",
            "home_address": null,
            "contact_number": null
        }
    },
    {
        "id": 15,
        "user_id": 57,
        "name": "Laundry Baru",
        "description": "Cabang baru di daerah semarang",
        "created_at": "2022-01-14T11:28:07.000000Z",
        "updated_at": "2022-01-14T11:28:07.000000Z",
        "user": {
            "id": 57,
            "role_id": 4,
            "name": "Cabang baru",
            "email": "newslave@slave.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2022-01-14T11:28:07.000000Z",
            "updated_at": "2022-01-14T11:28:07.000000Z",
            "home_address": null,
            "contact_number": null
        }
    }
]
```

### HTTP Request
`GET api/master/shops`


<!-- END_7d2411ced64cff1b66965a8156bc34bb -->

<!-- START_5341b0685bf31fd6a6b755ac93c43178 -->
## api/master/branches
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/branches`


<!-- END_5341b0685bf31fd6a6b755ac93c43178 -->

<!-- START_bed282847e74a3c4e2e0e3c09c4743ab -->
## api/master/slave/{shopid}/services
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/slave/1/services" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/slave/1/services"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "service_category_id": 2,
        "name": "Layanan Express",
        "description": null,
        "price": 55000,
        "process_time": 24,
        "is_available": 1,
        "created_at": "2021-10-01T19:29:24.000000Z",
        "updated_at": "2021-10-01T19:29:24.000000Z",
        "shop_id": 1,
        "category": {
            "id": 2,
            "name": "Pakaian Halus",
            "description": "",
            "created_at": "2021-10-01T19:28:00.000000Z",
            "updated_at": "2021-10-02T09:22:58.000000Z",
            "service_unit_id": 1,
            "shop_id": null
        }
    },
    {
        "id": 6,
        "service_category_id": 1,
        "name": "Layanan 4",
        "description": null,
        "price": 20000,
        "process_time": null,
        "is_available": 1,
        "created_at": "2021-10-06T00:53:04.000000Z",
        "updated_at": "2021-10-06T00:53:04.000000Z",
        "shop_id": 1,
        "category": {
            "id": 1,
            "name": "Selimut ",
            "description": "",
            "created_at": "2021-10-01T19:27:48.000000Z",
            "updated_at": "2021-10-01T19:27:48.000000Z",
            "service_unit_id": 2,
            "shop_id": null
        }
    },
    {
        "id": 7,
        "service_category_id": 1,
        "name": "Layanan ex5",
        "description": null,
        "price": 10000,
        "process_time": 12,
        "is_available": 1,
        "created_at": "2021-10-06T00:58:37.000000Z",
        "updated_at": "2021-10-06T00:58:37.000000Z",
        "shop_id": 1,
        "category": {
            "id": 1,
            "name": "Selimut ",
            "description": "",
            "created_at": "2021-10-01T19:27:48.000000Z",
            "updated_at": "2021-10-01T19:27:48.000000Z",
            "service_unit_id": 2,
            "shop_id": null
        }
    },
    {
        "id": 8,
        "service_category_id": 1,
        "name": "layanan ex6",
        "description": null,
        "price": 20000,
        "process_time": 11,
        "is_available": 1,
        "created_at": "2021-10-06T01:07:51.000000Z",
        "updated_at": "2021-10-06T01:07:51.000000Z",
        "shop_id": 1,
        "category": {
            "id": 1,
            "name": "Selimut ",
            "description": "",
            "created_at": "2021-10-01T19:27:48.000000Z",
            "updated_at": "2021-10-01T19:27:48.000000Z",
            "service_unit_id": 2,
            "shop_id": null
        }
    },
    {
        "id": 13,
        "service_category_id": 8,
        "name": "Reguler Baru",
        "description": null,
        "price": 10000,
        "process_time": 10,
        "is_available": 1,
        "created_at": "2022-01-19T04:23:29.000000Z",
        "updated_at": "2022-01-19T04:23:29.000000Z",
        "shop_id": 1,
        "category": {
            "id": 8,
            "name": "Karpet kasar",
            "description": null,
            "created_at": "2022-01-19T02:06:54.000000Z",
            "updated_at": "2022-01-19T02:06:54.000000Z",
            "service_unit_id": 2,
            "shop_id": 1
        }
    },
    {
        "id": 14,
        "service_category_id": 8,
        "name": "Reguler 1",
        "description": null,
        "price": 1000,
        "process_time": 1,
        "is_available": 1,
        "created_at": "2022-01-19T04:25:03.000000Z",
        "updated_at": "2022-01-19T04:25:03.000000Z",
        "shop_id": 1,
        "category": {
            "id": 8,
            "name": "Karpet kasar",
            "description": null,
            "created_at": "2022-01-19T02:06:54.000000Z",
            "updated_at": "2022-01-19T02:06:54.000000Z",
            "service_unit_id": 2,
            "shop_id": 1
        }
    },
    {
        "id": 15,
        "service_category_id": 3,
        "name": "Reguler 2",
        "description": null,
        "price": 1000,
        "process_time": 1,
        "is_available": 1,
        "created_at": "2022-01-19T04:25:23.000000Z",
        "updated_at": "2022-01-19T04:25:23.000000Z",
        "shop_id": 1,
        "category": {
            "id": 3,
            "name": "Selimut Halus",
            "description": null,
            "created_at": "2022-01-13T08:13:38.000000Z",
            "updated_at": "2022-01-13T08:13:38.000000Z",
            "service_unit_id": 1,
            "shop_id": 1
        }
    },
    {
        "id": 16,
        "service_category_id": 4,
        "name": "Reguler 3",
        "description": null,
        "price": 1000,
        "process_time": 1,
        "is_available": 1,
        "created_at": "2022-01-19T04:25:42.000000Z",
        "updated_at": "2022-01-19T04:25:42.000000Z",
        "shop_id": 1,
        "category": {
            "id": 4,
            "name": "Pakaian Halus",
            "description": null,
            "created_at": "2022-01-13T08:42:31.000000Z",
            "updated_at": "2022-01-13T08:42:31.000000Z",
            "service_unit_id": 1,
            "shop_id": 1
        }
    },
    {
        "id": 17,
        "service_category_id": 4,
        "name": "Reguler 4",
        "description": null,
        "price": 1000,
        "process_time": 1,
        "is_available": 1,
        "created_at": "2022-01-19T04:26:04.000000Z",
        "updated_at": "2022-01-19T04:26:04.000000Z",
        "shop_id": 1,
        "category": {
            "id": 4,
            "name": "Pakaian Halus",
            "description": null,
            "created_at": "2022-01-13T08:42:31.000000Z",
            "updated_at": "2022-01-13T08:42:31.000000Z",
            "service_unit_id": 1,
            "shop_id": 1
        }
    },
    {
        "id": 20,
        "service_category_id": 11,
        "name": "Express 1",
        "description": null,
        "price": 0,
        "process_time": 1,
        "is_available": 1,
        "created_at": "2022-01-31T02:35:23.000000Z",
        "updated_at": "2022-01-31T02:35:23.000000Z",
        "shop_id": 1,
        "category": {
            "id": 11,
            "name": "bantal",
            "description": null,
            "created_at": "2022-01-31T02:32:35.000000Z",
            "updated_at": "2022-01-31T02:32:35.000000Z",
            "service_unit_id": 2,
            "shop_id": 1
        }
    }
]
```

### HTTP Request
`GET api/master/slave/{shopid}/services`


<!-- END_bed282847e74a3c4e2e0e3c09c4743ab -->

<!-- START_101c1d2839ba10ab84d78ec14f529780 -->
## api/master/slave/{slaveid}/orders
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/slave/1/orders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/slave/1/orders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-02T05:49:00.000000Z",
        "updated_at": "2021-10-13T03:58:36.000000Z",
        "order_status_id": 4,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 220000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 3,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:07:28.000000Z",
        "updated_at": "2021-10-07T00:07:28.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 4,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:08:11.000000Z",
        "updated_at": "2021-10-07T00:08:11.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 5,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-07T00:12:29.000000Z",
        "updated_at": "2021-10-07T00:12:29.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1320000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 6,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-07T00:12:51.000000Z",
        "updated_at": "2021-10-07T00:12:51.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1320000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 7,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-07T00:13:42.000000Z",
        "updated_at": "2021-10-07T00:13:42.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1320000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 8,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:20:25.000000Z",
        "updated_at": "2021-10-07T00:20:25.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 9,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:20:59.000000Z",
        "updated_at": "2021-10-07T00:20:59.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 10,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:22:03.000000Z",
        "updated_at": "2021-10-07T00:22:03.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 11,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:22:55.000000Z",
        "updated_at": "2021-10-07T00:22:55.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 12,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:24:46.000000Z",
        "updated_at": "2021-10-07T00:24:46.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 13,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:25:34.000000Z",
        "updated_at": "2021-10-07T00:25:34.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 14,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T00:27:08.000000Z",
        "updated_at": "2021-10-07T00:27:08.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 15,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T07:28:06.000000Z",
        "updated_at": "2021-10-07T07:28:06.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 16,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T07:29:36.000000Z",
        "updated_at": "2021-10-07T07:29:36.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 17,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T07:30:03.000000Z",
        "updated_at": "2021-10-07T07:30:03.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1005000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 18,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T07:31:15.000000Z",
        "updated_at": "2021-10-07T07:31:15.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 880000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 19,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T07:31:42.000000Z",
        "updated_at": "2021-10-07T07:31:42.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 880000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 20,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-07T07:33:25.000000Z",
        "updated_at": "2021-10-07T07:33:25.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1045000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 21,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T07:44:39.000000Z",
        "updated_at": "2021-10-07T07:44:39.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1045000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 22,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-07T07:45:35.000000Z",
        "updated_at": "2021-10-07T07:45:35.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1045000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 23,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T08:12:19.000000Z",
        "updated_at": "2021-10-07T08:12:19.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 24,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 38,
        "created_at": "2021-10-07T08:13:21.000000Z",
        "updated_at": "2021-10-07T08:13:21.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 25,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T08:14:00.000000Z",
        "updated_at": "2021-10-07T08:14:00.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 26,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T08:15:25.000000Z",
        "updated_at": "2021-10-07T08:15:25.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 27,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-07T08:16:03.000000Z",
        "updated_at": "2021-10-07T08:16:03.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 28,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 46,
        "created_at": "2021-10-07T08:20:50.000000Z",
        "updated_at": "2021-10-07T08:20:50.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 46,
            "role_id": 5,
            "name": "Rudi",
            "email": "Rudi@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-06T20:26:23.000000Z",
            "updated_at": "2022-01-22T12:03:05.000000Z",
            "home_address": "seamrang",
            "contact_number": "08272617171"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 29,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-07T08:25:00.000000Z",
        "updated_at": "2021-10-07T08:25:00.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 30,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-07T08:25:55.000000Z",
        "updated_at": "2021-10-07T08:25:55.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 31,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-07T08:30:05.000000Z",
        "updated_at": "2021-10-07T08:30:05.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 400000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 32,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-07T08:33:04.000000Z",
        "updated_at": "2021-10-07T08:33:04.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 33,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-07T08:34:17.000000Z",
        "updated_at": "2021-10-07T08:34:17.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 34,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-07T08:34:31.000000Z",
        "updated_at": "2021-10-07T08:34:31.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 200000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 35,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-07T08:36:10.000000Z",
        "updated_at": "2021-10-08T08:11:16.000000Z",
        "order_status_id": 3,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 550000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 36,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-08T02:03:44.000000Z",
        "updated_at": "2021-10-08T02:03:44.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 37,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-08T02:05:24.000000Z",
        "updated_at": "2021-10-08T02:05:24.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 38,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-08T02:08:46.000000Z",
        "updated_at": "2021-10-08T02:08:46.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 39,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-08T02:10:02.000000Z",
        "updated_at": "2021-10-08T02:10:02.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 550000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 40,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-08T02:11:45.000000Z",
        "updated_at": "2021-10-08T02:11:45.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 100000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 41,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-09T01:41:03.000000Z",
        "updated_at": "2021-10-09T01:49:44.000000Z",
        "order_status_id": 3,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 950000,
        "paid_sum": 950000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 42,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-11T02:54:39.000000Z",
        "updated_at": "2021-10-11T02:55:14.000000Z",
        "order_status_id": 4,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 400000,
        "paid_sum": 400000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 43,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T03:02:22.000000Z",
        "updated_at": "2021-10-11T03:02:22.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 44,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2021-10-11T03:05:21.000000Z",
        "updated_at": "2021-10-11T03:05:21.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 2600000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 45,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T03:30:46.000000Z",
        "updated_at": "2021-10-11T03:30:46.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 400000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 46,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T03:31:06.000000Z",
        "updated_at": "2021-10-11T03:31:06.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 1100000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 47,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T06:27:30.000000Z",
        "updated_at": "2021-10-11T06:27:30.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 48,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-11T07:03:01.000000Z",
        "updated_at": "2021-10-11T07:03:01.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 49,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T07:04:29.000000Z",
        "updated_at": "2021-10-11T07:04:29.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 50,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T07:11:50.000000Z",
        "updated_at": "2021-10-11T07:11:50.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 51,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T07:24:29.000000Z",
        "updated_at": "2021-10-11T07:24:29.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 52,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T07:57:51.000000Z",
        "updated_at": "2021-10-11T07:57:51.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 2100000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 53,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:16:11.000000Z",
        "updated_at": "2021-10-11T08:16:11.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 200000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 54,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:17:58.000000Z",
        "updated_at": "2021-10-11T08:17:58.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 450000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 55,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:22:40.000000Z",
        "updated_at": "2021-10-11T08:22:40.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 500000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 56,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:23:44.000000Z",
        "updated_at": "2021-10-11T08:23:44.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 4000000,
        "paid_sum": 11850000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 57,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-11T08:25:48.000000Z",
        "updated_at": "2021-10-11T08:25:48.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 1025000,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 58,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:32:10.000000Z",
        "updated_at": "2021-10-11T08:32:10.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 430000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 59,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:34:51.000000Z",
        "updated_at": "2021-10-11T08:34:51.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 70000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 60,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-11T08:36:07.000000Z",
        "updated_at": "2021-10-11T08:36:07.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 70000,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 61,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:42:54.000000Z",
        "updated_at": "2021-10-11T08:42:54.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 30000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 62,
        "shop_id": 1,
        "customer_id": 7,
        "employee_id": 8,
        "created_at": "2021-10-11T08:52:44.000000Z",
        "updated_at": "2021-10-11T08:52:44.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 500000,
        "customer": {
            "id": 7,
            "role_id": 6,
            "name": "Customer2edit",
            "email": "customer2@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:14.000000Z",
            "updated_at": "2021-10-06T20:10:53.000000Z",
            "home_address": "Semarang",
            "contact_number": "816128"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 63,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:54:55.000000Z",
        "updated_at": "2021-10-11T08:54:55.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 100000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 64,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:56:13.000000Z",
        "updated_at": "2021-10-11T08:56:13.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 100000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 65,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:58:12.000000Z",
        "updated_at": "2021-10-11T08:58:12.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 100000,
        "paid_sum": 150000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 66,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T08:58:43.000000Z",
        "updated_at": "2021-10-11T08:58:43.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 350000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 67,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-11T11:27:08.000000Z",
        "updated_at": "2021-12-18T06:34:46.000000Z",
        "order_status_id": 4,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 310000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 68,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-12T01:20:25.000000Z",
        "updated_at": "2021-10-12T01:20:53.000000Z",
        "order_status_id": 2,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 200000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 69,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-12T01:41:38.000000Z",
        "updated_at": "2021-10-12T01:41:38.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 70,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-13T03:56:22.000000Z",
        "updated_at": "2021-10-13T03:56:22.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 550000,
        "paid_sum": 550000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 71,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-13T06:17:43.000000Z",
        "updated_at": "2021-10-13T06:17:43.000000Z",
        "order_status_id": null,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 200000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 72,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-13T06:19:18.000000Z",
        "updated_at": "2021-10-13T06:19:18.000000Z",
        "order_status_id": null,
        "description": "di rak no.4",
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 200000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 73,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2021-10-13T06:21:47.000000Z",
        "updated_at": "2021-10-13T06:21:47.000000Z",
        "order_status_id": null,
        "description": "di rak nomor 1",
        "value": null,
        "deleted_at": null,
        "total_sum": 200000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 75,
        "shop_id": 1,
        "customer_id": 50,
        "employee_id": 8,
        "created_at": "2021-12-16T07:25:07.000000Z",
        "updated_at": "2021-12-16T07:25:07.000000Z",
        "order_status_id": 1,
        "description": "tes",
        "value": null,
        "deleted_at": null,
        "total_sum": 55000,
        "paid_sum": 0,
        "customer": {
            "id": 50,
            "role_id": 6,
            "name": "customer baruu",
            "email": "customer20@customer.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-12-13T11:22:37.000000Z",
            "updated_at": "2021-12-14T11:20:55.000000Z",
            "home_address": "Semarang",
            "contact_number": "98765456789"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 76,
        "shop_id": 1,
        "customer_id": 50,
        "employee_id": 8,
        "created_at": "2021-12-16T10:56:39.000000Z",
        "updated_at": "2021-12-16T10:56:39.000000Z",
        "order_status_id": 1,
        "description": "tes 2",
        "value": null,
        "deleted_at": null,
        "total_sum": 55000,
        "paid_sum": 0,
        "customer": {
            "id": 50,
            "role_id": 6,
            "name": "customer baruu",
            "email": "customer20@customer.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-12-13T11:22:37.000000Z",
            "updated_at": "2021-12-14T11:20:55.000000Z",
            "home_address": "Semarang",
            "contact_number": "98765456789"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 77,
        "shop_id": 1,
        "customer_id": 50,
        "employee_id": 8,
        "created_at": "2021-12-16T11:07:40.000000Z",
        "updated_at": "2021-12-16T11:07:40.000000Z",
        "order_status_id": 1,
        "description": "tes 2",
        "value": null,
        "deleted_at": null,
        "total_sum": 55000,
        "paid_sum": 0,
        "customer": {
            "id": 50,
            "role_id": 6,
            "name": "customer baruu",
            "email": "customer20@customer.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-12-13T11:22:37.000000Z",
            "updated_at": "2021-12-14T11:20:55.000000Z",
            "home_address": "Semarang",
            "contact_number": "98765456789"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 78,
        "shop_id": 1,
        "customer_id": 50,
        "employee_id": 8,
        "created_at": "2021-12-16T11:10:41.000000Z",
        "updated_at": "2021-12-16T11:10:41.000000Z",
        "order_status_id": 1,
        "description": "tes 2",
        "value": null,
        "deleted_at": null,
        "total_sum": 55000,
        "paid_sum": 0,
        "customer": {
            "id": 50,
            "role_id": 6,
            "name": "customer baruu",
            "email": "customer20@customer.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-12-13T11:22:37.000000Z",
            "updated_at": "2021-12-14T11:20:55.000000Z",
            "home_address": "Semarang",
            "contact_number": "98765456789"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 79,
        "shop_id": 1,
        "customer_id": 50,
        "employee_id": 8,
        "created_at": "2021-12-17T04:03:05.000000Z",
        "updated_at": "2021-12-18T06:37:10.000000Z",
        "order_status_id": 4,
        "description": "tes 3",
        "value": null,
        "deleted_at": null,
        "total_sum": 20000,
        "paid_sum": 0,
        "customer": {
            "id": 50,
            "role_id": 6,
            "name": "customer baruu",
            "email": "customer20@customer.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-12-13T11:22:37.000000Z",
            "updated_at": "2021-12-14T11:20:55.000000Z",
            "home_address": "Semarang",
            "contact_number": "98765456789"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 80,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-17T03:09:29.000000Z",
        "updated_at": "2022-01-17T03:09:29.000000Z",
        "order_status_id": null,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 81,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-17T03:09:44.000000Z",
        "updated_at": "2022-01-17T03:09:44.000000Z",
        "order_status_id": null,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 83,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-17T03:11:21.000000Z",
        "updated_at": "2022-01-17T03:11:21.000000Z",
        "order_status_id": 1,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 20000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 85,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-17T03:30:06.000000Z",
        "updated_at": "2022-01-17T03:30:06.000000Z",
        "order_status_id": 1,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 20000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 86,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-17T03:32:07.000000Z",
        "updated_at": "2022-01-17T03:32:07.000000Z",
        "order_status_id": 1,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 87,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-18T01:46:19.000000Z",
        "updated_at": "2022-01-18T01:46:19.000000Z",
        "order_status_id": null,
        "description": "Pakaian halus",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 88,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-18T02:25:42.000000Z",
        "updated_at": "2022-01-18T02:25:42.000000Z",
        "order_status_id": null,
        "description": "tes",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 89,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-18T02:27:45.000000Z",
        "updated_at": "2022-01-18T02:27:45.000000Z",
        "order_status_id": null,
        "description": "tes",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 80000,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 90,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-18T03:00:18.000000Z",
        "updated_at": "2022-01-18T03:00:18.000000Z",
        "order_status_id": null,
        "description": "tes",
        "value": null,
        "deleted_at": null,
        "total_sum": 0,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 91,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-20T04:54:39.000000Z",
        "updated_at": "2022-01-23T01:13:26.000000Z",
        "order_status_id": 2,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 12000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 92,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-20T06:04:56.000000Z",
        "updated_at": "2022-01-22T15:49:56.000000Z",
        "order_status_id": 4,
        "description": "Coba pesan",
        "value": null,
        "deleted_at": null,
        "total_sum": 5000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 93,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-20T06:46:40.000000Z",
        "updated_at": "2022-01-20T06:46:40.000000Z",
        "order_status_id": 1,
        "description": "Coba qr",
        "value": null,
        "deleted_at": null,
        "total_sum": 10000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 94,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-22T01:59:21.000000Z",
        "updated_at": "2022-01-22T01:59:21.000000Z",
        "order_status_id": 1,
        "description": "Coba printer",
        "value": null,
        "deleted_at": null,
        "total_sum": 10000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 95,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-22T02:46:28.000000Z",
        "updated_at": "2022-01-22T02:46:28.000000Z",
        "order_status_id": 1,
        "description": "Coba fitur print",
        "value": null,
        "deleted_at": null,
        "total_sum": 35000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 96,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-22T03:57:04.000000Z",
        "updated_at": "2022-01-22T03:57:04.000000Z",
        "order_status_id": 4,
        "description": "sadsfg",
        "value": null,
        "deleted_at": null,
        "total_sum": 14000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 97,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-22T04:32:35.000000Z",
        "updated_at": "2022-01-22T04:32:35.000000Z",
        "order_status_id": 1,
        "description": "asdfs",
        "value": null,
        "deleted_at": null,
        "total_sum": 1000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 98,
        "shop_id": 1,
        "customer_id": 62,
        "employee_id": 8,
        "created_at": "2022-01-23T02:48:41.000000Z",
        "updated_at": "2022-01-23T02:48:41.000000Z",
        "order_status_id": 1,
        "description": "Coba pesan 1",
        "value": null,
        "deleted_at": null,
        "total_sum": 10000,
        "paid_sum": 0,
        "customer": {
            "id": 62,
            "role_id": 6,
            "name": "Sulis",
            "email": "sulis@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2022-01-23T02:05:39.000000Z",
            "updated_at": "2022-01-23T02:05:39.000000Z",
            "home_address": "Semarang",
            "contact_number": "08292728291"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 99,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-25T02:28:35.000000Z",
        "updated_at": "2022-01-25T02:29:32.000000Z",
        "order_status_id": 2,
        "description": "Dikirim ke rumah",
        "value": null,
        "deleted_at": null,
        "total_sum": 5000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 100,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-26T07:01:33.000000Z",
        "updated_at": "2022-01-26T07:01:33.000000Z",
        "order_status_id": 1,
        "description": "CEPAT!",
        "value": null,
        "deleted_at": null,
        "total_sum": 1000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 101,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 8,
        "created_at": "2022-01-26T07:04:50.000000Z",
        "updated_at": "2022-01-26T07:04:50.000000Z",
        "order_status_id": 1,
        "description": "maskmakk",
        "value": null,
        "deleted_at": null,
        "total_sum": 1000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 102,
        "shop_id": 1,
        "customer_id": 69,
        "employee_id": 8,
        "created_at": "2022-01-27T02:05:05.000000Z",
        "updated_at": "2022-01-28T02:05:05.000000Z",
        "order_status_id": 4,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 20000,
        "paid_sum": 0,
        "customer": {
            "id": 69,
            "role_id": 6,
            "name": "Zaenal",
            "email": "zaenal@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2022-01-25T02:25:21.000000Z",
            "updated_at": "2022-01-25T02:25:21.000000Z",
            "home_address": "Semarang",
            "contact_number": "0829272891"
        },
        "employee": {
            "id": 8,
            "role_id": 5,
            "name": "Roland",
            "email": "Rol@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:24:46.000000Z",
            "updated_at": "2022-01-22T12:02:44.000000Z",
            "home_address": "semarang",
            "contact_number": "082772819182"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    },
    {
        "id": 103,
        "shop_id": 1,
        "customer_id": 6,
        "employee_id": 38,
        "created_at": "2022-01-31T02:09:28.000000Z",
        "updated_at": "2022-01-31T02:09:28.000000Z",
        "order_status_id": 1,
        "description": null,
        "value": null,
        "deleted_at": null,
        "total_sum": 2000,
        "paid_sum": 0,
        "customer": {
            "id": 6,
            "role_id": 6,
            "name": "Roni",
            "email": "roni@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-02T08:23:41.000000Z",
            "updated_at": "2022-01-22T15:30:35.000000Z",
            "home_address": "Gunung pati",
            "contact_number": "08728272811"
        },
        "employee": {
            "id": 38,
            "role_id": 5,
            "name": "Henri",
            "email": "henri@gmail.com",
            "avatar": "users\/default.png",
            "email_verified_at": null,
            "settings": [],
            "created_at": "2021-10-05T18:24:13.000000Z",
            "updated_at": "2022-01-22T11:57:55.000000Z",
            "home_address": null,
            "contact_number": "08273771881912"
        },
        "shop": {
            "id": 1,
            "user_id": 3,
            "name": "Laundry Sukses",
            "description": "Laundry di Gunungpati",
            "created_at": "2021-09-30T23:15:46.000000Z",
            "updated_at": "2021-09-30T23:15:46.000000Z"
        }
    }
]
```

### HTTP Request
`GET api/master/slave/{slaveid}/orders`


<!-- END_101c1d2839ba10ab84d78ec14f529780 -->

<!-- START_e3747737e7d1a92effe716551d2e6abe -->
## api/master/shop/{shopid}/customers
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/shop/1/customers" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/shop/1/customers"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 6,
        "role_id": 6,
        "name": "Roni",
        "email": "roni@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2021-10-02T08:23:41.000000Z",
        "updated_at": "2022-01-22T15:30:35.000000Z",
        "home_address": "Gunung pati",
        "contact_number": "08728272811"
    },
    {
        "id": 7,
        "role_id": 6,
        "name": "Customer2edit",
        "email": "customer2@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2021-10-02T08:24:14.000000Z",
        "updated_at": "2021-10-06T20:10:53.000000Z",
        "home_address": "Semarang",
        "contact_number": "816128"
    },
    {
        "id": 50,
        "role_id": 6,
        "name": "customer baruu",
        "email": "customer20@customer.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2021-12-13T11:22:37.000000Z",
        "updated_at": "2021-12-14T11:20:55.000000Z",
        "home_address": "Semarang",
        "contact_number": "98765456789"
    },
    {
        "id": 59,
        "role_id": 6,
        "name": "Customer 3",
        "email": "customer3@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2022-01-20T04:09:23.000000Z",
        "updated_at": "2022-01-20T04:09:23.000000Z",
        "home_address": "Semarang",
        "contact_number": "09876543"
    },
    {
        "id": 62,
        "role_id": 6,
        "name": "Sulis",
        "email": "sulis@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2022-01-23T02:05:39.000000Z",
        "updated_at": "2022-01-23T02:05:39.000000Z",
        "home_address": "Semarang",
        "contact_number": "08292728291"
    },
    {
        "id": 69,
        "role_id": 6,
        "name": "Zaenal",
        "email": "zaenal@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2022-01-25T02:25:21.000000Z",
        "updated_at": "2022-01-25T02:25:21.000000Z",
        "home_address": "Semarang",
        "contact_number": "0829272891"
    },
    {
        "id": 70,
        "role_id": 6,
        "name": "Tono",
        "email": "tono@tono.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2022-01-26T07:00:27.000000Z",
        "updated_at": "2022-01-26T07:00:27.000000Z",
        "home_address": "rahasia",
        "contact_number": "0909"
    },
    {
        "id": 71,
        "role_id": 6,
        "name": "Firoz",
        "email": "firoz@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2022-01-26T07:04:07.000000Z",
        "updated_at": "2022-01-26T07:04:07.000000Z",
        "home_address": "gunung pati",
        "contact_number": "0123456789876"
    }
]
```

### HTTP Request
`GET api/master/shop/{shopid}/customers`


<!-- END_e3747737e7d1a92effe716551d2e6abe -->

<!-- START_b6b0d013eee755fd3dd3b6b6d98f6629 -->
## api/master/shop/{shopid}/employee
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/shop/1/employee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/shop/1/employee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 8,
        "role_id": 5,
        "name": "Roland",
        "email": "Rol@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2021-10-02T08:24:46.000000Z",
        "updated_at": "2022-01-22T12:02:44.000000Z",
        "home_address": "semarang",
        "contact_number": "082772819182"
    },
    {
        "id": 38,
        "role_id": 5,
        "name": "Henri",
        "email": "henri@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2021-10-05T18:24:13.000000Z",
        "updated_at": "2022-01-22T11:57:55.000000Z",
        "home_address": null,
        "contact_number": "08273771881912"
    },
    {
        "id": 46,
        "role_id": 5,
        "name": "Rudi",
        "email": "Rudi@gmail.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2021-10-06T20:26:23.000000Z",
        "updated_at": "2022-01-22T12:03:05.000000Z",
        "home_address": "seamrang",
        "contact_number": "08272617171"
    },
    {
        "id": 72,
        "role_id": 5,
        "name": "reza",
        "email": "reza@reza.com",
        "avatar": "users\/default.png",
        "email_verified_at": null,
        "settings": [],
        "created_at": "2022-01-31T02:29:49.000000Z",
        "updated_at": "2022-01-31T02:29:49.000000Z",
        "home_address": null,
        "contact_number": "081900000001"
    }
]
```

### HTTP Request
`GET api/master/shop/{shopid}/employee`


<!-- END_b6b0d013eee755fd3dd3b6b6d98f6629 -->

<!-- START_7f5a8606452debf0d0a9453bbc308696 -->
## api/master/shop/{shopid}/orderscount
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/shop/1/orderscount" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/shop/1/orderscount"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
99
```

### HTTP Request
`GET api/master/shop/{shopid}/orderscount`


<!-- END_7f5a8606452debf0d0a9453bbc308696 -->

<!-- START_0030dd57965ac23a73d99f40d9c03cc8 -->
## api/master/shop/{shopid}/gettotalprice
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/shop/1/gettotalprice" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/shop/1/gettotalprice"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
22215000
```

### HTTP Request
`GET api/master/shop/{shopid}/gettotalprice`


<!-- END_0030dd57965ac23a73d99f40d9c03cc8 -->

<!-- START_5757e86798d136b963b7a13faffe3efb -->
## api/master/shop/{shopid}/getcurrentprofit
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/shop/1/getcurrentprofit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/shop/1/getcurrentprofit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
100
```

### HTTP Request
`GET api/master/shop/{shopid}/getcurrentprofit`


<!-- END_5757e86798d136b963b7a13faffe3efb -->

<!-- START_74c03b6657cb45ed0f7e0fa85e3fbccc -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/branch" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/branch`


<!-- END_74c03b6657cb45ed0f7e0fa85e3fbccc -->

<!-- START_3e39285255c88069135830485edaf610 -->
## api/master/register
> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/register" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/register"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/register`


<!-- END_3e39285255c88069135830485edaf610 -->

<!-- START_c79f62d41e5fe5bdc3318f699cce264b -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/packages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/packages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "name": "Paket Reguler",
        "description": "Paket Gratis untuk Coba-coba",
        "created_at": "2021-09-30T19:12:00.000000Z",
        "updated_at": "2021-09-30T19:12:51.000000Z",
        "price": 50000,
        "package_contents": [
            {
                "id": 1,
                "package_id": 1,
                "value": "1 cabang",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 2,
                "package_id": 1,
                "value": "unlimited transaksi",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 3,
                "package_id": 1,
                "value": "unlimited  employee",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 4,
                "package_id": 1,
                "value": "unlimited Customer",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 5,
                "package_id": 1,
                "value": "3 paket",
                "created_at": null,
                "updated_at": null
            }
        ]
    },
    {
        "id": 2,
        "name": "Paket Premium",
        "description": null,
        "created_at": "2021-09-30T19:12:00.000000Z",
        "updated_at": "2021-09-30T19:13:14.000000Z",
        "price": 100000,
        "package_contents": [
            {
                "id": 6,
                "package_id": 2,
                "value": "5 cabang",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 7,
                "package_id": 2,
                "value": "unlimited  transaksi",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 8,
                "package_id": 2,
                "value": "unlimited employee",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 9,
                "package_id": 2,
                "value": "unlimited Customer",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 10,
                "package_id": 2,
                "value": "10 paket",
                "created_at": null,
                "updated_at": null
            }
        ]
    },
    {
        "id": 3,
        "name": "Paket Enterpreneur",
        "description": null,
        "created_at": "2021-09-30T19:13:09.000000Z",
        "updated_at": "2021-09-30T19:13:09.000000Z",
        "price": 150000,
        "package_contents": [
            {
                "id": 11,
                "package_id": 3,
                "value": "10 cabang",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 12,
                "package_id": 3,
                "value": "unlimited transaksi",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 13,
                "package_id": 3,
                "value": "unlimited employee",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 14,
                "package_id": 3,
                "value": "unlimited customer",
                "created_at": null,
                "updated_at": null
            },
            {
                "id": 15,
                "package_id": 3,
                "value": "unlimited paket",
                "created_at": null,
                "updated_at": null
            }
        ]
    }
]
```

### HTTP Request
`GET api/master/packages`


<!-- END_c79f62d41e5fe5bdc3318f699cce264b -->

<!-- START_a7d9f5cc13139781d01c8f754012689f -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/packages/payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/packages/payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/packages/payment`


<!-- END_a7d9f5cc13139781d01c8f754012689f -->

<!-- START_c73d19a6ec0b159c6be6626c6cec24e7 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/payments/history" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/payments/history"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/payments/history`


<!-- END_c73d19a6ec0b159c6be6626c6cec24e7 -->

<!-- START_a429cb47ba0dc612145cb7fbfb74634f -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "master_id": 2,
        "slave_id": 3,
        "created_at": "2021-09-30T23:23:53.000000Z",
        "updated_at": "2021-09-30T23:23:53.000000Z"
    },
    {
        "id": 16,
        "master_id": 2,
        "slave_id": 54,
        "created_at": null,
        "updated_at": null
    },
    {
        "id": 17,
        "master_id": 2,
        "slave_id": 57,
        "created_at": null,
        "updated_at": null
    }
]
```

### HTTP Request
`GET api/master/branch`


<!-- END_a429cb47ba0dc612145cb7fbfb74634f -->

<!-- START_f663ea4a056e35a02999898f331e67ec -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/master/branch/{branch}`


<!-- END_f663ea4a056e35a02999898f331e67ec -->

<!-- START_416252a732449c6df80bacd5924a762e -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/master/branch/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/master/branch/{branch}`

`PATCH api/master/branch/{branch}`


<!-- END_416252a732449c6df80bacd5924a762e -->

<!-- START_b3ac63f507340db451817649b327a9a3 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/master/branch/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/master/branch/{branch}`


<!-- END_b3ac63f507340db451817649b327a9a3 -->

<!-- START_1dad800f297baec02c7c041023b3bc6b -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_service" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/master/branch_service`


<!-- END_1dad800f297baec02c7c041023b3bc6b -->

<!-- START_cab8b252bba26df8b3a71d3fdaef2595 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/branch_service" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/branch_service`


<!-- END_cab8b252bba26df8b3a71d3fdaef2595 -->

<!-- START_caa72864024bce3665a59d931876b4ba -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_service/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "id": 1,
    "service_category_id": 2,
    "name": "Layanan Express",
    "description": null,
    "price": 55000,
    "process_time": 24,
    "is_available": 1,
    "created_at": "2021-10-01T19:29:24.000000Z",
    "updated_at": "2021-10-01T19:29:24.000000Z",
    "shop_id": 1,
    "category": {
        "id": 2,
        "name": "Pakaian Halus",
        "description": "",
        "created_at": "2021-10-01T19:28:00.000000Z",
        "updated_at": "2021-10-02T09:22:58.000000Z",
        "service_unit_id": 1,
        "shop_id": null
    }
}
```

### HTTP Request
`GET api/master/branch_service/{branch_service}`


<!-- END_caa72864024bce3665a59d931876b4ba -->

<!-- START_18afeb9c6eb3fb9459e33ddc7dcbae27 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/master/branch_service/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/master/branch_service/{branch_service}`

`PATCH api/master/branch_service/{branch_service}`


<!-- END_18afeb9c6eb3fb9459e33ddc7dcbae27 -->

<!-- START_968203f20fba9c0d8bb801771cf5b0c8 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/master/branch_service/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/master/branch_service/{branch_service}`


<!-- END_968203f20fba9c0d8bb801771cf5b0c8 -->

<!-- START_f4e85c84237fe009159323faa57926bc -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_employee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_employee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/master/branch_employee`


<!-- END_f4e85c84237fe009159323faa57926bc -->

<!-- START_247bde4cb9c357992fc9686fa30f0b7c -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/branch_employee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_employee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/branch_employee`


<!-- END_247bde4cb9c357992fc9686fa30f0b7c -->

<!-- START_7c874d3a3ae40cc3f220c0f702fe3855 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_employee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_employee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "id": 1,
    "role_id": 1,
    "name": "Admin",
    "email": "admin@admin.com",
    "avatar": "users\/default.png",
    "email_verified_at": null,
    "settings": [],
    "created_at": "2021-09-27T21:24:44.000000Z",
    "updated_at": "2021-09-27T21:24:44.000000Z",
    "home_address": null,
    "contact_number": null
}
```

### HTTP Request
`GET api/master/branch_employee/{branch_employee}`


<!-- END_7c874d3a3ae40cc3f220c0f702fe3855 -->

<!-- START_8d3e1b0dc7886d48df754638f3176866 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/master/branch_employee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_employee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/master/branch_employee/{branch_employee}`

`PATCH api/master/branch_employee/{branch_employee}`


<!-- END_8d3e1b0dc7886d48df754638f3176866 -->

<!-- START_4acfd9c109aa50dec1ee94a7816df300 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/master/branch_employee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_employee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/master/branch_employee/{branch_employee}`


<!-- END_4acfd9c109aa50dec1ee94a7816df300 -->

<!-- START_2aed852b95b3dbed934fa3093eb8e2ca -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_customer" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_customer"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/master/branch_customer`


<!-- END_2aed852b95b3dbed934fa3093eb8e2ca -->

<!-- START_ebc43f0b307e03f8b50f17225e071de8 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/branch_customer" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_customer"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/branch_customer`


<!-- END_ebc43f0b307e03f8b50f17225e071de8 -->

<!-- START_b26822ea7b42e0f4df2734574258e41f -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_customer/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_customer/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "id": 1,
    "role_id": 1,
    "name": "Admin",
    "email": "admin@admin.com",
    "avatar": "users\/default.png",
    "email_verified_at": null,
    "settings": [],
    "created_at": "2021-09-27T21:24:44.000000Z",
    "updated_at": "2021-09-27T21:24:44.000000Z",
    "home_address": null,
    "contact_number": null
}
```

### HTTP Request
`GET api/master/branch_customer/{branch_customer}`


<!-- END_b26822ea7b42e0f4df2734574258e41f -->

<!-- START_35a9c723e14881c55bc0d4dee7ab058f -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/master/branch_customer/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_customer/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/master/branch_customer/{branch_customer}`

`PATCH api/master/branch_customer/{branch_customer}`


<!-- END_35a9c723e14881c55bc0d4dee7ab058f -->

<!-- START_e96606effacea4d551e6bdffed79289c -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/master/branch_customer/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_customer/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/master/branch_customer/{branch_customer}`


<!-- END_e96606effacea4d551e6bdffed79289c -->

<!-- START_6f3deaad0d1c9583eece5482d14685df -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_service_category" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service_category"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "name": "Selimut ",
        "description": "",
        "created_at": "2021-10-01T19:27:48.000000Z",
        "updated_at": "2021-10-01T19:27:48.000000Z",
        "service_unit_id": 2,
        "shop_id": null
    },
    {
        "id": 2,
        "name": "Pakaian Halus",
        "description": "",
        "created_at": "2021-10-01T19:28:00.000000Z",
        "updated_at": "2021-10-02T09:22:58.000000Z",
        "service_unit_id": 1,
        "shop_id": null
    },
    {
        "id": 3,
        "name": "Selimut Halus",
        "description": null,
        "created_at": "2022-01-13T08:13:38.000000Z",
        "updated_at": "2022-01-13T08:13:38.000000Z",
        "service_unit_id": 1,
        "shop_id": 1
    },
    {
        "id": 4,
        "name": "Pakaian Halus",
        "description": null,
        "created_at": "2022-01-13T08:42:31.000000Z",
        "updated_at": "2022-01-13T08:42:31.000000Z",
        "service_unit_id": 1,
        "shop_id": 1
    },
    {
        "id": 5,
        "name": "Pakaian Halus",
        "description": null,
        "created_at": "2022-01-13T08:43:54.000000Z",
        "updated_at": "2022-01-13T08:43:54.000000Z",
        "service_unit_id": 1,
        "shop_id": 1
    },
    {
        "id": 8,
        "name": "Karpet kasar",
        "description": null,
        "created_at": "2022-01-19T02:06:54.000000Z",
        "updated_at": "2022-01-19T02:06:54.000000Z",
        "service_unit_id": 2,
        "shop_id": 1
    },
    {
        "id": 10,
        "name": "jeans",
        "description": null,
        "created_at": "2022-01-20T02:35:01.000000Z",
        "updated_at": "2022-01-20T02:35:01.000000Z",
        "service_unit_id": 2,
        "shop_id": 1
    },
    {
        "id": 11,
        "name": "bantal",
        "description": null,
        "created_at": "2022-01-31T02:32:35.000000Z",
        "updated_at": "2022-01-31T02:32:35.000000Z",
        "service_unit_id": 2,
        "shop_id": 1
    }
]
```

### HTTP Request
`GET api/master/branch_service_category`


<!-- END_6f3deaad0d1c9583eece5482d14685df -->

<!-- START_a008a1735862eb737fb2410b9a442a89 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/branch_service_category" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service_category"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/branch_service_category`


<!-- END_a008a1735862eb737fb2410b9a442a89 -->

<!-- START_bc9cd8fdfb235badff49d437a3c4adcd -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/branch_service_category/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service_category/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/master/branch_service_category/{branch_service_category}`


<!-- END_bc9cd8fdfb235badff49d437a3c4adcd -->

<!-- START_f57f96a1e64b22844421945d25d8f28c -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/master/branch_service_category/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service_category/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/master/branch_service_category/{branch_service_category}`

`PATCH api/master/branch_service_category/{branch_service_category}`


<!-- END_f57f96a1e64b22844421945d25d8f28c -->

<!-- START_29728e7de7b22ef790bbe473714b2275 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/master/branch_service_category/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/branch_service_category/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/master/branch_service_category/{branch_service_category}`


<!-- END_29728e7de7b22ef790bbe473714b2275 -->

<!-- START_fe59000cc192dd59d11689b4681488f8 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/master_payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/master_payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/master/master_payment`


<!-- END_fe59000cc192dd59d11689b4681488f8 -->

<!-- START_20a8ee848c2a221155c105d0c6af5db9 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/master/master_payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/master_payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/master/master_payment`


<!-- END_20a8ee848c2a221155c105d0c6af5db9 -->

<!-- START_b427edefbc2e96f0d807af483a14500c -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/master/master_payment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/master_payment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "id": 1,
    "name": "Pembayaran Lunas",
    "value": 500000,
    "status": "success",
    "payment_type": "App\\Models\\Order",
    "payment_id": 35,
    "created_at": null,
    "updated_at": null,
    "package_user": null
}
```

### HTTP Request
`GET api/master/master_payment/{master_payment}`


<!-- END_b427edefbc2e96f0d807af483a14500c -->

<!-- START_bfb3c9ee5d302d138d2346fa563c9b97 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/master/master_payment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/master_payment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/master/master_payment/{master_payment}`

`PATCH api/master/master_payment/{master_payment}`


<!-- END_bfb3c9ee5d302d138d2346fa563c9b97 -->

<!-- START_f7402df80cac2487afec05ff573f2895 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/master/master_payment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/master/master_payment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/master/master_payment/{master_payment}`


<!-- END_f7402df80cac2487afec05ff573f2895 -->

<!-- START_0e120ae7de63e2b9b3df2bf9be190cf8 -->
## api/slave/user/order/{orderid}/payment
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/user/order/1/payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/user/order/1/payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/user/order/{orderid}/payment`


<!-- END_0e120ae7de63e2b9b3df2bf9be190cf8 -->

<!-- START_e3ff71468ec02ef0b6c4af4cc0d5ba1f -->
## api/slave/shop/order/search
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/order/search" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/order/search"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/order/search`


<!-- END_e3ff71468ec02ef0b6c4af4cc0d5ba1f -->

<!-- START_7ba7ca3fa46eaf5b9d878d10cb06ad3c -->
## api/slave/shop/{shopid}/employees
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/1/employees" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/1/employees"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/{shopid}/employees`


<!-- END_7ba7ca3fa46eaf5b9d878d10cb06ad3c -->

<!-- START_ae4ea83f9d2167a6b5dff4522d050ee5 -->
## api/slave/shop/addemployee
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/addemployee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/addemployee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/addemployee`


<!-- END_ae4ea83f9d2167a6b5dff4522d050ee5 -->

<!-- START_352b0cde3cfdab6aff78d33866dcf08a -->
## api/slave/shop/deleteEmployee/{employeeid}
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/deleteEmployee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/deleteEmployee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/deleteEmployee/{employeeid}`


<!-- END_352b0cde3cfdab6aff78d33866dcf08a -->

<!-- START_a63bdac29d253e4407d850b6b9bc5e0a -->
## api/slave/shop/editEmployee/{employeeid}
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/editEmployee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/editEmployee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/editEmployee/{employeeid}`


<!-- END_a63bdac29d253e4407d850b6b9bc5e0a -->

<!-- START_f3fe2a15442e67d73e9a213e845eaef2 -->
## api/slave/shop/searchEmployee
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/searchEmployee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/searchEmployee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/searchEmployee`


<!-- END_f3fe2a15442e67d73e9a213e845eaef2 -->

<!-- START_bae22694b3d027cc06cf002526cedf76 -->
## api/slave/shop/{shopid}/customers
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/1/customers" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/1/customers"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/{shopid}/customers`


<!-- END_bae22694b3d027cc06cf002526cedf76 -->

<!-- START_33676a59e880be3b7c56879f41561cd3 -->
## api/slave/shop/searchCustomer
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/searchCustomer" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/searchCustomer"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/searchCustomer`


<!-- END_33676a59e880be3b7c56879f41561cd3 -->

<!-- START_899d10798c55576b37b101bb394db9e3 -->
## api/slave/shop/{shopid}/getServicesByShop
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/1/getServicesByShop" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/1/getServicesByShop"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/{shopid}/getServicesByShop`


<!-- END_899d10798c55576b37b101bb394db9e3 -->

<!-- START_c9e4d2fa64aa0167865a7c3006725e77 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/getServiceCategories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/getServiceCategories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/getServiceCategories`


<!-- END_c9e4d2fa64aa0167865a7c3006725e77 -->

<!-- START_5febe4b3571297d1e2f1aa2a82e551fb -->
## api/slave/shop/addService
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/addService" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/addService"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/addService`


<!-- END_5febe4b3571297d1e2f1aa2a82e551fb -->

<!-- START_3df60eae90290afc665d49b7a24d80a5 -->
## api/slave/shop/deleteService
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/deleteService" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/deleteService"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/deleteService`


<!-- END_3df60eae90290afc665d49b7a24d80a5 -->

<!-- START_2fa272e671aa57fac331974e5f30c51f -->
## api/slave/shop/{shopid}/getOrdersByShop
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/1/getOrdersByShop" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/1/getOrdersByShop"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/{shopid}/getOrdersByShop`


<!-- END_2fa272e671aa57fac331974e5f30c51f -->

<!-- START_d4350788e5d7151568a6f454c1e96c7d -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/addOrder" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/addOrder"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/addOrder`


<!-- END_d4350788e5d7151568a6f454c1e96c7d -->

<!-- START_4f00d4eb1e29cc454250976a13771264 -->
## api/slave/shop/order/{orderid}/payment
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/order/1/payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/order/1/payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/order/{orderid}/payment`


<!-- END_4f00d4eb1e29cc454250976a13771264 -->

<!-- START_3679ec0525bd8027998f3f8ca08efa3e -->
## api/slave/shop/order/report
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/order/report" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/order/report"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/order/report`


<!-- END_3679ec0525bd8027998f3f8ca08efa3e -->

<!-- START_2a3fcbe8799e0228b383fc02290eff72 -->
## api/slave/shop/{shopid}/getOrdersReportByShop
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/1/getOrdersReportByShop" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/1/getOrdersReportByShop"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/{shopid}/getOrdersReportByShop`


<!-- END_2a3fcbe8799e0228b383fc02290eff72 -->

<!-- START_3a903566d9574f9e8634711cadc3a939 -->
## api/slave/shop/{shopid}/queueorder
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/1/queueorder" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/1/queueorder"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/{shopid}/queueorder`


<!-- END_3a903566d9574f9e8634711cadc3a939 -->

<!-- START_278de3fc479a87508b8d813988d7bc4c -->
## api/slave/getorder
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getorder" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getorder"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getorder`


<!-- END_278de3fc479a87508b8d813988d7bc4c -->

<!-- START_bb5cdd2c04dd433e9a4957b60f787f8f -->
## api/slave/shop/searchAttendances
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/shop/searchAttendances" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/searchAttendances"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/shop/searchAttendances`


<!-- END_bb5cdd2c04dd433e9a4957b60f787f8f -->

<!-- START_41e5e663a2c88643e16af6376bb76cd3 -->
## api/slave/shop/orderscountbymonth/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/orderscountbymonth/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/orderscountbymonth/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/orderscountbymonth/{shopid}`


<!-- END_41e5e663a2c88643e16af6376bb76cd3 -->

<!-- START_b45b37e59cd183991c469d1c7a038dd2 -->
## api/slave/shop/paymentscountbymonth/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/shop/paymentscountbymonth/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/shop/paymentscountbymonth/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/shop/paymentscountbymonth/{shopid}`


<!-- END_b45b37e59cd183991c469d1c7a038dd2 -->

<!-- START_c4421895b9e597dd1ffb46bd62a271d6 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/services" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/services"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/services`


<!-- END_c4421895b9e597dd1ffb46bd62a271d6 -->

<!-- START_51fbcf10fe84e5bcf88fd5cffa52601d -->
## api/slave/deleteservices
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/deleteservices" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/deleteservices"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/deleteservices`


<!-- END_51fbcf10fe84e5bcf88fd5cffa52601d -->

<!-- START_53cbe06ab1199baaa6553633eda41622 -->
## api/slave/getservices/{categoryid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getservices/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getservices/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getservices/{categoryid}`


<!-- END_53cbe06ab1199baaa6553633eda41622 -->

<!-- START_82c0bd0ee7b955c94fc756f37466b090 -->
## api/slave/getOrderServiceStatus
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/getOrderServiceStatus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getOrderServiceStatus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/getOrderServiceStatus`


<!-- END_82c0bd0ee7b955c94fc756f37466b090 -->

<!-- START_eca2da88df7c2936d32204f186031e8e -->
## api/slave/updateStatusService
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/updateStatusService" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/updateStatusService"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/updateStatusService`


<!-- END_eca2da88df7c2936d32204f186031e8e -->

<!-- START_664c161b09802b7b7875d7d691ffb4bc -->
## api/slave/deletecategories
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/deletecategories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/deletecategories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/deletecategories`


<!-- END_664c161b09802b7b7875d7d691ffb4bc -->

<!-- START_f6f2e7a1f3b8e982fb41a9c1afbc07dd -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/updatecustomer" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/updatecustomer"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/updatecustomer`


<!-- END_f6f2e7a1f3b8e982fb41a9c1afbc07dd -->

<!-- START_71d944557f65089f3c4fd20f4440eb4a -->
## api/slave/searchOrders
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/searchOrders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/searchOrders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/searchOrders`


<!-- END_71d944557f65089f3c4fd20f4440eb4a -->

<!-- START_8bdaf5789d3469f2ea3809628724ec5b -->
## api/slave/updateorderstatus
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/updateorderstatus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/updateorderstatus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/updateorderstatus`


<!-- END_8bdaf5789d3469f2ea3809628724ec5b -->

<!-- START_14a97dbf1688ebf39ff9ba7e88da8306 -->
## api/slave/getorderbymonth/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getorderbymonth/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getorderbymonth/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getorderbymonth/{shopid}`


<!-- END_14a97dbf1688ebf39ff9ba7e88da8306 -->

<!-- START_8440aaff5e7b4c36b6ce4c1885d36b21 -->
## api/slave/getorderbyweek/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getorderbyweek/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getorderbyweek/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getorderbyweek/{shopid}`


<!-- END_8440aaff5e7b4c36b6ce4c1885d36b21 -->

<!-- START_be149f758d0976018deda56f31c5843e -->
## api/slave/getorderbyday/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getorderbyday/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getorderbyday/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getorderbyday/{shopid}`


<!-- END_be149f758d0976018deda56f31c5843e -->

<!-- START_d45646dbe8b1b78f9279242c2f559ad8 -->
## api/slave/getCountProfitOrdersByDay/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getCountProfitOrdersByDay/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getCountProfitOrdersByDay/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getCountProfitOrdersByDay/{shopid}`


<!-- END_d45646dbe8b1b78f9279242c2f559ad8 -->

<!-- START_0e5298b4a3a95a703d123b39655db5c1 -->
## api/slave/getCountProfitOrdersByWeek/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getCountProfitOrdersByWeek/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getCountProfitOrdersByWeek/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getCountProfitOrdersByWeek/{shopid}`


<!-- END_0e5298b4a3a95a703d123b39655db5c1 -->

<!-- START_fe9a491cfe1f46ac04822afba4a5ed35 -->
## api/slave/getCountProfitOrdersByMonth/{shopid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/getCountProfitOrdersByMonth/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/getCountProfitOrdersByMonth/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/getCountProfitOrdersByMonth/{shopid}`


<!-- END_fe9a491cfe1f46ac04822afba4a5ed35 -->

<!-- START_d6017e8fe539054977d2031f0c1132af -->
## api/slave/attendance/out
> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/attendance/out" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendance/out"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/attendance/out`


<!-- END_d6017e8fe539054977d2031f0c1132af -->

<!-- START_d4ef0ad628634a2ead8bf3a55ead52f8 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/deletecustomers" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/deletecustomers"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/deletecustomers`


<!-- END_d4ef0ad628634a2ead8bf3a55ead52f8 -->

<!-- START_ee5635aa2c05ab45291f5ae0a1207ee5 -->
## api/slave/attendance/getemployeeattendances/{employeeid}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/attendance/getemployeeattendances/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendance/getemployeeattendances/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/attendance/getemployeeattendances/{employeeid}`


<!-- END_ee5635aa2c05ab45291f5ae0a1207ee5 -->

<!-- START_731d74219282dfbb1a85f151da142098 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/service" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/service"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/service`


<!-- END_731d74219282dfbb1a85f151da142098 -->

<!-- START_6e5b7ddd251f93a4cd4e60814a968e09 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/service" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/service"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/service`


<!-- END_6e5b7ddd251f93a4cd4e60814a968e09 -->

<!-- START_3bfff116b90719008e6acf14b24fe54d -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/service/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/service/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/service/{service}`


<!-- END_3bfff116b90719008e6acf14b24fe54d -->

<!-- START_ad358dd6aced1e004e8c67cbc26e0fae -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/service/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/service/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/service/{service}`

`PATCH api/slave/service/{service}`


<!-- END_ad358dd6aced1e004e8c67cbc26e0fae -->

<!-- START_ace097582f50c0f168b950f766045f62 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/service/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/service/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/service/{service}`


<!-- END_ace097582f50c0f168b950f766045f62 -->

<!-- START_765580f500bb561f12d774d6943749db -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/customer" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/customer"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/customer`


<!-- END_765580f500bb561f12d774d6943749db -->

<!-- START_6f225809eeeb1ad6579075a2b8272f9b -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/customer" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/customer"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/customer`


<!-- END_6f225809eeeb1ad6579075a2b8272f9b -->

<!-- START_e41a079f578e6ba16a5de6102acc68e8 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/customer/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/customer/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/customer/{customer}`


<!-- END_e41a079f578e6ba16a5de6102acc68e8 -->

<!-- START_b2ef27f6e398f02d6f3263efe0ed8f0b -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/customer/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/customer/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/customer/{customer}`

`PATCH api/slave/customer/{customer}`


<!-- END_b2ef27f6e398f02d6f3263efe0ed8f0b -->

<!-- START_5037b510d15d0a57bb8422564c732e4d -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/customer/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/customer/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/customer/{customer}`


<!-- END_5037b510d15d0a57bb8422564c732e4d -->

<!-- START_6c1faa8f95d0fa768fb362432a1d07aa -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/employee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/employee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/employee`


<!-- END_6c1faa8f95d0fa768fb362432a1d07aa -->

<!-- START_dfb74cc63a59562287a29949e694941d -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/employee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/employee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/employee`


<!-- END_dfb74cc63a59562287a29949e694941d -->

<!-- START_51b9316c9670b92641b4d030ebe1d7e4 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/employee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/employee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/employee/{employee}`


<!-- END_51b9316c9670b92641b4d030ebe1d7e4 -->

<!-- START_38ca06129b3eb0a35eced34086d78651 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/employee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/employee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/employee/{employee}`

`PATCH api/slave/employee/{employee}`


<!-- END_38ca06129b3eb0a35eced34086d78651 -->

<!-- START_92e9b53a58c2b0f3840e1a3746a4bbab -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/employee/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/employee/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/employee/{employee}`


<!-- END_92e9b53a58c2b0f3840e1a3746a4bbab -->

<!-- START_e7c649f25b7b5271803ce503a001a68f -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/order`


<!-- END_e7c649f25b7b5271803ce503a001a68f -->

<!-- START_ff4ccb1bad23f2c520035a97486b1560 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/order`


<!-- END_ff4ccb1bad23f2c520035a97486b1560 -->

<!-- START_2aa078b67f2a2366c873e978a5f67ddb -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/order/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/order/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/order/{order}`


<!-- END_2aa078b67f2a2366c873e978a5f67ddb -->

<!-- START_4e42486ff2e099c3407c1f1daa86457f -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/order/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/order/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/order/{order}`

`PATCH api/slave/order/{order}`


<!-- END_4e42486ff2e099c3407c1f1daa86457f -->

<!-- START_e1bf62bf1f9b8bf404642815a8aa351c -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/order/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/order/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/order/{order}`


<!-- END_e1bf62bf1f9b8bf404642815a8aa351c -->

<!-- START_fdd0bbf9378361ce7fedd28c93558261 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/payment`


<!-- END_fdd0bbf9378361ce7fedd28c93558261 -->

<!-- START_35ee14cb385b6f7ae935d67ccda5c78c -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/payment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/payment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/payment`


<!-- END_35ee14cb385b6f7ae935d67ccda5c78c -->

<!-- START_b473b12655d358cb7ae049ddc5f3062a -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/payment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/payment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/payment/{payment}`


<!-- END_b473b12655d358cb7ae049ddc5f3062a -->

<!-- START_7a1c2cc622b5918de7bb07d80f7b8dd4 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/payment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/payment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/payment/{payment}`

`PATCH api/slave/payment/{payment}`


<!-- END_7a1c2cc622b5918de7bb07d80f7b8dd4 -->

<!-- START_ce84aca41543d466fbdd31b67e04dd0b -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/payment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/payment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/payment/{payment}`


<!-- END_ce84aca41543d466fbdd31b67e04dd0b -->

<!-- START_2e96ed94afa130579624625ca17924c7 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/orderstatus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/orderstatus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/orderstatus`


<!-- END_2e96ed94afa130579624625ca17924c7 -->

<!-- START_0aec59da6109a992dceb97c3c0579cea -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/orderstatus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/orderstatus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/orderstatus`


<!-- END_0aec59da6109a992dceb97c3c0579cea -->

<!-- START_be6cb16f605602a63867689fc601b96d -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/orderstatus/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/orderstatus/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/orderstatus/{orderstatus}`


<!-- END_be6cb16f605602a63867689fc601b96d -->

<!-- START_a586506029486341afd8e7c31dbff83c -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/orderstatus/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/orderstatus/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/orderstatus/{orderstatus}`

`PATCH api/slave/orderstatus/{orderstatus}`


<!-- END_a586506029486341afd8e7c31dbff83c -->

<!-- START_b28d2c2c1313a3c401a9900aa2ec0515 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/orderstatus/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/orderstatus/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/orderstatus/{orderstatus}`


<!-- END_b28d2c2c1313a3c401a9900aa2ec0515 -->

<!-- START_c712474a70cd538985189ebe1c40c9ef -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/attendances" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendances"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/attendances`


<!-- END_c712474a70cd538985189ebe1c40c9ef -->

<!-- START_f743473b643fb9bbe68cdadbc3a86223 -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/attendances" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendances"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/attendances`


<!-- END_f743473b643fb9bbe68cdadbc3a86223 -->

<!-- START_345e2c6f5e9d3ad5461af6d8dd2b1df5 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/attendances/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendances/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/attendances/{attendance}`


<!-- END_345e2c6f5e9d3ad5461af6d8dd2b1df5 -->

<!-- START_7299646e9a7ec9e3718f3354611518b0 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/attendances/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendances/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/attendances/{attendance}`

`PATCH api/slave/attendances/{attendance}`


<!-- END_7299646e9a7ec9e3718f3354611518b0 -->

<!-- START_8ac5a1a624c0ca4da972ff44f2d05d6b -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/attendances/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendances/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/attendances/{attendance}`


<!-- END_8ac5a1a624c0ca4da972ff44f2d05d6b -->

<!-- START_2f4cabc7fc76dd7efb73d236170d6da1 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/serviceunits" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/serviceunits"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/serviceunits`


<!-- END_2f4cabc7fc76dd7efb73d236170d6da1 -->

<!-- START_0e1222ff6cd0b810ffd51e51300c572e -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/serviceunits" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/serviceunits"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/serviceunits`


<!-- END_0e1222ff6cd0b810ffd51e51300c572e -->

<!-- START_e21c10465d0eafbab7b2ad87cecbc264 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/serviceunits/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/serviceunits/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/serviceunits/{serviceunit}`


<!-- END_e21c10465d0eafbab7b2ad87cecbc264 -->

<!-- START_8774cb9aed9f346b64e1fbcdc31faef8 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/serviceunits/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/serviceunits/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/serviceunits/{serviceunit}`

`PATCH api/slave/serviceunits/{serviceunit}`


<!-- END_8774cb9aed9f346b64e1fbcdc31faef8 -->

<!-- START_e120256438fa2efe48b5fc43b6a51eec -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/serviceunits/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/serviceunits/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/serviceunits/{serviceunit}`


<!-- END_e120256438fa2efe48b5fc43b6a51eec -->

<!-- START_60cfdf4ee8da62a3e7ef2cf7c828a3e1 -->
## Display a listing of the resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/servicecategories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/servicecategories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/servicecategories`


<!-- END_60cfdf4ee8da62a3e7ef2cf7c828a3e1 -->

<!-- START_d90fed8ac31eb0c74ad4d26085223f2a -->
## Store a newly created resource in storage.

> Example request:

```bash
curl -X POST \
    "http://localhost/api/slave/servicecategories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/servicecategories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/slave/servicecategories`


<!-- END_d90fed8ac31eb0c74ad4d26085223f2a -->

<!-- START_0634600d8ba286390d1dd763b5fba2d1 -->
## Display the specified resource.

> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/servicecategories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/servicecategories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/servicecategories/{servicecategory}`


<!-- END_0634600d8ba286390d1dd763b5fba2d1 -->

<!-- START_e26e64e021c08c4c95671e613ec95228 -->
## Update the specified resource in storage.

> Example request:

```bash
curl -X PUT \
    "http://localhost/api/slave/servicecategories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/servicecategories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/slave/servicecategories/{servicecategory}`

`PATCH api/slave/servicecategories/{servicecategory}`


<!-- END_e26e64e021c08c4c95671e613ec95228 -->

<!-- START_3b5cdf61da29e88cfb2a92650c3dc5d5 -->
## Remove the specified resource from storage.

> Example request:

```bash
curl -X DELETE \
    "http://localhost/api/slave/servicecategories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/servicecategories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/slave/servicecategories/{servicecategory}`


<!-- END_3b5cdf61da29e88cfb2a92650c3dc5d5 -->

<!-- START_a8c3777965f6b757fa048724aaa81f39 -->
## api/slave/attendance/monthlyattendancereport1/{shopId}
> Example request:

```bash
curl -X GET \
    -G "http://localhost/api/slave/attendance/monthlyattendancereport1/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://localhost/api/slave/attendance/monthlyattendancereport1/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/slave/attendance/monthlyattendancereport1/{shopId}`


<!-- END_a8c3777965f6b757fa048724aaa81f39 -->


