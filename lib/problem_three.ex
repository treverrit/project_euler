defmodule ProblemThree do
  @spec solve :: pos_integer
  def solve(), do: primefactors(600851475143, 2)

  defp primefactors(number, divisor) when divisor * divisor >= number, do: number
  defp primefactors(number, divisor) do
    if Integer.mod(number, divisor) == 0 do
      primefactors(div(number, divisor), divisor + 1)
    else
      primefactors(number, divisor + 1)
    end
  end
end
