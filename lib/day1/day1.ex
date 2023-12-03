defmodule Aoc2023.Day1 do
  @moduledoc false

  def run(file_path) do
    file_path
    |> File.stream!()
    |> Enum.map(&analyze/1)
    |> Enum.sum()
  end

  def analyze(line) do
    digits =
      line
      |> normalize()
      |> then(fn x -> Regex.scan(~r/\d/, x) end)
      |> List.flatten

    "#{hd(digits)}#{hd(digits |> Enum.reverse())}" |> String.to_integer()
  end

  defp normalize(line) do
    replacements = %{
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9",
    }

    replacements
    |> Enum.map(fn {key, _} -> key end)
    |> Enum.reduce(line, fn match, acc ->
      String.replace(acc, match, "#{match}#{Map.get(replacements, match)}#{match}")
    end)
  end
end
