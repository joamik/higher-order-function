defmodule HigerOrderFunction do
  def repeat(a, _, t) when t <= 0 do
    a
  end
  
  def repeat(a, f, t) do
    HigerOrderFunction.repeat(apply(f, a), f, t-1)
  end
end