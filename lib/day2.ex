defmodule Day2 do
  @type cubes() :: %{red: integer(), green: integer(), blue: integer()}
  @type game() :: %{id: integer(), pulls: list(cubes())}

  @spec parse_games(binary()) :: list(game())
  def parse_games(contents) do
    contents |> String.trim() |> String.split("\n") |> Enum.map(&parse_game/1)
  end

  @spec parse_game(binary()) :: game()
  def parse_game(line) do
    [game_line, pulls_line] = String.split(line, ": ")
    {id, _} = Regex.run(~r/Game (\d+)/, game_line) |> Enum.at(1) |> Integer.parse()
    pulls = String.split(pulls_line, "; ") |> Enum.map(&parse_pull/1)
    %{id: id, pulls: pulls}
  end

  @spec parse_pull(binary()) :: cubes()
  def parse_pull(line) do
    red = parse_color("red", line)
    green = parse_color("green", line)
    blue = parse_color("blue", line)
    %{red: red, green: green, blue: blue}
  end

  @spec parse_color(binary(), binary()) :: integer()
  def parse_color(color, line) do
    match = Regex.run(~r/(\d+) #{color}/, line)

    if match == nil do
      0
    else
      {count, _} = match |> Enum.at(1) |> Integer.parse()
      count
    end
  end

  @spec game_possible?(game(), cubes()) :: boolean()
  def game_possible?(game, cubes) do
    Enum.all?(game.pulls, &pull_possible?(cubes, &1))
  end

  @spec pull_possible?(cubes(), cubes()) :: boolean()
  def pull_possible?(cubes, pull) do
    cubes.red >= pull.red and cubes.green >= pull.green and cubes.blue >= pull.blue
  end

  @spec possible_id_sum(list(game()), cubes()) :: integer()
  def possible_id_sum(games, cubes) do
    for g <- games, game_possible?(g, cubes), reduce: 0 do
      result -> result + g.id
    end
  end
end
