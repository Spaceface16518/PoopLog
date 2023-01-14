defmodule PoopLog.Logs.Food do
  alias PoopLog.Attributes.Irritant
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
    |> cast_assoc(:irritants, with: &Irritant.changeset/2)
    |> validate_required([:description, :notes, :irritants])
  end
end
