# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_liveview,
  ecto_repos: [PhxLiveview.Repo]

# Configures the endpoint
config :phx_liveview, PhxLiveviewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V8vwvQ5pKCw0t5HSDrVdVXbgvOmQ+IMdSKmsZFge7iC3QYfZJ/FI8T0rcAZkwHP6",
  render_errors: [view: PhxLiveviewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxLiveview.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "m/D0UuMdkxNrrtHZA6DDGIoSFMQJXnDx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, leex: Phoenix.LiveView.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
