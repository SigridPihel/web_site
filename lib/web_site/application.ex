defmodule WebSite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WebSiteWeb.Telemetry,
      WebSite.Repo,
      {DNSCluster, query: Application.get_env(:web_site, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WebSite.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: WebSite.Finch},
      # Start a worker by calling: WebSite.Worker.start_link(arg)
      # {WebSite.Worker, arg},
      # Start to serve requests, typically the last entry
      WebSiteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebSite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WebSiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
