defmodule Game.Router do
  use Phoenix.Router

  get "/", Game.PageController, :index, as: :pages

end
