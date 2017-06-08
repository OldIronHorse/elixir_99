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
end
