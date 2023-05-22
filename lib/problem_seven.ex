defmodule ProblemSeven do
  @spec solve :: pos_integer
  def solve(), do: find_prime(2, 4, 2)

  defp find_prime(prime, _current, 10001), do: prime
  defp find_prime(current, number, counter) do
    if prime?(number) do
      find_prime(number, number + 1, counter + 1)
    else
      find_prime(current, number + 1, counter)
    end
  end

  defp prime?(number) when number in [2, 3], do: true
  defp prime?(number) do
    number
    |> :math.sqrt()
    |> trunc()
    |> coprime?(number)
  end

  defp coprime?(sqrt, number) do
    !Enum.any?(2..sqrt, &(rem(number, &1) == 0))
  end
end
