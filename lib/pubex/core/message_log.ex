defmodule Pubex.Core.MessageLog do
  @moduledoc """
  Message Log is a data structure for storing messages in a log.
  """
  defstruct messages: []

  @doc """
  Creates a new message log

  ## Examples

      iex> %Pubex.Core.MessageLog{messages: []} = new()
  """
  def new() do
    %__MODULE__{}
  end

  @doc """
  adds a new message to the message log

  ## Examples

      iex> log = new()
      iex> append(log, :foo)
      ...> |> messages()
      [:foo]
  """
  def append(log, message) do
    Map.update!(log, :messages, &[message | &1])
  end

  @doc """
  Retrieves all messages from the log

  ## Examples

    iex> log = new() |> append(:foo)
    iex> messages(log)
    [:foo]
  """
  def messages(%__MODULE__{messages: messages}) do
    messages
  end
end
