defmodule Elixir_99 do
  require Enum
  def my_last([x|[]]) do
    x
  end
  def my_last([_|xs]) do
    my_last xs
  end

  def f_last(l) do
    hd(Enum.reverse(l))
  end

  def my_but_last([a,b]) do
    [a,b]
  end
  def my_but_last([a]) do
    [a]
  end
  def my_but_last([_|xs]) do
    my_but_last xs
  end
  def my_but_last([]) do
    []
  end

  def f_but_last(l) do
    case Enum.reverse(l) do
      [a|[b|_]] -> [b,a]
      _ -> l
    end
  end

  def element_at([x|_],1) do
    x
  end
  def element_at([_|xs],k) do
    element_at xs,(k-1)
  end

  def f_element_at(l,k) do
    Enum.at(l,k-1)
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

  def f_count_elements(l) do
    length(l)
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

  def mod_run_length_encode(l) do
    for {n,x} <- run_length_encode(l) do
      if n == 1 do
        x
      else
        {n,x}
      end
    end
  end

  def run_length_decode(l) do
    run_length_decode(l,[])
  end
  def run_length_decode([],a) do
    Enum.reverse(a)
  end
  def run_length_decode([{n,x}|xs],a) do
    el = for _ <- 1..n, do: x
    run_length_decode(xs,el++a)
  end

  def duplicate(l) do
    duplicate(l,[])
  end
  def duplicate([],a) do
    Enum.reverse(my_flatten(a))
  end
  def duplicate([x|xs],a) do
    duplicate(xs,[[x,x]|a])
  end

  def replicate(l,n) do
    replicate(l,n,[])
  end
  def replicate([],_,a) do
    Enum.reverse(my_flatten(a))
  end
  def replicate([x|xs],n,a) do
    replicate(xs,n,[(for _ <- 1..n, do: x)|a])
  end

  def drop(l,n) do
    for {x,true} <- Enum.zip(l,Stream.cycle(Enum.reverse([false|(for _ <- 1..n-1, do: true)]))), do: x
  end

  def split(l,n) do
    split(l,n,[])
  end
  def split(l,0,a) do
    [Enum.reverse(a),l]
  end
  def split([],_,a) do
    [Enum.reverse(a),[]]
  end
  def split([x|xs],n,a) do
    split(xs,n-1,[x|a])
  end

  def slice(l,i,k) do
    slice(l,i-1,k,[])
  end
  def slice(_,0,0,a) do
    Enum.reverse(a)
  end
  def slice([],_,_,a) do
    Enum.reverse(a)
  end
  def slice([x|xs],0,k,a) do
    slice(xs,0,k-1,[x|a])
  end
  def slice([_|xs],i,k,a) do
    slice(xs,i-1,k-1,a)
  end

  def rotate_left(l,n) when n > 0 do
    [lhs,rhs] = split(l,n)
    rhs++lhs
  end
  def rotate_left(l,n) when n < 0 do
    rotate_left(l,length(l)+n)
  end
  def rotate_left(l,_) do
    l
  end

  def remove_at(l,k) do
    case split(l,k-1) do
      [lhs,[]] -> lhs
      [lhs,[_|rhs]] -> lhs++rhs
    end
  end

  def insert_at(l,e,k) do
    [lhs,rhs] = split(l,k-1)
    lhs++[e|rhs]
  end

  def range(start,stop) do
    for n <-start..stop, do: n
  end

  #P23: Extract a given number of randomly selected elenemts from a list
  def rnd_select(l,n) do
    rnd_select(l,n,[])
  end
  def rnd_select(_,0,a) do
    a
  end
  def rnd_select([],_,a) do
    a
  end
  def rnd_select(l,n,a) do
    i = Enum.random(1..length(l))
    rnd_select(remove_at(l,i),n-1,[Enum.at(l,i-1)|a])
  end

  #P24: Lotto: Draw n random numbers from the set 1..m
  def lotto_select(n,m) do
    rnd_select(Enum.to_list(1..m),n)
  end

  #P25: generate a random permutation of a list
  def rnd_permutation(l) do
    rnd_select(l,length(l))
  end

  def combinations(0,_) do
    [[]]
  end
  def combinations(_,[]) do
    []
  end
  def combinations(n,[x|xs]) do
    (for y <- combinations(n-1,xs), do: [x|y]) ++ combinations(n,xs)
  end

  def lsort(l) do
    #Enum.map(Enum.sort(Enum.map(l,&({length(&1),&1})),fn {n1,_},{n2,_} -> n1<=n2 end),fn {_,e} -> e end)
    l |> Enum.map(&({length(&1),&1})) |> Enum.sort(fn {n1,_},{n2,_} -> n1<=n2 end) |> Enum.map(fn {_,e} -> e end)
  end
end
