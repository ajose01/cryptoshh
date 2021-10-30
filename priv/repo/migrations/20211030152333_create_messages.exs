defmodule Ethbox.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :from, :string
      add :to, :string
      add :message, :string

      timestamps()
    end
  end
end
