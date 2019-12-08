defmodule Intcode do
  require Logger

  @doc """
  An Intcode program is a list of integers separated by commas (like 1,0,0,3,99).
  To run one, start by looking at the first integer (called position 0).
  Here, you will find an opcode - either 1, 2, or 99. The opcode indicates
  what to do; for example, 99 means that the program is finished and should
  immediately halt. Encountering an unknown opcode means something went wrong.

  Opcode 1 adds together numbers read from two positions and stores the result
  in a third position. The three integers immediately after the opcode tell you
  these three positions - the first two indicate the positions from which you
  should read the input values, and the third indicates the position at which the
  output should be stored.

  Opcode 2 works exactly like opcode 1, except it multiplies the two inputs instead
  of adding them. Again, the three integers after the opcode indicate where the inputs
  and outputs are, not their values.

  Once you're done processing an opcode, move to the next one by stepping forward 4 positions.
  """
  @spec eval(String.t) :: String.t
  def eval(program) do
    program = String.split(program, ",")
    |> Enum.map(&String.to_integer/1)
    evaluate(program, program, 0)
    |> Enum.join(",")
  end

  @spec evaluate([integer], [integer], integer) :: [integer]
  defp evaluate([1, left, right, out | _], input, cursor) do
    a = Enum.at(input, left)
    b = Enum.at(input, right)
    input = List.replace_at(input, out, a + b)
    cursor = cursor + 4
    evaluate(Enum.slice(input, cursor..-1), input, cursor)
  end
  defp evaluate([2, left, right, out | _], input, cursor) do
    a = Enum.at(input, left)
    b = Enum.at(input, right)
    input = List.replace_at(input, out, a * b)
    cursor = cursor + 4
    evaluate(Enum.slice(input, cursor..-1), input, cursor)
  end
  defp evaluate([99 | _], input, _) do
    input
  end
  defp evaluate(_, input, _) do
    input
  end
end
