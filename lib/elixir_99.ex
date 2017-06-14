defmodule Elixir_99 do
  require Enum
  require Integer
  require MapSet
  use Bitwise
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

  def flatten(l) do
    Enum.reverse(flatten(l,[]))
  end
  def flatten([],a) do
    a
  end
  def flatten([x|xs],a) do
    if is_list x do
      flatten(xs,flatten(x,[]) ++ a)
    else
      flatten(xs,[x|a])
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
    Enum.reverse(flatten(a))
  end
  def duplicate([x|xs],a) do
    duplicate(xs,[[x,x]|a])
  end

  def replicate(l,n) do
    replicate(l,n,[])
  end
  def replicate([],_,a) do
    Enum.reverse(flatten(a))
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
    l 
    |> Enum.map(&({length(&1),&1})) 
    |> Enum.sort(fn {n1,_},{n2,_} -> n1<=n2 end) 
    |> Enum.map(fn {_,e} -> e end)
  end

  def lfsort(l) do
    l
    |> lsort
    |> Enum.group_by(&(length(&1)))
    |> Enum.map(fn {_,v} -> v end)
    |> Enum.sort
    |> lsort
    |> Enum.concat
  end

  def prime?(0) do
    false
  end
  def prime?(2) do
    true
  end
  def prime?(n) do
    Enum.empty?(Enum.drop_while(2..round(n/2), fn(x) -> rem(n,x) != 0 end))
  end

  def gcd(a,0) do
    a
  end
  def gcd(a,b) when a > 0 and b > 0 do
    gcd(b,rem(a,b))
  end

  def coprime?(a,b) when a > 0 and b > 0 do
    gcd(a,b) == 1
  end

  def totient_phi(1) do
    1
  end
  def totient_phi(m) do
    Enum.count(1..(m-1),fn(x) -> coprime?(x,m) end)
  end
  
  def prime_factors(n) when n > 0 do
    prime_factors(n,[])
  end
  def prime_factors(n,factors) do
    if prime?(n) do
      Enum.sort([n|factors])
    else
      f =
        2..round(n/2)
        |> Enum.drop_while(fn(x) -> not prime?(x) end)
        |> Enum.drop_while(fn(x) -> rem(n,x) != 0 end)
        |> hd()
      prime_factors(trunc(n/f),[f|factors])
    end
  end

  def prime_factors_mult(n) do
    n 
    |> prime_factors() 
    |> run_length_encode()
    |> Enum.map(fn({m,f}) -> {f,m} end)
  end

  def totient_phi_(1) do
    1
  end
  def totient_phi_(n) do
    #Enum.reduce(Enum.map(prime_factors_mult(n),fn({f,_}) -> 1-(1/f) end),n,fn(x,a) -> x*a end)
    n
    |> prime_factors_mult()
    |> Enum.map(fn({f,_}) -> 1-(1/f) end)
    |> Enum.reduce(n,fn(x,a) -> x*a end)
  end

  def primes(start,stop) do
    Enum.filter(start..stop,&(prime?(&1)))
  end

  def goldbach(n) do
    goldbach(n,primes(2,n))
  end
  def goldbach(n,p) do
    ps = MapSet.new(p)
    a = hd(Enum.drop_while(p,&(not MapSet.member?(ps,n-&1))))
    [a,n-a]
  end

  def goldbach_list(a,b) do
    p = primes(2,b)
    a..b
    |> Enum.filter(&(Integer.is_even(&1)))
    |> Enum.map(&(goldbach(&1,p)))
    |> Enum.map(fn([m,n]) -> {m+n,m,n} end)
  end

  def goldbach_list(a,b,min) do
    Enum.filter(goldbach_list(a,b),fn({_,f,_}) -> f > min end)
  end

  def permutations([]) do
    [[]]
  end
  def permutations(list) do
    for elem <- list, rest <- permutations(list--[elem]), do: [elem|rest]
  end

  def table(f) do
    for args <- selections([true,false],:erlang.fun_info(f)[:arity]), do: args++[apply(f,args)]
  end

  def selections(l,1) do
    Enum.map(l,&([&1]))
  end
  def selections(l,n) do
    ls = for _ <- 2..n, do: l
    acc = Enum.map(l,&([&1]))
    Enum.reduce(ls,acc,fn(x,a) -> for s <- a, e <- x, do: [e|s] end)
  end

  def gray(n) do
    gray(n-1,["0","1"])
  end
  def gray(0,a) do
    a
  end
  def gray(n,a) do
    gray(n-1,Enum.concat(Enum.map(a,&("0"<>&1)),Enum.map(Enum.reverse(a),&("1"<>&1))))
  end

  def gray_b(n) do
    gray_b(n,1,[0,1])
  end
  def gray_b(n,n,a) do
    a
  end
  def gray_b(n,bits,a) do
    mask = 1 <<< bits
    gray_b(n,bits+1,Enum.concat(a,Enum.map(Enum.reverse(a),&(mask ||| &1))))
  end
end
