defmodule PoopLog.Repo.Migrations.CreatePoops do
  use Ecto.Migration

  def change do
    create table(:poops) do
      add :conditions, references(:conditions, on_delete: :nothing)
      add :suspects, references(:food, on_delete: :nothing)

      timestamps()
    end

    create index(:poops, [:conditions])
    create index(:poops, [:suspects])
  end
end
