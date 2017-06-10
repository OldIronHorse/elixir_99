defmodule Elixir_99Test do
  use ExUnit.Case
  doctest Elixir_99
  import Elixir_99

  test "P01: last" do
    assert my_last([:a,:b,:c,:d]) == :d
  end

  test "P02: but_last" do
    assert my_but_last([:a,:b,:c,:d]) == [:c,:d]
  end

  test "P03: element_at (kth element)" do
    assert element_at([:a,:b,:c,:d,:e],3) == :c
  end

  test "P04: count_elements" do
    assert count_elements([]) == 0
    assert count_elements([:a]) == 1
    assert count_elements([:a,:b,:c,:d,:e]) == 5
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
    assert my_flatten([]) == []
    assert my_flatten([:a,:b,:c,:d,:e]) == [:a,:b,:c,:d,:e]
    assert my_flatten([:a,[:b,[:c,:d],:e]]) == [:a,:b,:c,:d,:e]
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
end
