defmodule PoopLog.Repo.Migrations.CreateConditions do
  use Ecto.Migration

  def change do
    create table(:conditions) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
