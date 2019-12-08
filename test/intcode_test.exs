defmodule IntcodeTest do
  use ExUnit.Case
  doctest Intcode


  test "program that doesn't do anything" do
    assert Intcode.eval("99") == "99"
    assert Intcode.eval("99,1,2") == "99,1,2"
  end

  test "(1 + 1) = 2" do
    assert Intcode.eval("1,0,0,0,99") == "2,0,0,0,99"
  end
end
