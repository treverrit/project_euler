defmodule ProblemEight do
  @spec solve :: integer
  def solve() do
    "./text_files/1000_digit_number.txt"
    |> take_digit_number_from_file()
    |> find_largest_digit_product(1)
  end

  defp take_digit_number_from_file(path) do
    path
    |> File.read!()
    |> String.split()
    |> Enum.join()
    |> String.to_charlist()
  end

  defp find_largest_digit_product(digit_number, product)
  when length(digit_number) < 13, do: product
  defp find_largest_digit_product([_head | tail] = digit_number, product) do
    find_largest_digit_product(tail, current_largest(digit_number, product))
  end

  defp current_largest(digit_number, current_product) do
    digit_number
    |> make_digit_product(1, 0)
    |> largest(current_product)
  end

  defp make_digit_product(_digit_number, product, 13), do: product
  defp make_digit_product([head | tail], product, iterations) do
    make_digit_product(tail, product * (head - 48), iterations + 1)
  end

  defp largest(new, old), do: if new > old, do: new, else: old
end
