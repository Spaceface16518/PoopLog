defmodule PoopLog.LogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PoopLog.Logs` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        description: "some description",
        notes: "some notes"
      })
      |> PoopLog.Logs.create_food()

    food
  end

  @doc """
  Generate a poop.
  """
  def poop_fixture(attrs \\ %{}) do
    {:ok, poop} =
      attrs
      |> Enum.into(%{

      })
      |> PoopLog.Logs.create_poop()

    poop
  end
end
