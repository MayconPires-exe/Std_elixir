defmodule SumListTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns the list sum" do
      # setup
      list = [1, 2, 3]

      # execução
      response = SumList.call(list)

      # resposta esperada
      expected_response = 6

      # teste esperado
      assert response == expected_response
    end
  end
end
