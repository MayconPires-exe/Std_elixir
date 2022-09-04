# ReportsGenerator

## Create install and resolve dependences
You use this lib from project <a>https://github.com/rrrene/credo</a>

foling this command befor create your project 
```bash
mix new "name_project"



```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `reports_generator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:reports_generator, "~> 0.1.0"},
    {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/reports_generator](https://hexdocs.pm/reports_generator).

