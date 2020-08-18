defmodule TestStringTest do
  use ExUnit.Case
  doctest TestString

  test "accepts pairs" do
    assert TestString.is_valid?("[]")
    assert TestString.is_valid?("{}")
    assert TestString.is_valid?("()")
  end

  test "accepts nested pairs" do
    assert TestString.is_valid?("[()]")
    assert TestString.is_valid?("{[]}")
    assert TestString.is_valid?("[()]")
  end

  test "accepts complex" do
    assert TestString.is_valid?("[({})]")
    assert TestString.is_valid?("[({}{})]")
    assert TestString.is_valid?("[{}({}{})]")
  end

  test "rejects unmatched" do
    refute TestString.is_valid?("]")
    refute TestString.is_valid?("}")
    refute TestString.is_valid?(")")
    refute TestString.is_valid?("[")
    refute TestString.is_valid?("(")
    refute TestString.is_valid?("{")
    refute TestString.is_valid?("[(]")
    refute TestString.is_valid?("(]")
  end
end
