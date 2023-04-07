defmodule UnlevelAll.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      UnlevelAllWeb.Telemetry,
      # Start the Ecto repository
      UnlevelAll.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: UnlevelAll.PubSub},
      # Start Finch
      {Finch, name: UnlevelAll.Finch},
      # Start the Endpoint (http/https)
      UnlevelAllWeb.Endpoint
      # Start a worker by calling: UnlevelAll.Worker.start_link(arg)
      # {UnlevelAll.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UnlevelAll.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UnlevelAllWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
