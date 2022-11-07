defmodule ProblemTwo do
  @spec solve :: non_neg_integer
  @doc """
  solves problem two with tail call recursion because it's faster than naive recursion.
  """
  def solve(), do: sum()

  defp sum(), do: even_fibonacci_sum(1, 0, 0)

  # returns the sum of even fibonacci numbers
  defp even_fibonacci_sum( _next, result, sum) when result >= 4000000, do: sum

  # on this guard clause the fibonacci sequence will be continued and the sum will be updated
  defp even_fibonacci_sum(next, result, sum) when rem(result, 2) == 0 do
    even_fibonacci_sum(next + result, next, sum + result)
  end

  # on this guard only the fibonacci sequence will be continued
  defp even_fibonacci_sum(next, result, sum) do
    even_fibonacci_sum(next + result, next, sum)
  end
end
