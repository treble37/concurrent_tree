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
    # args is a list holding one element, the max number of workers we want to create
    children = 1..List.first(args)
               |> Enum.to_list
               |> Enum.map(fn(id) -> worker(FibWorker,
                  [%{name: "FibWorker#{id}" |> String.to_atom, args: args}],
                  restart: :permanent, id: "FibWorker#{id}") end)
    supervise(children, strategy: :one_for_one)
  end
end
