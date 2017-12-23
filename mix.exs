defmodule MultiConsumer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :multi_consumer,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: false,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {MultiConsumer, []},
      applications: [
        :logger,
        :kafka_ex,
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kafka_ex, "~> 0.8.1"},
    ]
  end
end
