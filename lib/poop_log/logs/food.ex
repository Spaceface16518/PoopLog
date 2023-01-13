defmodule PoopLog.Logs.Food do
  alias PoopLog.Irritant
  use Ecto.Schema
  import Ecto.Changeset

  schema "meals" do
    field :description, :string
    field :notes, :string
    many_to_many :irritants, Irritant, join_through: "food_irritants"

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:description, :notes])
    |> validate_required([:description, :notes])
  end
end
