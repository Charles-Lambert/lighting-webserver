defmodule Lighting.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Lighting.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lighting.PubSub}
      # Start a worker by calling: Lighting.Worker.start_link(arg)
      # {Lighting.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Lighting.Supervisor)
  end
end
