defmodule Fib.Caller do
  # this is a "CLI" like module to call each worker to do a Fibonacci computation
  def compute1(n) do
    pid = Process.whereis(:FibWorker1)
    GenServer.call(:FibWorker1, {:compute, n})
  end
  def compute2(n) do
    pid = Process.whereis(:FibWorker2)
    GenServer.call(:FibWorker2, {:compute, n})
  end
end
