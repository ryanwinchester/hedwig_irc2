defmodule Hedwig.Adapters.IRC do
  use Application

  alias HedwigIRC.Conn
  alias HedwigIRC.ConnectionHandler
  alias HedwigIRC.LoginHandler

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    {:ok, client} = ExIrc.start_link!

    conn =
      Application.get_env(:hedwig_irc, :bot)
      |> Conn.from_params()
      |> Map.put(:client, client)

    children = [
      worker(ConnectionHandler, [conn]),
      worker(LoginHandler, [conn]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HedwigIRC.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
