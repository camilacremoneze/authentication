# Auth

When you integrate your Application with different APIs you should sometimes implement different ways of Authentication,
this project basic shows two ways of authenticate (`api_key and basic_auth`) using `plug`.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can execute to auth with api-key: `curl -H "Authorization: some_token" localhost:4000/api/token` 
Now you can execute to auth with basic-auth: `curl -u some_user:password localhost:4000/api/basic_auth` 
