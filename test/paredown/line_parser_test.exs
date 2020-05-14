defmodule Paredown.LineParserTest do
  use ExUnit.Case, async: true
  alias Paredown.LineParser, as: Subject
  doctest Paredown.LineParser

  use Phoenix.HTML

  describe "to_html/2" do
    test "plain text" do
      assert Subject.to_html("plain text") == raw("plain text")
    end

    test "italics with _" do
      assert Subject.to_html("text _italics_ normal") == raw("text <em>italics</em> normal")
    end

    test "italics with *" do
      assert Subject.to_html("text *italics* normal") == raw("text <em>italics</em> normal")
    end

    test "bold with **" do
      assert Subject.to_html("text **bold** normal") == raw("text <strong>bold</strong> normal")
    end

    test "link with inline url" do
      assert Subject.to_html("text with [link](https://example.org/) somewhere") ==
               raw("text with <a href=\"https://example.org/\">link</a> somewhere")
    end

    test "link with self as reference" do
      assert Subject.to_html("text with [link somewhere] interesting",
               links: %{
                 "link somewhere" => "https://example.org/"
               }
             ) ==
               raw("text with <a href=\"https://example.org/\">link somewhere</a> interesting")
    end

    test "link with text as reference" do
      assert Subject.to_html("text with [link somewhere][example org] interesting",
               links: %{
                 "example org" => "https://example.org/"
               }
             ) ==
               raw("text with <a href=\"https://example.org/\">link somewhere</a> interesting")
    end

    test "link with number as reference" do
      assert Subject.to_html("text with [link somewhere][1] interesting",
               links: %{
                 "1" => "https://example.org/"
               }
             ) ==
               raw("text with <a href=\"https://example.org/\">link somewhere</a> interesting")
    end

    test "multiple links" do
      assert Subject.to_html("text with [link somewhere] interesting and [another one] to visit",
               links: %{
                 "link somewhere" => "https://example.org/somewhere",
                 "another one" => "https://example.org/another"
               }
             ) ==
               raw("text with <a href=\"https://example.org/somewhere\">link somewhere</a> interesting and <a href=\"https://example.org/another\">another one</a> to visit")
    end
  end
end
