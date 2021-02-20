# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hive,
  ecto_repos: [Hive.Repo]

# Configures the endpoint
config :hive, HiveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AGDCu3+r2UT1adMM6cGYiZe0TG8Xm0ulNWP8eR55a3ucpTbiZBuLmXrrBbBCh+Fj",
  render_errors: [view: HiveWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Hive.PubSub,
  live_view: [signing_salt: "mBcSe2AC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :tesla, adapter: Tesla.Adapter.Hackney

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
