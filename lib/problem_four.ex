defmodule ProblemFour do

  @spec solve_naive :: <<_::64, _::_*8>>
  def solve_naive(), do: find_greatest_palindrome(0, 100, 100)

  defp find_greatest_palindrome(number, first, second) when first == 999 and second == 999 do
   "the greatest palindrome is #{number}"
  end

  defp find_greatest_palindrome(number, first, second) do
    if first * second |> Integer.to_string() |> palindrome?() and number < first * second do
      case second do
        999 -> find_greatest_palindrome(first * second, first + 1, 100)
        _   -> find_greatest_palindrome(first * second, first, second + 1)
      end
    else
      case second do
        999 -> find_greatest_palindrome(number, first + 1, 100)
        _   -> find_greatest_palindrome(number, first, second + 1)
      end
    end
  end

  defp  palindrome?(stringified_number) do
    stringified_number == String.reverse(stringified_number)
  end

  @spec solve_efficient :: <<_::48, _::_*8>>
  def solve_efficient(), do: greatest_palindrome(0, 999, 100)

  defp greatest_palindrome(number, _palidrome_half, iterator)
  when rem(number, iterator) == 0 and div(number, iterator) <= 999 and div(number, iterator) >= 100 do
    "#{number} = #{iterator} * #{div(number, iterator)}"
  end

  defp greatest_palindrome(_number, palindrome_half, iterator) do
    case iterator do
      999 ->
        palindrome_half
        |> Integer.to_string()
        |> make_palindrome()
        |> greatest_palindrome(palindrome_half - 1, 100)

      _another ->
        palindrome_half
        |> Integer.to_string()
        |> make_palindrome()
        |> greatest_palindrome(palindrome_half, iterator + 1)
    end
  end

  defp make_palindrome(stringified_number) do
    stringified_number <> String.reverse(stringified_number)
    |> String.to_integer()
  end
end
