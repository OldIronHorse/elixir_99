defmodule Elixir_99Test do
  use ExUnit.Case
  doctest Elixir_99
  import Elixir_99

#Lists

  test "P01: last" do
    assert my_last([:a,:b,:c,:d]) == :d
  end

  test "P01f: last" do
    assert f_last([:a,:b,:c,:d]) == :d
  end

  test "P02: but_last" do
    assert my_but_last([:a]) == [:a]
    assert my_but_last([:a,:b]) == [:a,:b]
    assert my_but_last([:a,:b,:c,:d]) == [:c,:d]
  end

  test "P02f: but_last" do
    assert f_but_last([:a]) == [:a]
    assert f_but_last([:a,:b]) == [:a,:b]
    assert f_but_last([:a,:b,:c,:d]) == [:c,:d]
  end

  test "P03: element_at (kth element)" do
    assert element_at([:a,:b,:c,:d,:e],3) == :c
  end

  test "P03f: element_at (kth element)" do
    assert f_element_at([:a,:b,:c,:d,:e],3) == :c
  end

  test "P04: count_elements" do
    assert count_elements([]) == 0
    assert count_elements([:a]) == 1
    assert count_elements([:a,:b,:c,:d,:e]) == 5
  end

  test "P04f: count_elements" do
    assert f_count_elements([]) == 0
    assert f_count_elements([:a]) == 1
    assert f_count_elements([:a,:b,:c,:d,:e]) == 5
  end

  test "P05: reverse a list" do
    assert my_reverse([]) == []
    assert my_reverse([:a]) == [:a]
    assert my_reverse([:a,:b,:c,:d,:e]) == [:e,:d,:c,:b,:a]
  end

  test "P06: is_palindrome" do
    refute is_palindrome([])
    assert is_palindrome([:a])
    assert is_palindrome([:a,:a])
    refute is_palindrome([:a,:b])
    assert is_palindrome([:a,:b,:a])
    assert is_palindrome([:a,:b,:b,:a])
    refute is_palindrome([:a,:b,:c,:a])
  end

  test "P07: Flatten a nested list structure" do
    assert flatten([]) == []
    assert flatten([:a,:b,:c,:d,:e]) == [:a,:b,:c,:d,:e]
    assert flatten([:a,[:b,[:c,:d],:e]]) == [:a,:b,:c,:d,:e]
  end

  test "P08: Eliminate consecutive duplicates from a list" do
    assert compress([]) == []
    assert compress([:a,:b,:c,:d,:e]) == [:a,:b,:c,:d,:e]
    assert compress([:a,:a,:a,:a,:b,:c,:c,:a,:a,:d,:e,:e,:e,:e]) == [:a,:b,:c,:a,:d,:e]
  end

  test "P09: Pack consecutive duplicates into suplists" do
    assert pack([]) == []
    assert pack([:a]) == [[:a]]
    assert pack([:a,:a,:a,:a,:b,:c,:c,:a,:a,:d,:e,:e,:e,:e]) == [[:a,:a,:a,:a],[:b],[:c,:c],[:a,:a],[:d],[:e,:e,:e,:e]]
  end

  test "P10: run-length encode a list" do
    assert run_length_encode([]) == []
    assert run_length_encode([:a]) == [{1,:a}]
    assert run_length_encode([:a,:a,:a,:a,:b,:c,:c,:a,:a,:d,:e,:e,:e,:e]) == [{4,:a},{1,:b},{2,:c},{2,:a},{1,:d},{4,:e}]
  end

  test "P10a: run-length encode a list (pack/map)" do
    assert run_length_encode_([]) == []
    assert run_length_encode_([:a]) == [{1,:a}]
    assert run_length_encode_([:a,:a,:a,:a,:b,:c,:c,:a,:a,:d,:e,:e,:e,:e]) == [{4,:a},{1,:b},{2,:c},{2,:a},{1,:d},{4,:e}]
  end

  test "P11: Modified run-length encodeing" do
    assert mod_run_length_encode([]) == []
    assert mod_run_length_encode([:a]) == [:a]
    assert mod_run_length_encode([:a,:a]) == [{2,:a}]
    assert mod_run_length_encode([:a,:a,:a,:a,:b,:c,:c,:a,:a,:d,:e,:e,:e,:e]) == [{4,:a},:b,{2,:c},{2,:a},:d,{4,:e}]
  end

  test "P12: Decode a run-length encoded list" do
    assert run_length_decode([]) == []
    assert run_length_decode([{1,:a}]) == [:a]
    assert run_length_decode([{4,:a},{1,:b},{2,:c},{2,:a},{1,:d},{4,:e}]) == [:a,:a,:a,:a,:b,:c,:c,:a,:a,:d,:e,:e,:e,:e]
  end

  test "P14: duplicate the elements of a list" do
    assert duplicate([]) == []
    assert duplicate([:a,:b,:c,:c,:d]) == [:a,:a,:b,:b,:c,:c,:c,:c,:d,:d]
  end

  test "P15: replicate the elements of a list a given number of times" do
    assert replicate([],5) == []
    assert replicate([:a,:b,:c],1) == [:a,:b,:c]
    assert replicate([:a,:b,:c],3) == [:a,:a,:a,:b,:b,:b,:c,:c,:c]
  end

  test "P16: drop every nth element from a list" do
    assert drop([],3) == []
    assert drop([:a,:b],3) == [:a,:b]
    assert drop([:a,:b,:c,:d,:e,:f,:g,:h,:i,:k],3) == [:a,:b,:d,:e,:g,:h,:k]
  end

  test "P17: split a list into 2 parts; the length of the first part is given" do
    assert split([],2) == [[],[]]
    assert split([:a,:b],3) == [[:a,:b],[]]
    assert split([:a,:b],0) == [[],[:a,:b]]
    assert split([:a,:b,:c,:d,:e,:f,:g,:h,:k],3) == [[:a,:b,:c],[:d,:e,:f,:g,:h,:k]]
  end

  test "P18: extract a slice from a list between 2 1-base indicies" do
    assert slice([],4, 9) == []
    assert slice([:a,:b,:c,:d,:e,:f,:g,:h,:i,:k],3,7) == [:c,:d,:e,:f,:g]
    assert slice([:a,:b,:c,:d,:e,:f,:g,:h,:i,:k],5,15) == [:e,:f,:g,:h,:i,:k]
  end

  test "P19: rotate a list n places to the left" do
    assert rotate_left([],3) == []
    assert rotate_left([:a,:b,:c,:d,:e,:f,:g,:h],3) == [:d,:e,:f,:g,:h,:a,:b,:c]
    assert rotate_left([:a,:b,:c,:d,:e,:f,:g,:h],-2) == [:g,:h,:a,:b,:c,:d,:e,:f]
  end

  test "P20: remove the kth element of a list" do
    assert remove_at([],10) == []
    assert remove_at([:a,:b,:c,:d],10) == [:a,:b,:c,:d]
    assert remove_at([:a,:b,:c,:d],2) == [:a,:c,:d]
  end

  test "P21: insert an element at the kth position in a list" do
    assert insert_at([],:alpha,2) == [:alpha]
    assert insert_at([:a,:b,:c,:d],:alpha,2) == [:a,:alpha,:b,:c,:d]
    assert insert_at([:a,:b,:c,:d],:alpha,1) == [:alpha,:a,:b,:c,:d]
    assert insert_at([:a,:b,:c,:d],:alpha,20) == [:a,:b,:c,:d,:alpha]
  end

  test "P22: create a list of all integers in a given range" do
    assert range(4,9) == [4,5,6,7,8,9]
    assert range(4,4) == [4]
    assert range(9,4) == [9,8,7,6,5,4]
  end

  test "P26: combnations of K elements from a list" do
    assert combinations(1,[]) == []
    assert combinations(1,[:a,:b,:c,:d]) == [[:a],[:b],[:c],[:d]]
    assert combinations(2,[:a,:b,:c,:d]) == [[:a,:b],[:a,:c],[:a,:d],[:b,:c],[:b,:d],[:c,:d]]
    assert length(combinations(3,Enum.to_list(1..12))) == 220
  end

  test "P28a: sort a list of lists according to the length of the sublists" do
    assert lsort([[:a,:b,:c],[:d,:e],[:f,:g,:h],[:d,:e],[:i,:j,:k,:l],[:m,:n],[:o]]) == 
      [[:o],[:d,:e],[:d,:e],[:m,:n],[:a,:b,:c],[:f,:g,:h],[:i,:j,:k,:l]]
    assert lsort([]) == []
  end

  test "P28b: sort a list of lists by frequency of length, rarest first" do
    assert lfsort([[:a,:b,:c],[:d,:e],[:f,:g,:h],[:d,:e],[:i,:j,:k,:l],[:m,:n],[:o]]) == 
      [[:i,:j,:k,:l],[:o],[:a,:b,:c],[:f,:g,:h],[:d,:e],[:d,:e],[:m,:n]]
  end

