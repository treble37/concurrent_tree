defmodule ConcurrentTree do
  use Application
  @moduledoc """
  Documentation for ConcurrentTree.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ConcurrentTree.hello
      :world

  """
  def start(_type, _args) do
    ConcurrentTree.Supervisor.start_link([2])
  end
end
