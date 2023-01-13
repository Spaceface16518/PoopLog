defmodule PoopLog.Repo.Migrations.CreateIrritants do
  use Ecto.Migration

  def change do
    create table(:irritants) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
