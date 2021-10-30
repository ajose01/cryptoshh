defmodule Ethbox.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :from, :string
    field :message, :string
    field :to, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:from, :to, :message])
    |> validate_required([:from, :to, :message])
  end
end
