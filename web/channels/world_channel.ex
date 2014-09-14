defmodule Game.WorldChannel do
  use Phoenix.Channel
  alias Phoenix.Socket

  def join(socket, _hash, message) do
    player_id = message["player"]

    socket = socket |> Socket.assign :player, player_id
    IO.puts "JOIN #{socket.channel}:#{socket.topic} player:#{player_id}"

    reply socket, "join", %{status: "connected"}
    broadcast socket, "player:entered", %{player: player_id}

    {:ok, socket}
  end

  def leave(socket, _message) do
    player = socket |> Socket.get_assign :player
    broadcast socket, "player:left", %{player: player}
    socket
  end

  def event(socket, "sync", message) do
    broadcast socket, "player:sync", message
    socket
  end

end
