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
end
