defmodule Day1 do
  def calibrate(input, fun) do
    input |> String.trim() |> String.split("\n") |> Enum.map(&fun.(&1)) |> Enum.sum()
  end

  def calibrate_line(input) do
    matches = Regex.scan(~r/\d/, input) |> Enum.flat_map(& &1)
    [[first], [last]] = [Enum.take(matches, 1), Enum.take(matches, -1)]
    "#{first}#{last}" |> String.to_integer()
  end

  @forwardRegex ~r/(?:\d|one|two|three|four|five|six|seven|eight|nine)/
  @backwardRegex ~r/(?:\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/

  def calibrate_line2(input) do
    first =
      Regex.scan(@forwardRegex, input) |> Enum.flat_map(& &1) |> Enum.take(1) |> List.first()

    last =
      Regex.scan(@backwardRegex, String.reverse(input))
      |> Enum.flat_map(& &1)
      |> Enum.take(1)
      |> List.first()
      |> String.reverse()

    "#{word_to_int(first)}#{word_to_int(last)}" |> String.to_integer()
  end

  @wordToInt %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }

  defp word_to_int(word) do
    Map.get(@wordToInt, word, word)
  end
end
