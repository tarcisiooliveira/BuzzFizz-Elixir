defmodule BuzzfizzTest do
  use ExUnit.Case

  describe "build/1" do
    test "quando passa um arquivo valido, ele retorna uma tupla {:ok, resultado}" do
      expected_response =
        {:ok, [1, 2, :fizz, 4, :buzz, :fizz, :fizz, :buzz, :fizz, :fizzbuzz, :buzz]}

      assert Buzzfizz.build("numbers.txt") == expected_response
    end

    test "quando passa um arquivo invalido, ele retorna uma tupla {:ok, :error}" do
      expected_response = {:error, "Error reading the file: enoent"}

      assert Buzzfizz.build("invalid.txt") == expected_response
    end
  end
end
