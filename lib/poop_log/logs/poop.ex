defmodule PoopLog.Logs.Poop do
  alias PoopLog.Logs.Food
  alias PoopLog.Attributes.Condition
  use Ecto.Schema
  import Ecto.Changeset

  schema "poops" do
    many_to_many :conditions, Condition, join_through: "poop_conditions"
    many_to_many :suspects, Food, join_through: "poop_suspects"

    timestamps()
  end

  @doc false
  def changeset(poop, attrs) do
    poop
    |> cast(attrs, [])
    |> cast_assoc(:conditions, with: &Condition.changeset/2)
    |> cast_assoc(:suspects, with: &Food.changeset/2)
    |> validate_required([:conditions, :suspects])
  end
end
