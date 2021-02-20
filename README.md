# Hive

## Example Elixir project with custom routes

A open source demo project to demonstrate how to achieve web API custom routes in Phoenix 

Do what you want with this code

available routes: 
 
http://localhost:4000/tz/asia

http://localhost:4000/

http://localhost:4000/tz/asia

http://localhost:4000/xss?code=

404 in case nothing matched

## Implementation

Check the files 

`lib/hive_web/controllers/root_controller.ex` 

`lib/hive_web/router.ex`

Besides the Tesla dependency, that's it.

### tl:dr;

- write a custom controller
- register it in the router so it can be executed

Custom controller example code

``` elixir
defmodule yourProjectName.CustomController do
  use yourProjectName, :controller

  def customRouteFunction(conn, _params) do
    json(conn, "The custom route response")
  end
end
```

Register it in your `router.ex`

``` elixir
  scope "/", yourProjectName do
    pipe_through :api
    get "/", CustomController, :customRouteFunction
  end
```

Then requesting localhost:4000 with a browser will return `The custom route response`

---

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
