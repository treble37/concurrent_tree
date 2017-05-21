defmodule FibWorker do
  use GenServer

  def start_link(args) do
    IO.inspect args
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def compute(n) do
    GenServer.call(__MODULE__, {:compute, n}, 200000)
  end

  def handle_call({:compute, n}, _from, state) do
    {:reply, Fibonacci.fib(n), state}
  end
end
