defmodule PoopLog.Repo.Migrations.CreateMeals do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :description, :string
      add :notes, :string
      add :irritants, references(:irritants, on_delete: :nothing)

      timestamps()
    end

    create index(:meals, [:irritants])
  end
end
