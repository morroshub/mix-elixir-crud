defmodule PprojectoTest do
  use ExUnit.Case
  doctest Pprojecto

  test "greets the world" do
    assert Pprojecto.hello() == :world
  end
end
