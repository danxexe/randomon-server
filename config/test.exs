use Mix.Config

config :phoenix, Game.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_game_key",
  session_secret: "#N+4E=!Z61(JU(&GV$F!#O8^&*LBBFB#76^C%1G5BU4^1F4WU56OU26HFC765JI92K%P4LV9=18"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


