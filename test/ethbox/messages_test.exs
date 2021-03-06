defmodule Ethbox.MessagesTest do
  use Ethbox.DataCase

  alias Ethbox.Messages

  describe "messages" do
    alias Ethbox.Messages.Message

    import Ethbox.MessagesFixtures

    @invalid_attrs %{from: nil, message: nil, to: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{from: "some from", message: "some message", to: "some to"}

      assert {:ok, %Message{} = message} = Messages.create_message(valid_attrs)
      assert message.from == "some from"
      assert message.message == "some message"
      assert message.to == "some to"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{from: "some updated from", message: "some updated message", to: "some updated to"}

      assert {:ok, %Message{} = message} = Messages.update_message(message, update_attrs)
      assert message.from == "some updated from"
      assert message.message == "some updated message"
      assert message.to == "some updated to"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
