defmodule MultiConsumerTest do
  use ExUnit.Case
  doctest MultiConsumer

  test "greets the world" do
    assert MultiConsumer.hello() == :world
  end
end
