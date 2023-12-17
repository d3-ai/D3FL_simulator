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
      {:protobuf, "~> 0.12.0"},
      # Only for files generated from Google's protos.
      # Can be ignored if you don't use Google's protos.
      # Or you can generate the code by yourself.
      {:google_protos, "~> 0.1"}
    ]
  end
end
