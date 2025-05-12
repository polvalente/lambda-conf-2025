defmodule NxDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NxDemoWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:nx_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NxDemo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NxDemo.Finch},
      # Start a worker by calling: NxDemo.Worker.start_link(arg)
      # {NxDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      NxDemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NxDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NxDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
