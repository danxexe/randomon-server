defmodule Game.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  get "/", Game.PageController, :index, as: :pages

  channel "world", Game.WorldChannel

end
