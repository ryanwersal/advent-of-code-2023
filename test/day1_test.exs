defmodule Day1Test do
  use ExUnit.Case

  test "samples" do
    assert Day1.calibrate("1abc2") == 12
    assert Day1.calibrate("pqr3stu8vwx") == 38
    assert Day1.calibrate("a1b2c3d4e5f") == 15
    assert Day1.calibrate("treb7uchet") == 77
  end

  test "my input" do
    results =
      File.read!("inputs/day1.txt")
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&Day1.calibrate(&1))
      |> Enum.sum()

    assert results != nil
  end
end
