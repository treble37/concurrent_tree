defmodule FibWorker do
  use GenServer

  def start_link(args) do
    IO.inspect args
    GenServer.start_link(__MODULE__, :ok, [args])
  end

  def stop(pid) do
    GenServer.call(pid, :stop)
  end

  def compute(pid, n) do
    GenServer.call(pid, n)
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end

  def handle_call(n, _from, state) do
    {:ok, Fibonacci.fib(n)}
  end
end
