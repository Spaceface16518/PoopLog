defmodule PoopLog.Attributes.Condition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conditions" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(condition, attrs) do
    condition
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
