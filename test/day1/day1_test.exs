defmodule Aoc2023.Day1Test do
  use ExUnit.Case, async: true

  @tag :tmp_dir
  test "calibration_example", %{tmp_dir: tmp_dir} do
    input =
      "two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen"

    file_path = tmp_dir <> "/input"
    File.write!(file_path, input)

    assert Aoc2023.Day1.run(file_path) == 281
  end

  [
    {"two1nine", 29},
    {"4nineeightseven2", 42},
    {"7pqrstsixteen", 76},
    {"zoneight234", 14},
    {"eightwothree", 83},
    {"eighthree", 83},
    {"ctpkqsdqz97zqptzjlfbtwo", 92},
    {"fourthreefivepxqrrjm7threezjsdhfs", 43},
    {"8qlhdpxn645nhrjm", 85},
    {"26two", 22},
    {"m2", 22},
    {"3four3", 33}
  ]
  |> Enum.each(fn {input, expected} ->
    @input input
    @expected expected

    test "for #{@input} returns #{@expected}" do
      assert Aoc2023.Day1.analyze(@input) == @expected
    end
  end)
end