#Arithmetic

  test "P31: determine if a given integer is prime" do
    refute prime?(0)
    refute prime?(1)
    assert prime?(2)
    assert prime?(3)
    refute prime?(4)
    assert prime?(5)
    refute prime?(6)
    assert prime?(7)
    refute prime?(8)
    refute prime?(9)
    refute prime?(10)
    assert prime?(11)
    assert prime?(677)
    refute prime?(679)
  end

  test "P32: determine the greatest common divisor of 2 positive integers using Euclid's algorithm" do
    assert gcd(36,63) == 9
  end

  test "P33: determine if 2 positive integers are coprime" do
    assert coprime?(35,64)
    refute coprime?(16,20)
  end
  
  test "P34: calculate Euler's totient function phi(m)" do
    assert totient_phi(10) == 4
    assert totient_phi(1) == 1
  end

  test "P35: determine the prime factors of a given positive integer" do
    assert prime_factors(315) == [3,3,5,7]
  end

  test "P36: determine the mulitiplicty of prime factors of a given positive integer" do
    assert prime_factors_mult(315) == [{3,2},{5,1},{7,1}]
  end

  test "P37: calculate Euler's totient function phi(m) (improved)" do
    assert totient_phi_(10) == 4
    assert totient_phi_(1) == 1
  end

  test "P39: find the prime numbers in a giver range" do
    assert primes(5,17) == [5,7,11,13,17]
  end

  test "P40: Goldbach's cojecture. Find 2 primes that sum to a given positive integer" do
    assert goldbach(28) == [5,23]
  end

  test "P41: list of Goldbach compositions" do
    assert goldbach_list(9,20) == [{10,3,7},{12,5,7},{14,3,11},{16,3,13},{18,5,13},{20,3,17}]
  end

  test "P41a: list of Goldbach compositions with both numbers bigger than n" do
    assert goldbach_list(990,2000,50) == [{992,73,919},{1382,61,1321},{1856,67,1789},{1928,61,1867}]
  end

