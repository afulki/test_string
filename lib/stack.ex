defmodule Stack do
  def push(stack, element) do
    [element | stack]
  end

  def pop([]), do: {[], nil}
  def pop([hd | rest]), do: {rest, hd}
end
