defmodule D3flSimulator.MixProject do
  use Mix.Project

  def project do
    [
      app: :d3fl_simulator,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {D3flSimulator.Application, []},
      applications: [:export, :poolboy]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:export, "~> 0.1.0"},
      {:poolboy, "~> 1.5"},
      {:grpc, "~> 0.7"},
      {:protobuf, "~> 0.11"}
    ]
  end
end
