defmodule Elixir_99 do
  require Enum
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

  def my_reverse(l) do
    my_reverse(l,[])
  end
  def my_reverse([],a) do
    a
  end
  def my_reverse([x|xs],a) do
    my_reverse(xs,[x|a])
  end

  def is_palindrome([]) do
    false
  end
  def is_palindrome([_]) do
    true
  end
  def is_palindrome(l) do
    l == Enum.reverse(l)
  end
  def my_flatten(l) do
    Enum.reverse(my_flatten(l,[]))
  end
  def my_flatten([],a) do
    a
  end
  def my_flatten([x|xs],a) do
    if is_list x do
      my_flatten(xs,my_flatten(x,[]) ++ a)
    else
      my_flatten(xs,[x|a])
    end
  end

  def compress(l) do
    compress(l,[])
  end
  def compress([],a) do
    Enum.reverse(a)
  end
  def compress([x|xs],[x|as]) do
    compress(xs,[x|as])
  end
  def compress([x|xs],a) do
    compress(xs,[x|a])
  end

  def pack(l) do
    pack(l,[])
  end
  def pack([], a) do
    Enum.reverse(a)
  end
  def pack([x|xs],[[x|ds]|as]) do
    pack(xs,[[x|[x|ds]]|as])
  end
  def pack([x|xs],a) do
    pack(xs,[[x]|a])
  end

  def run_length_encode(l) do
    run_length_encode(l,[])
  end
  def run_length_encode([],a) do
    Enum.reverse(a)
  end
  def run_length_encode([x|xs],[{n,x}|as]) do
    run_length_encode(xs,[{n+1,x}|as])
  end
  def run_length_encode([x|xs],a) do
    run_length_encode(xs,[{1,x}|a])
  end

  def run_length_encode_(l) do
    for e <- pack(l), do: {length(e),hd(e)}
  end
end
