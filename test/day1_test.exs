defmodule Day1Test do
  use ExUnit.Case

  test "samples" do
    assert Day1.calibrate_line("1abc2") == 12
    assert Day1.calibrate_line("pqr3stu8vwx") == 38
    assert Day1.calibrate_line("a1b2c3d4e5f") == 15
    assert Day1.calibrate_line("treb7uchet") == 77
  end

  test "sample sum" do
    result =
      "1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet"
      |> Day1.calibrate(&Day1.calibrate_line(&1))

    assert result == 142
  end

  test "my input" do
    results =
      File.read!("inputs/day1.txt")
      |> Day1.calibrate(&Day1.calibrate_line(&1))

    assert results == 54239
  end

  test "part2 samples" do
    assert Day1.calibrate_line2("two1nine") == 29
    assert Day1.calibrate_line2("eightwothree") == 83
    assert Day1.calibrate_line2("abcone2threexyz") == 13
    assert Day1.calibrate_line2("xtwone3four") == 24
    assert Day1.calibrate_line2("4nineeightseven2") == 42
    assert Day1.calibrate_line2("zoneight234") == 14
    assert Day1.calibrate_line2("7pqrstsixteen") == 76
  end

  test "part2 samples sum" do
    result =
      "two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen"
      |> Day1.calibrate(&Day1.calibrate_line2(&1))

    assert result == 281
  end

  test "part2 more samples" do
    assert Day1.calibrate_line2("nineight") == 98
  end

  test "part2 my input" do
    results =
      File.read!("inputs/day1.txt")
      |> Day1.calibrate(&Day1.calibrate_line2(&1))

    assert results == 55343
  end
end
