defmodule Fibonacci do
  def fibonacci(n) do
    List.first(HigerOrderFunction.repeat([0, 1], &fibonacci/2, n))
  end

  def fibonacci(a, b) do
    [b, a + b]
  end
end
