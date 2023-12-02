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
      |> String.graphemes()
      |> Enum.reduce([], fn char, acc ->
        case Integer.parse(char) do
          :error -> acc
          {integer, _} -> [integer | acc]
        end
      end)

    "#{hd(digits |> Enum.reverse())}#{hd(digits)}" |> String.to_integer()
  end
end
