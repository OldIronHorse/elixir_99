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

  def count_elements(l) do
    count_elements(l,0)
  end
  def count_elements([],n) do
    n
  end
  def count_elements([_|xs],n) do
    count_elements xs,(n+1)
  end
end
