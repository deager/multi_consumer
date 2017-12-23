defmodule MultiConsumer do

  def start(_type, _args) do
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  defp children() do
    import Supervisor.Spec

    consumer_group_opts = [
      heartbeat_interval: 1_000,  # setting for the ConsumerGroup
      commit_interval: 1_000,     # this setting will be forwarded to the GenConsumer
    ]

    [
      supervisor(
        KafkaEx.ConsumerGroup,
        [
          MultiConsumer.ConsumerOne,    # gen consumer impl
          "kafka_ex",                   # consumer group name
          ["test"],                     # topic names
          consumer_group_opts           # consumer group options
        ],
        id: :consumer_group_1           # for creating unique child processes
      ),
      supervisor(
        KafkaEx.ConsumerGroup,
        [
          MultiConsumer.ConsumerTwo,
          "kafka_ex2",
          ["test2"],
          consumer_group_opts
        ],
        id: :consumer_group_2
      ),
    ]
  end
end
