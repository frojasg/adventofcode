defmodule IntcodeTest do
  use ExUnit.Case
  doctest Intcode


  test "program that doesn't do anything" do
    assert Intcode.eval("99") == "99"
    assert Intcode.eval("99,1,2") == "99,1,2"
  end

  test "1 + 1 = 2" do
    assert Intcode.eval("1,0,0,0,99") == "2,0,0,0,99"
  end

  test "3 * 2 = 6" do
    assert Intcode.eval("2,3,0,3,99") == "2,3,0,6,99"
  end

  test "99 * 99 = 9801" do
    assert Intcode.eval("2,4,4,5,99,0") == "2,4,4,5,99,9801"
  end

  test "test we're running mutated string" do
    assert Intcode.eval("1,1,1,4,99,5,6,0,99") == "30,1,1,4,2,5,6,0,99"
  end

  test "puzzle" do
    assert Intcode.eval("1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,6,19,1,9,19,23,2,23,10,27,1,27,5,31,1,31,6,35,1,6,35,39,2,39,13,43,1,9,43,47,2,9,47,51,1,51,6,55,2,55,10,59,1,59,5,63,2,10,63,67,2,9,67,71,1,71,5,75,2,10,75,79,1,79,6,83,2,10,83,87,1,5,87,91,2,9,91,95,1,95,5,99,1,99,2,103,1,103,13,0,99,2,14,0,0") ==
      "3931283,12,2,2,1,1,2,3,1,3,4,3,1,5,0,3,2,1,6,24,1,9,19,27,2,23,10,108,1,27,5,109,1,31,6,111,1,6,35,113,2,39,13,565,1,9,43,568,2,9,47,1704,1,51,6,1706,2,55,10,6824,1,59,5,6825,2,10,63,27300,2,9,67,81900,1,71,5,81901,2,10,75,327604,1,79,6,327606,2,10,83,1310424,1,5,87,1310425,2,9,91,3931275,1,95,5,3931276,1,99,2,3931278,1,103,13,0,99,2,14,0,0"
  end
end
