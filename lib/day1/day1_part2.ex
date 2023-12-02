defmodule Aoc2023.Day1Part2 do
  @moduledoc false

  def run(file_path) do
    file_path
    |> File.stream!()
    |> Enum.map(&analyze/1)
    |> Enum.sum()
  end

  def analyze(line) do
    replacements = %{
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9"
    }

    digits =
      line
      |> normalize(replacements)
      |> String.graphemes()
      |> Enum.reduce([], fn char, acc ->
        case Integer.parse(char) do
          :error -> acc
          {integer, _} -> [integer | acc]
        end
      end)

    "#{hd(digits |> Enum.reverse())}#{hd(digits)}" |> String.to_integer()
  end

  defp normalize(line, replacements) do
    pattern = replacements |> Enum.map(fn {key, _} -> key end) |> Enum.join("|")

    Regex.scan(~r/#{pattern}/, line)
    |> Enum.reduce(line, fn match, line ->
      String.replace(line, hd(match), Map.get(replacements, hd(match)))
    end)
  end
end
