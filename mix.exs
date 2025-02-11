defmodule LocalCluster.MixProject do
  use Mix.Project

  @url_docs "http://hexdocs.pm/local_cluster"
  @url_github "https://github.com/whitfin/local-cluster"

  def project do
    version = version()

    [
      app: :local_cluster,
      name: "LocalCluster",
      description: "Easy local cluster creation to aid in unit testing",
      package: %{
        organization: "coingaming",
        files: [
          "lib",
          "mix.exs",
          "LICENSE",
          "VERSION"
        ],
        licenses: [ "MIT" ],
        links: %{
          "Docs" => @url_docs,
          "GitHub" => @url_github
        },
        maintainers: [ "Isaac Whitfield" ]
      },
      version: version,
      elixir: "~> 1.2",
      deps: deps(),
      docs: [
        main: "LocalCluster",
        source_ref: "v#{version}",
        source_url: @url_github,
      ],
      aliases: [
        test: "test --no-start"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:logger],
      extra_applications: [:logger]
    ]
  end

  defp version do
    case File.read("VERSION") do
      {:ok, v} -> String.trim(v)
      {:error, _} -> "0.0.0-development"
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Production dependencies
      { :global_flags, "~> 1.0" },
      # Local dependencies, not shipped with the app
      { :ex_doc, "~> 0.16", optional: true, only: [ :dev ] }
    ]
  end
end
