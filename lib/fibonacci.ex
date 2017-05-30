defmodule Fibonacci do
  @table_name :fibonacci
  require EtsCache
  # this module will represent "computation work" to be done in a process
  # Get the next number in the fibonacci sequence

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(term) do
    m = cond do
      fib_cached?(term - 1) == false ->
        EtsCache.write(@table_name, term-1, fib(term-1))
      true ->
        EtsCache.read(@table_name, term-1)
    end
    n = cond do
      fib_cached?(term - 2) == false ->
        EtsCache.write(@table_name, term-2, fib(term-2))
      true ->
        EtsCache.read(@table_name, term-2)
    end
    m + n
  end

  def fib_cached?(term) do
    EtsCache.read(@table_name, term) != nil
  end
end
