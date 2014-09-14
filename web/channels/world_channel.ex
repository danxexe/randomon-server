defmodule Game.WorldChannel do
  use Phoenix.Channel
  alias Phoenix.Socket

  def join(socket, _hash, message) do
    player_id = message["player"]

    socket = socket |> Socket.assign :player, player_id
    IO.puts "JOIN #{socket.channel}:#{socket.topic} player:#{player_id}"

    reply socket, "join", %{status: "connected"}
    broadcast_from socket, "player:entered", %{player: player_id}

    {:ok, socket}
  end

  def leave(socket, _message) do
    player = socket |> Socket.get_assign :player
    broadcast_from socket, "player:left", %{player: player}
    socket
  end

  def event(socket, "sync", message) do
    broadcast_from socket, "player:sync", message
    socket
  end

end
