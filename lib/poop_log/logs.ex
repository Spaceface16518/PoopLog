defmodule PoopLog.Logs do
  @moduledoc """
  The Logs context.
  """

  import Ecto.Query, warn: false
  alias PoopLog.Repo

  alias PoopLog.Logs.Food

  @doc """
  Returns the list of meals.

  ## Examples

      iex> list_meals()
      [%Food{}, ...]

  """
  def list_meals do
    Repo.all(Food)
  end

  def recent_meals(limit) do
    Repo.all(
      from Food,
        order_by: [asc: :inserted_at],
        limit: ^limit
    )
  end

  @doc """
  Gets a single food.

  Raises `Ecto.NoResultsError` if the Food does not exist.

  ## Examples

      iex> get_food!(123)
      %Food{}

      iex> get_food!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food!(id), do: Repo.get!(Food, id)

  @doc """
  Creates a food.

  ## Examples

      iex> create_food(%{field: value})
      {:ok, %Food{}}

      iex> create_food(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food(attrs \\ %{}) do
    %Food{}
    |> Food.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food.

  ## Examples

      iex> update_food(food, %{field: new_value})
      {:ok, %Food{}}

      iex> update_food(food, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food(%Food{} = food, attrs) do
    food
    |> Food.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food.

  ## Examples

      iex> delete_food(food)
      {:ok, %Food{}}

      iex> delete_food(food)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food(%Food{} = food) do
    Repo.delete(food)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food changes.

  ## Examples

      iex> change_food(food)
      %Ecto.Changeset{data: %Food{}}

  """
  def change_food(%Food{} = food, attrs \\ %{}) do
    Food.changeset(food, attrs)
  end

  alias PoopLog.Logs.Poop

  @doc """
  Returns the list of poops.

  ## Examples

      iex> list_poops()
      [%Poop{}, ...]

  """
  def list_poops do
    Repo.all(Poop)
  end

  @doc """
  Gets a single poop.

  Raises `Ecto.NoResultsError` if the Poop does not exist.

  ## Examples

      iex> get_poop!(123)
      %Poop{}

      iex> get_poop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poop!(id), do: Repo.get!(Poop, id)

  @doc """
  Creates a poop.

  ## Examples

      iex> create_poop(%{field: value})
      {:ok, %Poop{}}

      iex> create_poop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poop(attrs \\ %{}) do
    %Poop{}
    |> Poop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poop.

  ## Examples

      iex> update_poop(poop, %{field: new_value})
      {:ok, %Poop{}}

      iex> update_poop(poop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poop(%Poop{} = poop, attrs) do
    poop
    |> Poop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a poop.

  ## Examples

      iex> delete_poop(poop)
      {:ok, %Poop{}}

      iex> delete_poop(poop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poop(%Poop{} = poop) do
    Repo.delete(poop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poop changes.

  ## Examples

      iex> change_poop(poop)
      %Ecto.Changeset{data: %Poop{}}

  """
  def change_poop(%Poop{} = poop, attrs \\ %{}) do
    Poop.changeset(poop, attrs)
  end
end
