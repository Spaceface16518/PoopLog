defmodule PoopLog.Logs.Poop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poops" do

    field :conditions, :id
    field :suspects, :id

    timestamps()
  end

  @doc false
  def changeset(poop, attrs) do
    poop
    |> cast(attrs, [])
    |> validate_required([])
  end
end
