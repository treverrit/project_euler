defmodule ProblemOne do
  @spec solve1 :: any
  @doc """
  solve the problem with the elixir library
  """
  def solve1(), do: list() |> sum()

  # make a list with all items you need
  defp list, do: for i <- 1..1000, rem(i, 3) == 0 or rem(i, 5) == 0, do: i

  # sum of all items in the list
  defp sum(list), do: Enum.reduce(list, 0, fn x, acc -> x + acc end)

  @spec solve2 :: non_neg_integer
  @doc """
  solve the problem with recursion
  """
  def solve2(), do: sum(1, 1000, 0)

  defp sum(lower_bound, upper_bound, result) when lower_bound == upper_bound, do: result

  defp sum(lower_bound, upper_bound, result) do
    if rem(lower_bound, 3) == 0 or rem(lower_bound, 5) == 0 do # if the remainders mathing shift the index once further and update the sum
      sum(lower_bound + 1, upper_bound, result + lower_bound)
    else
      sum(lower_bound + 1, upper_bound, result) # otherwise just shift the index once further
    end
  end
end
