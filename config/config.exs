use Mix.Config

config :kafka_ex,
  brokers: [{"localhost", 9092}],
  consumer_group: "kafka_ex",
  disable_default_worker: false,
  sync_timeout: 3000,
  max_restarts: 10,
  max_seconds: 60,
  commit_interval: 100,
  commit_threshold: 100,
  use_ssl: false,
  kafka_version: "0.11.0"
