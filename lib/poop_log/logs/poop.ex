defmodule PoopLog.Logs.Poop do
  alias PoopLog.Logs.Food
  alias PoopLog.Condition
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
    |> validate_required([])
  end
end
