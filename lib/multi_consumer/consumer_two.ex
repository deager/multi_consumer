defmodule MultiConsumer.ConsumerTwo do
  use KafkaEx.GenConsumer
  alias KafkaEx.Protocol.Fetch.Message
  require Logger

  def handle_message_set(message_set, state) do
    for %Message{value: message} <- message_set do
      Logger.debug(fn -> "CONSUMER-TWO-MESSAGE: " <> inspect(message) end)
    end
    {:async_commit, state}
  end
end
