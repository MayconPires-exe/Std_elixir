defmodule ReportsGenerator do
  # usando a função case para tratar caso de erro e sucesso
  # caso queira um parametro default é so colocar um " _ -> "caso qualquer"
  # def build(filename) do
  #   case File.read("reports/#{filename}") do
  #     {:ok, result} -> result
  #     {:error, reason} -> reason
  #     _ -> "caso qualquer"
  #   end
  # end

  # Para melhor projeção do que vamos fazer, iremos usar o pipe operator "|>"
  # ele ajuda a deixar mais legivel nossas funções tendo em mente sempre o primeiro argumento
  # na fita de entrada.
  # File.stream! retorna uma struct que é um map+name, ele so retorna o necessario para que não
  # precise carregar tudo na mmemória, assim evitando qualquer erro ou conflito no sistema
  # essa função tem uma peculiaridade, em caso de sucesso ira abrir o arquivo e em caso de erro,
  # apenas não abre o arquivo
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    # Retira possível \n no arquivo
    |> String.trim()
    # Separa os argumentos com você desejar ", - ; ..."
    |> String.split(",")
    # Transforma uma posição do parametro em inteiro
    # & antes de uma finção é a maneira reduzina de fanzer uma função anonima
    |> List.update_at(2, &String.to_integer/1)
  end
end
