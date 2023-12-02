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
      |> String.graphemes()
      |> Enum.reduce([], fn char, acc ->
        case Integer.parse(char) do
          :error -> acc
          {integer, _} -> [integer | acc]
        end
      end)

    "#{hd(digits |> Enum.reverse())}#{hd(digits)}" |> String.to_integer()
  end

  defp normalize(line) do
    replacements = [
      {"one", "1"},
      {"two", "2"},
      {"three", "3"},
      {"four", "4"},
      {"five", "5"},
      {"six", "6"},
      {"seven", "7"},
      {"eight", "8"},
      {"nine", "9"},
    ]

    pattern = replacements
    |> Enum.map(fn {key, _} -> key end)
    |> Enum.join("|")

    line
    |> IO.inspect

    Regex.scan(~r/#{pattern}|\d+/, line)
    |> IO.inspect
    |> Enum.reduce([], fn match, acc ->
      value = case List.keyfind(replacements, hd(match), 0) do
        {_, digit} -> digit
        _ -> hd(match)
      end
      [value | acc]
    end)
    |> Enum.reverse
    |> Enum.join
    |> IO.inspect
  end
end
