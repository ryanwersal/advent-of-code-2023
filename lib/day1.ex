defmodule Day1 do
  def calibrate(input) do
    matches = Enum.flat_map(Regex.scan(~r/\d/, input), & &1)
    [first] = Enum.take(matches, 1)
    [last] = Enum.take(matches, -1)
    {val, _} = Integer.parse("#{first}#{last}")
    val
  end
end
