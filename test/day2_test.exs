defmodule Day2Test do
  use ExUnit.Case

  @cubes %{red: 12, green: 13, blue: 14}

  test "samples" do
    games = File.read!("inputs/day2_sample.txt") |> Day2.parse_games()

    assert Day2.game_possible?(Enum.at(games, 0), @cubes) == true
    assert Day2.game_possible?(Enum.at(games, 1), @cubes) == true
    assert Day2.game_possible?(Enum.at(games, 2), @cubes) == false
    assert Day2.game_possible?(Enum.at(games, 3), @cubes) == false
    assert Day2.game_possible?(Enum.at(games, 4), @cubes) == true

    assert Day2.possible_id_sum(games, @cubes) == 8
  end

  test "my input" do
    games = File.read!("inputs/day2.txt") |> Day2.parse_games()
    assert Day2.possible_id_sum(games, @cubes) == 2632
  end
end
