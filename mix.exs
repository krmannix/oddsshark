defmodule OddsShark.Mixfile do
  use Mix.Project

  def project do
    [
      app: :oddsshark,
      version: "0.4.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
    ]
  end

  def application do
    [
      applications: [
        :httpoison,
        :logger,
      ],
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.0"},
    ]
  end

  defp description do
    """
    OddsShark API wrapper in Elixir
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :oddsshark,
     maintainers: ["K. Rodman Mannix"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/krmannix/oddsshark"}
    ]
  end
end
