# ConcurrentTree

This is a proving ground to test all the concepts I'm learning in Elixir - OTP, supervision, ets, etc.

## Feature Checklist

* Add ets cache for storing numbers on worker computation [done]
* Add CLI interface to fire up multiple workers to do multiple Fibonacci computations

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `concurrent_tree` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:concurrent_tree, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/concurrent_tree](https://hexdocs.pm/concurrent_tree).

