defmodule FibWorker do
  require EtsCache
  use GenServer

  # children_list = Supervisor.which_children(ConcurrentTree.Supervisor)
  # pid = Process.whereis(:FibWorker1) #=> nil or #PID<0.120.0>
  # GenServer.call(pid, {:compute, 13}) #=> 233
  def start_link(args) do
    IO.inspect args
    GenServer.start_link(__MODULE__, :ok, [name: args[:name]])
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
