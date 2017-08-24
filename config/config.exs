# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :grab_cikgu,
  ecto_repos: [GrabCikgu.Repo]

# Configures the endpoint
config :grab_cikgu, GrabCikgu.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eeqk4/yeFrK6bZJ/YTiHzAwxBWT9yCpqvqlF9J4Y2fy3sRr6zO+8hkTjWDfrEG0f",
  render_errors: [view: GrabCikgu.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GrabCikgu.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
