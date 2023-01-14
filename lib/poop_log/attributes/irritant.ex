defmodule PoopLog.Attributes.Irritant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "irritants" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(irritant, attrs) do
    irritant
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
