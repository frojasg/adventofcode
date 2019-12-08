defmodule Fuelcalculator do
    @doc """
    Fuel required to launch a given module is based on its mass.
    Specifically, to find the fuel required for a module, take its mass,
     divide by three, round down, and subtract 2.
    """
    @spec calculate(integer) :: integer
    def calculate(mass) when mass <= 0 do
        0
    end
    def calculate(mass) do
        fuel = trunc(mass / 3) - 2
        fuel = max(0, fuel)
        fuel + calculate(fuel)
    end
end
