defmodule HiveWeb.Router do
  use HiveWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HiveWeb do
    pipe_through :api
  end

  # Custom Routes
  scope "/", HiveWeb do
    pipe_through :api
    get "/", RootController, :index
  end

  scope "/tz", HiveWeb do
    pipe_through :api
    get "/asia", RootController, :doRequest
  end

  scope "/xss", HiveWeb do
    pipe_through :api
    get "/", RootController, :xssRoute
  end


  if Mix.env() in [:dev, :test] do
    # Enables LiveDashboard only for development
    #
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: HiveWeb.Telemetry
    end

  end


  # 404 catch all MUST be last defined route
  scope "/", HiveWeb do
    get "/*path", RootController, :notFound
  end

end
