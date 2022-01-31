defmodule GraphqlTestTest do
  use ExUnit.Case
  doctest GraphqlTest

  test "greets the world" do
    assert GraphqlTest.hello() == :world
  end
end