# Logic and Codes

  test "generate all possible selections of n element from a list of m where n may exceed m" do
    assert selections([:a,:b],1) == [[:a],[:b]]
    assert selections([:a,:b],2) == [[:a,:a],[:b,:a],[:a,:b],[:b,:b]]
    assert selections([:a,:b],3) == [[:a,:a,:a],
                                     [:b,:a,:a],
                                     [:a,:b,:a],
                                     [:b,:b,:a],
                                     [:a,:a,:b],
                                     [:b,:a,:b],
                                     [:a,:b,:b],
                                     [:b,:b,:b]]
  end

  test "P46: truth table for logical expressions" do
    assert table(fn(a,b) -> a and (a or b) end) == [[true,true,true],
                                                    [false,true,false],
                                                    [true,false,true],
                                                    [false,false,false]]
  end

  test "P48: generalise true table" do
    assert table(fn(a,b,c) -> (a and (b or c)) == (a and b or a and c) end) == [[true,true,true,true],
                                                                                [false,true,true,true],
                                                                                [true,false,true,true],
                                                                                [false,false,true,true],
                                                                                [true,true,false,true],
                                                                                [false,true,false,true],
                                                                                [true,false,false,true],
                                                                                [false,false,false,true]]
  end

  test "P49: Gray code" do
    assert gray(1) == ["0","1"]
    assert gray(2) == ["00","01","11","10"]
    assert gray(3) == ["000","001","011","010","110","111","101","100"]
  end

  test "P49a: binary Gray code" do
    assert gray_b(1) == [0b0,0b1]
    assert gray_b(2) == [0b00,0b01,0b11,0b10]
    assert gray_b(3) == [0b000,0b001,0b011,0b010,0b110,0b111,0b101,0b100]
  end

  test "P50a: generate Huffman code map from a frequency list" do
    assert huffman([{:a,45},{:b,13},{:c,12},{:d,16},{:e,9},{:f,5}]) ==
      %{:a => "0",:b => "101",:c => "100",:d => "111",:e => "1101",:f => "1100"}
  end

