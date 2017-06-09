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
end
