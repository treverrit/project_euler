defmodule ProblemFive do
  @spec solve_naive :: <<_::64, _::_*8>>
  def solve_naive(), do: find_smallest_multiple(20)

  defp find_smallest_multiple(current) do
    if divisible?(current) do
      "the smallest multiple is #{current}"
    else
      find_smallest_multiple(current + 20)
    end
  end

  defp divisible?(current) do
    Enum.all?(2..20, fn divisor -> rem(current, divisor) == 0 end)
  end

  @spec solve_efficient :: <<_::64, _::_*8>>
  def solve_efficient(), do: smallest_multiple(1, 1, [2, 3, 5, 7, 11, 13, 17, 19])

  defp smallest_multiple(current, _counter, []), do: "the smallest multiple is #{current}"
  defp smallest_multiple(current, counter, [head | tail] = prime_factors) do
    if counter * head > 20 do
      smallest_multiple(current * counter, 1, tail)
    else
      smallest_multiple(current, counter * head, prime_factors)
    end
  end
end
