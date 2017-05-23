defmodule ConcurrentTree do
  use Application
  @moduledoc """
  Documentation for ConcurrentTree.
  """

  def start(_type, _args) do
    ConcurrentTree.Supervisor.start_link([2])
  end
end
