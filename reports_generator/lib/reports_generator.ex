defmodule ReportsGenerator do
  # alias
  alias ReportsGenerator.Parser

  @available_foods [
    "aça´",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  # principal function
  def build(filename) do
    # any files, but only .csv extension
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  # function return max value a user consumed food
  def fetch_higher_cost(report), do: Enum.max_by(report, fn {_key, value} -> value end)

  # function return a sum prices for a any users
  defp sum_values([id, food_name, price], %{"foods" => foods, "users" => users} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    %{report | "users" => users, "foods" => foods}
  end

  # function returns an indented map
  defp report_acc do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users = Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})

    %{
      "users" => users,
      "foods" => foods
    }
  end
end
