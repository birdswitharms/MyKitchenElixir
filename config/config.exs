# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :myKitchen,
  ecto_repos: [MyKitchen.Repo]

# Configures the endpoint
config :myKitchen, MyKitchenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B+p2Djzz92PmxVBDcLAR3yuZFYh3S7pGIY7oP/S/9dieYTvBDIzT6JPxifC8RVg/",
  render_errors: [view: MyKitchenWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyKitchen.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :myKitchen, MyKitchenWeb.Guardian,
  issuer: "myKitchen",
  secret_key: "Secret key. You can use `mix guardian.gen.secret` to get one"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
