defmodule HiveWeb.RootController do
  @moduledoc """
  Custom route examples
  """
  use HiveWeb, :controller

  def index(conn, _params) do
    json(conn, "Home Page of Hive API 🐝.-° Bzzzz")
  end

  @spec doRequest(Plug.Conn.t(), any) :: Plug.Conn.t()
  def doRequest(conn, _params) do
    {:ok, response} = Tesla.get("http://worldtimeapi.org/api/timezone/Asia")
    json(conn, response.body)
  end

  def notFound(conn, _params) do
    html(conn, "
    <h1>404 bzzz</h1>
    ")
  end

  def xssRoute(conn, %{"code" => code}) do
    # never do smth like this
    # access with ex.
    # http://localhost:4000/xss?code=alert(0)
    html(conn, "
    <!DOCTYPE html>
      <html>

      <head>
          <title>Document</title>
      </head>

      <body>
          <h1>Most def a xss vuln here</h1>

          do haves alot of lines to c-ode here?

          <script>
              #{code}
          </script>

      </body>

      </html>
    ")
  end
end
