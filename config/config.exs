# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Game.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_game_key",
  session_secret: "#N+4E=!Z61(JU(&GV$F!#O8^&*LBBFB#76^C%1G5BU4^1F4WU56OU26HFC765JI92K%P4LV9=18",
  catch_errors: true,
  debug_errors: false,
  error_controller: Game.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
