defmodule EtsCache do
  def write(table_name, key, value) do
    find_or_create_table(no_table?(table_name), table_name)
    :ets.insert(table_name, {key, value})
  end

  def read(table, key) do
    case :ets.lookup(table, key) do
      [{_, value}] ->
        value
      _ ->
        []
    end
  end

  defp find_or_create_table(true, table_name) do
    :ets.new(table_name, [:named_table])
  end

  defp find_or_create_table(false, table_name) do
    :ets.info(table_name)[:name]
  end

  defp no_table?(table_name) do
    :ets.info(table_name) == :undefined
  end
end
