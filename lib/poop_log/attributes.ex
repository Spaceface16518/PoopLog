defmodule PoopLog.Attributes do
  @moduledoc """
  The Attributes context.
  """

  import Ecto.Query, warn: false
  alias PoopLog.Repo

  alias PoopLog.Attributes.Condition

  @doc """
  Returns the list of condition.

  ## Examples

      iex> list_condition()
      [%Condition{}, ...]

  """
  def list_condition do
    Repo.all(Condition)
  end

  @doc """
  Gets a single condition.

  Raises if the Condition does not exist.

  ## Examples

      iex> get_condition!(123)
      %Condition{}

  """
  def get_condition!(id), do: raise("TODO")

  @doc """
  Creates a condition.

  ## Examples

      iex> create_condition(%{field: value})
      {:ok, %Condition{}}

      iex> create_condition(%{field: bad_value})
      {:error, ...}

  """
  def create_condition(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a condition.

  ## Examples

      iex> update_condition(condition, %{field: new_value})
      {:ok, %Condition{}}

      iex> update_condition(condition, %{field: bad_value})
      {:error, ...}

  """
  def update_condition(%Condition{} = condition, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Condition.

  ## Examples

      iex> delete_condition(condition)
      {:ok, %Condition{}}

      iex> delete_condition(condition)
      {:error, ...}

  """
  def delete_condition(%Condition{} = condition) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking condition changes.

  ## Examples

      iex> change_condition(condition)
      %Todo{...}

  """
  def change_condition(%Condition{} = condition, _attrs \\ %{}) do
    raise "TODO"
  end

  alias PoopLog.Attributes.Irritant

  @doc """
  Returns the list of irritant.

  ## Examples

      iex> list_irritant()
      [%Irritant{}, ...]

  """
  def list_irritant do
    Repo.all(Irritant)
  end

  @doc """
  Gets a single irritant.

  Raises if the Irritant does not exist.

  ## Examples

      iex> get_irritant!(123)
      %Irritant{}

  """
  def get_irritant!(id), do: raise("TODO")

  @doc """
  Creates a irritant.

  ## Examples

      iex> create_irritant(%{field: value})
      {:ok, %Irritant{}}

      iex> create_irritant(%{field: bad_value})
      {:error, ...}

  """
  def create_irritant(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a irritant.

  ## Examples

      iex> update_irritant(irritant, %{field: new_value})
      {:ok, %Irritant{}}

      iex> update_irritant(irritant, %{field: bad_value})
      {:error, ...}

  """
  def update_irritant(%Irritant{} = irritant, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Irritant.

  ## Examples

      iex> delete_irritant(irritant)
      {:ok, %Irritant{}}

      iex> delete_irritant(irritant)
      {:error, ...}

  """
  def delete_irritant(%Irritant{} = irritant) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking irritant changes.

  ## Examples

      iex> change_irritant(irritant)
      %Todo{...}

  """
  def change_irritant(%Irritant{} = irritant, _attrs \\ %{}) do
    raise "TODO"
  end
end
