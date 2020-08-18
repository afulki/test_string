defmodule TestString do
  @opening ["{", "[", "("]
  @closing ["}", "]", ")"]

  def is_valid?(""), do: true

  def is_valid?(s) do
    stack = []

    String.graphemes(s)
    |> Enum.reduce_while(stack, fn c, acc ->
      cond do
        is_open_bracket(c) ->
          acc = Stack.push(acc, c)
          {:cont, acc}

        is_close_bracket(c) ->
          {acc, from_stack} = Stack.pop(acc)
          if match(from_stack, c), do: {:cont, acc}, else: {:halt, nil}

        true ->
          {:cont, acc}
      end
    end)
    |> case do
      [] -> true
      _ -> false
    end
  end

  defp is_open_bracket(c), do: Enum.member?(@opening, c)
  defp is_close_bracket(c), do: Enum.member?(@closing, c)

  defp match("{", "}"), do: true
  defp match("[", "]"), do: true
  defp match("(", ")"), do: true
  defp match(_, _), do: false
end
