defmodule Blug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BlugWeb.Telemetry,
      # Start the Ecto repository
      Blug.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Blug.PubSub},
      # Start Finch
      {Finch, name: Blug.Finch},
      # Start the Endpoint (http/https)
      BlugWeb.Endpoint
      # Start a worker by calling: Blug.Worker.start_link(arg)
      # {Blug.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Blug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
