defmodule Elixir_99 do
  def my_last([x|[]]) do
    x
  end
  def my_last([_|xs]) do
    my_last xs
  end

  def my_but_last([_|[a,b]]) do
    [a,b]
  end
  def my_but_last([_|xs]) do
    my_but_last xs
  end

  def element_at([x|_],1) do
    x
  end
  def element_at([_|xs],k) do
    element_at xs,(k-1)
  end
end