# Binary Trees
  test "P54a: Check if a given argument is a tree" do
    refute tree?(:a)
    refute tree?({:a})
    refute tree?({nil})
    refute tree?({:a,nil})
    refute tree?({nil,nil})
    refute tree?({:a,:b})
    refute tree?({:a,:b,nil})
    refute tree?({:a,nil,:b})
    assert tree?({:a,nil,nil})
    assert tree?({:a,{:b,nil,nil},nil})
    assert tree?({:a,{:b,nil,nil},{:c,nil,nil}})
    refute tree?({:a,{:b,nil,nil},{:c,nil}})
    assert tree?({:a,nil,{:b,nil,nil}})
  end

  test "P55a: cbal_tree?" do
    assert cbal_tree?({:x,nil,nil})
    assert cbal_tree?({:x,{:x,nil,nil},nil})
    assert cbal_tree?({:x,nil,{:x,nil,nil}})
    assert cbal_tree?({:x,{:x,nil,nil},{:x,nil,nil}})
    refute cbal_tree?({:x,nil,{:x,{:x,nil,nil},nil}})
    refute cbal_tree?({:x,nil,{:x,nil,{:x,nil,nil}}})
    refute cbal_tree?({:x,{:x,{:x,nil,nil},nil},nil})
    refute cbal_tree?({:x,{:x,nil,{:x,nil,nil}},nil})
  end

  #test "P55: Constrect completely balanced binary trees" do
    #assert cbal_tree(1) == [{:x,nil,nil}]
    #assert cbal_tree(2) == [{:x,{:x,nil,nil},nil},
                            #{:x,nil,{:x,nil,nil}}]
    #assert cbal_tree(3) == [{:x,{:x,nil,nil}.{:x,nil,nil}}]
    #assert cbal_tree(4) == [{:x,{:x,{:x,nil,nil},nil},{:x,nil,nil}},
                            #{:x,{:x,nil,{:x,nil,nil}},{:x,nil,nil}},
                            #{:x,{:x,nil,nil},{:x,{:x,nil,nil},nil}},
                            #{:x,{:x,nil,nil},{:x,nil,{:x,nil,nil}}}]
    #assert cbal_tree(5) == [{:x,{:x,{:x,nil,nil},nil},{:x,{:x,nil,nil},nil}},
                            #{:x,{:x,nil,{:x,nil,nil}},{:x,nil,{:x,nil,nil}}},
                            #{:x,{:x,nil,{:x,nil,nil}},{:x,{:x,nil,nil},nil}},
                            #{:x,{:x,{:x,nil,nil},nil},{:x,nil,{:x,nil,nil}}}]
  #end

  test "P56: symmetric_structure?" do
    assert symmetric_structure?({:a,nil,nil})
    refute symmetric_structure?({:a,{:b,nil,nil},nil})
    refute symmetric_structure?({:a,nil,{:b,nil,nil}})
    assert symmetric_structure?({:a,{:c,nil,nil},{:b,nil,nil}})
    refute symmetric_structure?({:a,{:c,{:d,nil,nil},nil},{:b,nil,nil}})
    refute symmetric_structure?({:a,{:c,{:d,nil,nil},nil},{:b,{:e,nil,nil},nil}})
    assert symmetric_structure?({:a,{:c,{:d,nil,nil},nil},{:b,nil,{:e,nil,nil}}})
  end

  test "P57a: add a node to a binary search tree" do
    assert add(2,{3,nil,nil}) == {3,{2,nil,nil},nil}
    assert add(4,{3,nil,nil}) == {3,nil,{4,nil,nil}}
  end

  test "P57: Binary search tree" do
    assert binary_search_tree([3,2,5,7,1]) == {3,{2,{1,nil,nil},nil},{5,nil,{7,nil,nil}}}
  end

  test "P57b: Rotate tree left" do
    assert tree_rotate_left({3,{2,{1,nil,nil},nil},{5,{4,nil,nil},{7,nil,nil}}}) ==
      {5,{4,{3,{2,{1,nil,nil},nil},nil},nil},{7,nil,nil}}
    assert tree_rotate_left({:a,nil,nil}) == {:a,nil,nil}
  end
end
