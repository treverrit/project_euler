defmodule ProblemNine do
  @spec solve :: <<_::64, _::_*8>>
  def solve(), do: find_pythagorean_triplet()

  defp find_pythagorean_triplet(), do: loop(1) |> calculate_product()

  defp loop(334), do: {:error, "a to big"}
  defp loop(a), do: find_b(a, a)

  defp find_b(a, b) when a + 2 * b >= 1000, do: loop(a + 1)
  defp find_b(a, b), do: find_c(a, b)

  defp find_c(a, b) do
    case 1000 - a - b do
      c when a * a + b * b == c * c -> {a, b, c}
      _else -> find_b(a, b + 1)
    end
  end

  defp calculate_product({:error, reason}), do: reason
  defp calculate_product({a, b, c}), do: "#{a} * #{b} * #{c} = #{a * b * c}"
end
