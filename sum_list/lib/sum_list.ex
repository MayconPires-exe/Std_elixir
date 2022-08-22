defmodule SumList do
  # função reduzida
  def call(list), do: sum(list, 0)

  # acc é o valor inicial da soma
  defp sum([], acc), do: acc

  # não precisa de retorno pois o retorno é explicito
  defp sum([head | tail], acc) do
    acc = acc + head
    sum(tail, acc)
  end
end

# 1 ex: [5, 8, 5] hd: 5, tail [8, 5], 0 -> acc = 0 + 5, sum([8, 5], 5)
# 2 ex: [8, 5] hd: 8, tail [5], 5 -> acc = 5 + 8, sum([5], 13)
# 3 ex: [5] hd: 13, tail [], 3 -> acc = 13 + 5, sum([], 18)
# 4 ex: [] acc = 18
