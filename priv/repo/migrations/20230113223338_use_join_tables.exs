defmodule PoopLog.Repo.Migrations.UseJoinTables do
  use Ecto.Migration

  def change do
    # meals table
    create table(:food_irritants, primary_key: false) do
      add :food_id, references(:meals, on_delete: :delete_all), primary_key: true
      add :irritant_id, references(:irritants, on_delete: :delete_all), primary_key: true
    end

    drop index(:meals, [:irritants])

    alter table(:meals) do
      remove :irritants
    end

    # poops table
    create table(:poop_conditions, primary_key: false) do
      add :poop_id, references(:poops, on_delete: :delete_all), primary_key: true
      add :condition_id, references(:conditions, on_delete: :delete_all), primary_key: true
    end

    create table(:poop_suspects, primary_key: false) do
      add :poop_id, references(:poops, on_delete: :delete_all), primary_key: true
      add :food_id, references(:meals, on_delete: :delete_all), primary_key: true
    end

    drop index(:poops, [:conditions])
    drop index(:poops, [:suspects])

    alter table(:poops) do
      remove :conditions
      remove :suspects
    end
  end
end
