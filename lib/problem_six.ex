defmodule ProblemSix do
  def solve(), do: calculate_difference(0, 1)

  defp calculate_difference(sum, 100), do: Integer.pow(div(100 * 101, 2), 2) - (sum + 100 * 100)
  defp calculate_difference(sum, iterator) do
    calculate_difference(sum + iterator * iterator, iterator + 1)
  end
end
