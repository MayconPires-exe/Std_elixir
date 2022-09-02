defmodule SumList do
  # função reduzida
  def call(list), do: sum(list, 0)

  # map  pega uma lista qualquer e utiliza uma função anonima passando um elemento para capiturarar essa lista
  # toda função com ? no final como any? retorna um booleano, e tambem espera a condição que satisfaça minha condição
  def call_enum(list), do: Enum.any?(list, fn elem -> elem > 5 end)

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
