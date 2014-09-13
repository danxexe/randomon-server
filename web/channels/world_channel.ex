defmodule Game.WorldChannel do
  use Phoenix.Channel
  alias Phoenix.Topic
  alias Phoenix.Socket

  def join(socket, hash, message) do
    player_id = message["player"]

    socket = socket |> Socket.assign :player, player_id
    IO.puts "JOIN #{socket.channel}:#{socket.topic} player:#{player_id}"

    reply socket, "join", %{status: "connected"}
    broadcast socket, "player:entered", %{player: player_id}

    {:ok, socket}
  end

  def join(socket, _private_topic, _message) do
    {:error, socket, :unauthorized}
  end

  def leave(socket, message) do
    player = socket |> Socket.get_assign :player
    broadcast socket, "player:left", %{player: player}
    socket
  end

  def event(socket, "sync", message) do
    player = socket |> Socket.get_assign :player
    broadcast socket, "player:sync", message
    socket
  end

  def event(socket, "new:msg", message) do
    broadcast socket, "new:msg", message
    socket
  end

  defp namespaced(channel, topic), do: "#{channel}:#{topic}"
end
