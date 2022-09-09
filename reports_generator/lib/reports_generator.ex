defmodule ReportsGenerator do
  # palavra reduzida pega a ultima palavra para ser usada, não havendo a necessidade de reproduzir tudo
  alias ReportsGenerator.Parser
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
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  # Para que o map não venha vazio, iremos usar o Enum.into/3 inicializando diretamente com "1" => 30 ...
  # Assim facilitando a somatoria dos preços referente ao produto por usuario
  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
