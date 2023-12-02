defmodule Aoc2023.Day1Test do
  use ExUnit.Case, async: true

  @tag :tmp_dir
  test "calibration_example", %{tmp_dir: tmp_dir} do
    input =
      "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"

    file_path = tmp_dir <> "/input"
    File.write!(file_path, input)

    assert Aoc2023.Day1.run(file_path) == 142
  end

  [{"1abc2", 12}, {"a1b2c3d4e5f", 15}, {"treb7uchet", 77}]
  |> Enum.each(fn {input, expected} ->
    @input input
    @expected expected

    test "for #{@input} returns #{@expected}" do
      assert Aoc2023.Day1.analyze(@input) == @expected
    end
  end)
end
