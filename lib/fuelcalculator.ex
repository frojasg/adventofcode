defmodule Fuelcalculator do
    @doc """
    Fuel required to launch a given module is based on its mass.
    Specifically, to find the fuel required for a module, take its mass,
     divide by three, round down, and subtract 2.
    """
    @spec calculate(integer) :: integer
    def calculate(mass) do
        trunc(mass / 3) - 2
    end
end
