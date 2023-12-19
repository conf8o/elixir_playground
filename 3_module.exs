defmodule A do
  def f(x) do
    x + x
  end

  def g(x) do
    f(x) + f(x)
  end
end

IO.puts A.g(1)
