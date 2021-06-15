# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :lighting,
  ecto_repos: [Lighting.Repo]

config :lighting_web,
  ecto_repos: [Lighting.Repo],
  generators: [context_app: :lighting]

# Configures the endpoint
config :lighting_web, LightingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bPPEfLV/qhxel3C56e7x6/H8RfmEpYQIq51DmIp4Y4Q+qVRXM7/pT4wJI1qm+OV2",
  render_errors: [view: LightingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Lighting.PubSub,
  live_view: [signing_salt: "EK9Dd5lC"]

# Configures Elixir's Logger
config :logger, :console,
  level: :info,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :lifx,
  multicast: {255, 255, 255, 255},
  dead_time: 25 * 1000,
  poll_state_time: 5000,
  poll_discover_time: 10 * 1000,
  # Should be at least max_retries*wait_between_retry.
  max_api_timeout: 60000,
  max_retries: 10,
  wait_between_retry: 5000,
  udp: Lifx.Udp


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
