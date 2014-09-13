use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, Game.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_game_key",
  session_secret: "#N+4E=!Z61(JU(&GV$F!#O8^&*LBBFB#76^C%1G5BU4^1F4WU56OU26HFC765JI92K%P4LV9=18"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

