defmodule PoopLog.Logs.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "meals" do
    field :description, :string
    field :notes, :string
    field :irritants, :id

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:description, :notes])
    |> validate_required([:description, :notes])
  end
end
