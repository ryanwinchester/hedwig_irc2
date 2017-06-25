defmodule HedwigIRC.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hedwig_irc,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/ryanwinchester/hedwig_irc",
      name: "Hedwig IRC",
    ]
  end

  defp description do
    """
    Hedwig Bot Framework IRC Adapter
    """
  end

  defp package do
    [
      name: :hedwig_irc,
      maintainers: ["Ryan Winchester"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ryanwinchester/hedwig_irc"},
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      extra_applications: [:logger, :ssl, :inets],
      mod: {Hedwig.Adapters.IRC, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:hedwig, "~> 1.0"},
      {:exirc, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end
end
