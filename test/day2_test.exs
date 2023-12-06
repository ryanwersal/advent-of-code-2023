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

  test "part 2 sample" do
    games = File.read!("inputs/day2_sample.txt") |> Day2.parse_games()

    assert Day2.required_cubes(Enum.at(games, 0)) == %{red: 4, green: 2, blue: 6}
    assert Day2.required_cubes(Enum.at(games, 1)) == %{red: 1, green: 3, blue: 4}
    assert Day2.required_cubes(Enum.at(games, 2)) == %{red: 20, green: 13, blue: 6}
    assert Day2.required_cubes(Enum.at(games, 3)) == %{red: 14, green: 3, blue: 15}
    assert Day2.required_cubes(Enum.at(games, 4)) == %{red: 6, green: 3, blue: 2}

    assert Day2.required_cubes_power(games) == 2286
  end

  test "part 2 input" do
    games = File.read!("inputs/day2.txt") |> Day2.parse_games()
    assert Day2.required_cubes_power(games) == 69629
  end
end
