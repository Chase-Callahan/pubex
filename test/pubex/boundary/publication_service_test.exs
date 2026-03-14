defmodule Pubex.Boundary.PublicationServiceTest do
  use ExUnit.Case, async: true

  alias Pubex.Boundary.PublicationService

  test "stores a message in the log" do
    service = start_supervised!(PublicationService)

    :ok = PublicationService.publish(service, :message_1)

    :ok = PublicationService.publish(service, :message_2)

    {:ok, [:message_2, :message_1]} = PublicationService.messages(service)
  end
end
