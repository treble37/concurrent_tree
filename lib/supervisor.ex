defmodule ConcurrentTree.Supervisor do
  use Supervisor
  @moduledoc """
  The top level supervisor for starting worker processes that do the
  computation work
  """

  @doc """
  """
  def start_link(args), do: Supervisor.start_link(__MODULE__, [args], name: __MODULE__)
  def init(args) do
    children = [
      worker(FibWorker, [%{name: :FibWorker1, args: args}], restart: :permanent, id: "FibWorker1"),
      worker(FibWorker, [%{name: :FibWorker2, args: args}], restart: :permanent, id: "FibWorker2")
    ]
    supervise(children, strategy: :one_for_one)
  end
end
