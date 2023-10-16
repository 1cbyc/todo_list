defmodule TodoList.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TodoListWeb.Telemetry,
      TodoList.Repo,
      {DNSCluster, query: Application.get_env(:todo_list, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TodoList.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TodoList.Finch},
      # Start a worker by calling: TodoList.Worker.start_link(arg)
      # {TodoList.Worker, arg},
      # Start to serve requests, typically the last entry
      TodoListWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoList.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoListWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
