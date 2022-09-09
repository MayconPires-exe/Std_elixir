defmodule ReportsGenerator.Parser do
  # Separando a estrutura em arquivos diferentes
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
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
