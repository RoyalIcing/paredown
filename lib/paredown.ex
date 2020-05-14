defmodule Paredown do
  @moduledoc """
  Documentation for `Paredown`, a simple subset of Markdown.
  """

  @doc """
  Transform a line into HTML

  ## Examples

      iex> Paredown.line("This is some **bold** and *italicized* text")
      {:safe, "This is some <strong>bold</strong> and <em>italicized</em> text"}

      iex> Paredown.line("text with [link somewhere][1] interesting", links: %{"1" => "https://example.org/"})
      {:safe, ~s(text with <a href="https://example.org/">link somewhere</a> interesting)}

  """
  defdelegate line(input, options \\ []), to: Paredown.LineParser, as: :to_html
end
