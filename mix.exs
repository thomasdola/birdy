defmodule Birdy.Mixfile do
  @moduledoc false

  use Mix.Project

  def project do
    [app: :birdy,
     version: "0.0.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     source_url: "https://github.com/thomasdola/birdy",
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {Birdy.Application, []}]
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
      {:httpoison, "~> 1.0", override: true},
      {:poison, "~> 3.1"},
      {:exvcr, "~> 0.10", only: :test, runtime: false},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
      {:credo, "~> 0.7.4", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp description do
    """
    A Simple Wrapper around MessageBird API
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :py_cryptx,
      maintainers: ["Thomas Paul"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/thomasdola/birdy"}
    ]
  end
end
