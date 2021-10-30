defmodule Ethbox.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ethbox.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        from: "some from",
        message: "some message",
        to: "some to"
      })
      |> Ethbox.Messages.create_message()

    message
  end
end
