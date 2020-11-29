defmodule Buzzfizz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    resultado_final = result
    |> String.split(",")
    |> Enum.map(&converte_and_evaluet/1)

    {:ok, resultado_final}
  end

  defp handle_file_read({:error, erro_msg}), do: {:error, "Error reading the file: #{erro_msg}"}

  defp converte_and_evaluet(number) do
    number
    |> String.to_integer()
    |> evaluete()
  end

  defp evaluete(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluete(number) when rem(number, 3) == 0, do: :fizz
  defp evaluete(number) when rem(number, 5) == 0, do: :buzz
  defp evaluete(number), do: number

end
