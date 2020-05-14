defmodule Paredown.MixProject do
  use Mix.Project

  def project do
    [
      app: :paredown,
      version: "0.1.1",
      elixir: "~> 1.10",
      description: "Simple subset of Markdown for writing HTML.",
      source_url: github_url(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:phoenix_html, "~> 2.13"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{github: github_url()}
    ]
  end

  defp github_url do
    "https://github.com/RoyalIcing/paredown"
  end
end
