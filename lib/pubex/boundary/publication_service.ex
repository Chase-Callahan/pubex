defmodule Pubex.Boundary.PublicationService do
  use GenServer

  alias Pubex.Core.MessageLog

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{log: MessageLog.new()})
  end

  def publish(service, message) do
    GenServer.call(service, {:publish, message})
  end

  def messages(service) do
    GenServer.call(service, :messages)
  end

  def handle_call({:publish, message}, _from, state) do
    updated_state = Map.update!(state, :log, &MessageLog.append(&1, message))

    {:reply, :ok, updated_state}
  end

  def handle_call(:messages, _from, state) do
    {:reply, {:ok, MessageLog.messages(state.log)}, state}
  end
end
