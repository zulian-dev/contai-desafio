# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :contai_desafio,
  ecto_repos: [ContaiDesafio.Repo]

# Configures the endpoint
config :contai_desafio, ContaiDesafioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PapVIDmCQuaMdFV+9JwYsmMT7/apklQtfnrIUGvCkVNZqWUZ5ldqt3UEseDWUNYW",
  render_errors: [view: ContaiDesafioWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ContaiDesafio.PubSub,
  live_view: [signing_salt: "Oo6Fb+5g"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
