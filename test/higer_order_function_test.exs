defmodule HigerOrderFunctionTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest HigerOrderFunction

  property "always produces something that's suitable for its own consumption" do
    check all a <- integer(), b <- integer() do
      input = [a, b]
      output = HigerOrderFunction.repeat(input, &Fibonacci.fibonacci/2, 2)
      assert is_list(input) === is_list(output) and length(input) === length(output)
    end
  end

  property "returns inital list of arguments when number of times is less or equal 0" do
    input = [1, 2]
    check all i <- integer() do
      times = -abs(i)
      assert HigerOrderFunction.repeat(input, &Fibonacci.fibonacci/2, times) === input
    end
  end

end
