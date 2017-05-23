defmodule FibWorker do
  require EtsCache
  use GenServer

  def start_link(args) do
    IO.inspect args
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def compute(n) do
    GenServer.call(__MODULE__, {:compute, n}, 200000)
  end

  def handle_call({:compute, n}, _from, state) do
    fib_val = Fibonacci.fib(n)
    EtsCache.write(:fibonacci, n, fib_val)
    {:reply, fib_val, state}
  end
end
