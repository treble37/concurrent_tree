defmodule Fibonacci do
  # this module will represent "computation work" to be done in a process
  # Get the next number in the fibonacci sequence
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(term), do: fib(term - 1) + fib(term - 2)
end
